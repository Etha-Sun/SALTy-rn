#!/usr/bin/env python3
"""Check this package without importing any experiment-directory .vo files."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import shutil
import subprocess
import tempfile
import time

from prepare import CASE, HERE, kernel_audit, review_units, write_unit


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    if not __debug__:
        raise RuntimeError('Run this checker without Python -O; source guards use assert.')
    parser = argparse.ArgumentParser()
    parser.add_argument('--review-only', action='store_true', help='Check spec functions and their dependency closure only')
    parser.add_argument('--config', type=Path, default=HERE.parents[5] / 'research/qcp-shim-vadd/results/coq-flags.json')
    args = parser.parse_args()
    config = json.loads(args.config.read_text())
    manifest = json.loads((HERE / 'manifest.json').read_text())
    kernel_audit()
    for item in manifest['files']:
        path = CASE / item['path']
        assert sha(path) == item['sha256'], 'Packaged source changed: ' + str(path)
    build = CASE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='review-' if args.review_only else 'full-', dir=build))
    shutil.copyfile(CASE / 'spec.c', run / 'spec.c')
    print('Run:', run, flush=True)
    records = []
    status = {'passed': False, 'scope': 'review' if args.review_only else 'full',
              'original_kernel_tokens_preserved': True, 'kernel_contracts_match_spec': True,
              'run_directory': str(run), 'spec_sha256': sha(CASE / 'spec.c'), 'records': records}

    def execute(command, label, timeout=180):
        command = list(map(str, command))
        started = time.monotonic()
        log = run / (label + '.log')
        with log.open('w') as output:
            result = subprocess.run(command, cwd=config['cwd'], stdout=output, stderr=output, timeout=timeout)
        records.append({'label': label, 'command': command, 'exit_code': result.returncode,
                        'seconds': time.monotonic() - started, 'log_sha256': sha(log)})
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        print(label, result.returncode, flush=True)
        if result.returncode:
            raise RuntimeError(log.read_text()[-3000:])

    review = review_units()
    review_namespaces = {'QcpVadd', 'NanBridge', 'VaddComparator', 'VaddWrapper', ''}
    modules = [item for item in manifest['modules'] if not args.review_only or item['namespace'] in review_namespaces]
    flags = config['flags'][2:]
    for namespace in dict.fromkeys(item['namespace'] for item in modules):
        folder = run / 'coq' / (namespace or 'relations')
        folder.mkdir(parents=True)
        flags += ['-Q', str(folder), namespace]
    for item in modules:
        source = HERE / item['path']
        text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        if not item['name'].endswith('_goal.v'):
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', text), str(source)
        shutil.copyfile(source, run / item['path'])

    slp = []
    for directory in sorted((HERE / 'c').iterdir()):
        slp += ['-slp', str(directory), directory.name]
    goal_names = {'ByValue/neon.c': 'neon_unit', 'ByValue/shim.c': 'shim_unit',
                  'ByvalueRvv/macro_rvv.c': 'macro_unit'}
    try:
        for item in manifest['units']:
            namespace = item['namespace']
            if args.review_only and namespace not in review_namespaces:
                continue
            source = HERE / item['path']
            relative = str(source.relative_to(HERE / 'c'))
            stem = goal_names.get(relative, source.stem)
            unit_dir = run / 'units' / namespace
            unit_dir.mkdir(parents=True, exist_ok=True)
            source_copy = unit_dir / (stem + '.c')
            write_unit(source, review.get(source, source.read_text()), source_copy)
            expanded = unit_dir / (stem + '_expanded.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', source_copy, '-o', expanded], namespace + '-' + stem + '-cpp')
            # Keep the input basename stable: QCP uses it for the generated module name.
            source_copy.write_bytes(expanded.read_bytes())
            generated = unit_dir / 'generated'
            generated.mkdir(exist_ok=True)
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc', '--no-exec-info',
                     '--input-file=' + str(source_copy), '--coq-output-dir=' + str(generated),
                     '--coq-logic-path=' + namespace, *slp], namespace + '-' + stem + '-qcp', 240)
            fresh = generated / (stem + '_goal.v')
            checked = HERE / 'coq' / namespace / fresh.name
            assert fresh.read_bytes() == checked.read_bytes(), 'Generated goal drift: ' + str(fresh)
            shutil.copyfile(fresh, run / 'coq' / namespace / fresh.name)

        strategy = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        for directory in sorted((HERE / 'c').iterdir()):
            if args.review_only and directory.name not in review_namespaces:
                continue
            for source in sorted(directory.glob('*.strategies')):
                generated = run / ('strategy-' + source.stem)
                generated.mkdir()
                execute([strategy, '--arch=64', '--endian=little', '--no-exec-info',
                         '--input-file=' + str(source), '--coq-output-dir=' + str(generated),
                         '--coq-logic-path=' + directory.name], source.stem + '-strategy')
                fresh = generated / (source.stem + '_strategy_goal.v')
                assert fresh.read_bytes() == (HERE / 'coq' / directory.name / fresh.name).read_bytes(), 'Strategy goal drift'

        for item in modules:
            execute(['qcp-env', 'coqc', *flags, run / item['path']],
                    (item['namespace'] or 'relations') + '-' + Path(item['name']).stem, 180)
        assert sha(CASE / 'spec.c') == sha(run / 'spec.c'), 'spec.c changed during checking'
        status.update(passed=True, freshly_compiled_local_modules=len(modules),
                      c_shim_equivalence_checked=not args.review_only,
                      reused_experiment_vo_files=False,
                      limits=['C-shim partial correctness under the contracts in spec.c.',
                              'QCP/Coq/Flocq external libraries are reused.',
                              'No hardware-to-shim correspondence or termination theorem.'])
    finally:
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / ('review-status.json' if args.review_only else 'status.json')).write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({key: status[key] for key in ['passed', 'scope', 'freshly_compiled_local_modules']}), flush=True)


if __name__ == '__main__':
    main()
