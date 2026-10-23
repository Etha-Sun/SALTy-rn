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
import threading
import time

from prepare import CASE, HERE, REPO, kernel_audit, review_units, write_unit, tokens
from coverage import check_coverage
from parallel import compile_modules


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    if not __debug__:
        raise RuntimeError('Run this checker without Python -O; source guards use assert.')
    parser = argparse.ArgumentParser()
    parser.add_argument('--review-only', action='store_true', help='Check spec functions and their dependency closure only')
    parser.add_argument('--jobs', type=int, default=1, help='Maximum concurrent Coq compilers; dependencies are checked with coqdep')
    parser.add_argument('--resume-run', type=Path, help='Continue completed work from this same interrupted run; sources must match')
    parser.add_argument('--config', type=Path, default=HERE.parents[5] / 'research/qcp-shim-vadd/results/coq-flags.json')
    args = parser.parse_args()
    assert args.jobs > 0, '--jobs must be positive'
    config = json.loads(args.config.read_text())
    manifest = json.loads((HERE / 'manifest.json').read_text())
    kernels = kernel_audit()
    for item in manifest['files']:
        path = CASE / item['path']
        assert sha(path) == item['sha256'], 'Packaged source changed: ' + str(path)
    build = CASE / '.build'
    build.mkdir(exist_ok=True)
    run = args.resume_run.resolve() if args.resume_run else Path(tempfile.mkdtemp(prefix='review-' if args.review_only else 'full-', dir=build))
    assert run.parent == build.resolve(), 'Resume only a run in this case .build directory'
    if not args.resume_run:
        shutil.copyfile(CASE / 'spec.c', run / 'spec.c')
    print('Run:', run, flush=True)
    records = []
    status = {'passed': False, 'scope': 'review' if args.review_only else 'full',
              'original_kernel_tokens_preserved': True, 'kernel_contracts_match_spec': True,
              'run_directory': str(run), 'spec_sha256': sha(CASE / 'spec.c'), 'records': records}
    if args.resume_run:
        status = json.loads((run / 'status.json').read_text())
        assert not status['passed'], 'Run already passed'
        assert status['scope'] == ('review' if args.review_only else 'full'), 'Resume scope mismatch'
        assert sha(CASE / 'spec.c') == status['spec_sha256'] == sha(run / 'spec.c'), 'Resume spec changed'
        records = status['records']
        assert all(r['exit_code'] == 0 for r in records), 'Cannot resume a failed proof command'
        shutil.copyfile(run / 'status.json', run / ('status-before-resume-' + str(time.time_ns()) + '.json'))
    status.update(parallel_jobs=args.jobs, resumed_same_run=bool(args.resume_run))
    record_lock = threading.Lock()

    def execute(command, label, timeout=180):
        command = list(map(str, command))
        started = time.monotonic()
        log = run / (label + '.log')
        cwd = config['cwd']
        if command[:2] == ['qcp-env', 'coqc']:
            cwd = run / 'jobs' / label
            cwd.mkdir(parents=True, exist_ok=True)
        with log.open('w') as output:
            result = subprocess.run(command, cwd=cwd, stdout=output, stderr=output, timeout=timeout)
        with record_lock:
            records.append({'label': label, 'command': command, 'exit_code': result.returncode,
                            'seconds': time.monotonic() - started, 'log_sha256': sha(log), 'cwd': str(cwd)})
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
        folder.mkdir(parents=True, exist_ok=True)
        flags += ['-Q', str(folder), namespace]
    for item in modules:
        source = HERE / item['path']
        text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        if not item['name'].endswith('_goal.v'):
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', text), str(source)
        if args.resume_run:
            assert source.read_bytes() == (run / item['path']).read_bytes(), 'Resume Coq source changed: ' + str(source)
        else:
            shutil.copyfile(source, run / item['path'])

    slp = []
    for directory in sorted((HERE / 'c').iterdir()):
        slp += ['-slp', str(directory), directory.name]
    expanded_units = []
    try:
        for item in manifest['units']:
            namespace = item['namespace']
            if args.review_only and namespace not in review_namespaces:
                continue
            source = HERE / item['path']
            stem = item.get('stem', source.stem)
            unit_dir = run / ('resume-inputs' if args.resume_run else 'units') / namespace
            unit_dir.mkdir(parents=True, exist_ok=True)
            source_copy = unit_dir / (stem + '.c')
            write_unit(source, kernels.get(source, review.get((namespace, stem), source.read_text())), source_copy)
            expanded = unit_dir / (stem + '_expanded.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', source_copy, '-o', expanded], namespace + '-' + stem + '-cpp')
            if 'annotations' in item:
                original = unit_dir / (stem + '_original.c')
                original.write_text('#include "' + str(REPO / item['frontend']) + '"\n' + source.read_text())
                baseline = unit_dir / (stem + '_original_expanded.c')
                execute(['gcc', '-E', '-P', '-CC', '-nostdinc', original, '-o', baseline], namespace + '-' + stem + '-original-cpp')
                assert tokens(baseline.read_text()) == tokens(expanded.read_text()), 'Original/annotated CPP token mismatch'
            expanded_units.append({'namespace': namespace, 'stem': stem, 'text': expanded.read_text()})
            # Keep the input basename stable: QCP uses it for the generated module name.
            source_copy.write_bytes(expanded.read_bytes())
            if args.resume_run:
                original_dir = run / 'units' / namespace
                assert expanded.read_bytes() == (original_dir / expanded.name).read_bytes(), 'Resume expanded C changed'
                generated = original_dir / 'generated'
                assert any(r['label'] == namespace + '-' + stem + '-qcp' for r in records), 'Missing original QCP command'
            else:
                generated = unit_dir / 'generated'
                generated.mkdir(exist_ok=True)
                execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc', '--no-exec-info',
                         '--input-file=' + str(source_copy), '--coq-output-dir=' + str(generated),
                         '--coq-logic-path=' + namespace, *slp], namespace + '-' + stem + '-qcp', 240)
            fresh = generated / (stem + '_goal.v')
            checked = HERE / 'coq' / namespace / fresh.name
            assert fresh.read_bytes() == checked.read_bytes(), 'Generated goal drift: ' + str(fresh)
            if not args.resume_run:
                shutil.copyfile(fresh, run / 'coq' / namespace / fresh.name)

        final_check = run / 'FinalCheck.v'
        final_text = check_coverage(manifest, expanded_units, args.review_only)
        if args.resume_run:
            assert final_check.read_text() == final_text, 'Resume final module gate changed'
        else:
            final_check.write_text(final_text)

        strategy = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        for directory in sorted((HERE / 'c').iterdir()):
            if args.review_only and directory.name not in review_namespaces:
                continue
            for source in sorted(directory.glob('*.strategies')):
                generated = run / ('strategy-' + source.stem)
                if args.resume_run:
                    assert any(r['label'] == source.stem + '-strategy' for r in records), 'Missing strategy command'
                else:
                    generated.mkdir()
                    execute([strategy, '--arch=64', '--endian=little', '--no-exec-info',
                             '--input-file=' + str(source), '--coq-output-dir=' + str(generated),
                             '--coq-logic-path=' + directory.name], source.stem + '-strategy')
                fresh = generated / (source.stem + '_strategy_goal.v')
                assert fresh.read_bytes() == (HERE / 'coq' / directory.name / fresh.name).read_bytes(), 'Strategy goal drift'

        completed = set()
        if args.resume_run:
            for record in records:
                if record['command'][:2] == ['qcp-env', 'coqc']:
                    assert record['command'][2:-1] == flags, 'Resume compiler flags changed'
                    path = Path(record['command'][-1])
                    assert path.with_suffix('.vo').is_file(), 'Completed module artifact missing'
                    completed.add(path)
        status['modules_completed_before_resume'] = len(completed)
        compile_modules(modules, run, flags, execute, args.jobs, completed)
        execute(['qcp-env', 'coqc', *flags, final_check], 'FinalCheck', 180)
        assert sha(CASE / 'spec.c') == sha(run / 'spec.c'), 'spec.c changed during checking'
        status.update(passed=True, freshly_compiled_local_modules=len(modules),
                      c_shim_equivalence_checked=not args.review_only,
                      reused_experiment_vo_files=False,
                      checked_c_call_closure=True, final_checker_modules_checked=True,
                      original_kernel_cpp_tokens_preserved=not args.review_only,
                      limits=['C-shim partial correctness under the contracts in spec.c.',
                              'QCP/Coq/Flocq external libraries are reused.',
                              'No hardware-to-shim correspondence or termination theorem.'])
    finally:
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / ('review-status.json' if args.review_only else 'status.json')).write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({key: status[key] for key in ['passed', 'scope', 'freshly_compiled_local_modules']}), flush=True)


if __name__ == '__main__':
    main()
