#!/usr/bin/env python3
"""Archive a completed fresh proof; do not replay or promote the kernel."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path,
                        help='Completed original fresh run, if its directory was relocated')
    args = parser.parse_args()
    loader = importlib.util.spec_from_file_location('vcmul_record_full', HERE / 'check_full.py')
    runner = importlib.util.module_from_spec(loader)
    loader.loader.exec_module(runner)
    full_path = HERE / 'full-status.json'
    full = json.loads(full_path.read_text())
    if (not full.get('passed') or not full.get('whole_kernel_verified')
            or not full.get('no_component_vo_reused') or full.get('scope') != 'full'):
        raise ValueError('The complete fresh C-shim gate has not passed')
    run = (args.proof_run.resolve() if args.proof_run else
           runner.artifact_path(full['run_directory']))
    if (run / 'status.json').read_bytes() != full_path.read_bytes():
        raise ValueError('Completed run certificate mismatch')
    if any(r['exit_code'] != 0 for r in full['records']):
        raise ValueError('Complete certificate contains a failed command')
    units = full['actual_c_units']
    if (len(units) != len(runner.EXPECTED_BODIES)
            or {u['label'] for u in units} != set(runner.EXPECTED_BODIES)
            or sum(u['c_vcs'] for u in units) != full['checked_c_vcs']):
        raise ValueError('Incomplete actual C unit interface inventory')
    closure = full['call_closure']
    if (closure['unbound_callees'] or closure['declarations_without_checked_body']
            or not closure['exact_contract_and_signature_match']):
        raise ValueError('Incomplete C body/contract/call closure')
    coq_records = [r for r in full['records'] if 'coqc' in r['command']]
    if (len(coq_records) != full['fresh_compiled_local_modules']
            or len(full['compiled_source_sha256']) + 1 != len(coq_records)):
        raise ValueError('Fresh ordinary Coq compilation inventory mismatch')
    for name, digest in full['compiled_source_sha256'].items():
        namespace, stem = name.rsplit('.', 1)
        folder = namespace.replace('.', '/') if namespace else 'relations'
        if sha(run / 'coq' / folder / (stem + '.v')) != digest:
            raise ValueError('Compiled source changed: ' + name)
    if sha(run / 'FinalCaseCheck.v') != full['final_gate_sha256']:
        raise ValueError('Completed final gate source changed')
    if sha(run / 'FinalCaseCheck.log') != full['final_assumptions_log_sha256']:
        raise ValueError('Completed final gate log changed')
    gate = (run / 'FinalCaseCheck.v').read_text()
    if (len(re.findall(r'^Print Assumptions ', gate, re.M))
            != full['checked_c_vcs'] + full['checked_strategy_fields']):
        raise ValueError('Final assumptions inventory mismatch')
    # Live status files may change after native replay; their exact original
    # bytes are archived below. Every actual proof source remains immutable.
    for relative, digest in full['input_sha256'].items():
        if not relative.endswith('-status.json') and sha(CASE / relative) != digest:
            raise ValueError('Live proof input changed: ' + relative)
    originals = json.loads((HERE / 'originals.json').read_text())
    for item in originals['files'].values():
        if (sha(CASE / item['copy']) != item['sha256']
                or (CASE / item['copy']).read_bytes() != (ROOT / item['path']).read_bytes()):
            raise ValueError('Original implementation identity changed: ' + item['copy'])
    native = json.loads((HERE / 'native-status.json').read_text())
    controls = ['wrong_result_rejected', 'fused_substitution_rejected',
                'shared_wrong_multiply_rejected_by_oracle', 'input_and_padding_frame_preserved',
                'params_frame_preserved', 'output_prefix_suffix_frame_preserved']
    if not native.get('passed') or any(not native.get(k) for k in controls):
        raise ValueError('Native regression/independent negative controls incomplete')
    for relative, digest in native['input_hashes'].items():
        if sha(CASE / relative) != digest:
            raise ValueError('Native input changed: ' + relative)

    evidence = HERE / 'evidence'
    archive = evidence / 'full-run'
    if archive.exists() and (archive / 'status.json').exists():
        if (archive / 'status.json').read_bytes() != full_path.read_bytes():
            old = evidence / 'previous-full-runs' / sha(archive / 'status.json')
            old.parent.mkdir(exist_ok=True)
            if old.exists():
                raise ValueError('Previous full-run archive exists; preserve and reconcile explicitly')
            shutil.move(str(archive), str(old))
    archive.mkdir(parents=True, exist_ok=True)

    def preserve(source, destination):
        destination.parent.mkdir(parents=True, exist_ok=True)
        if destination.exists():
            if destination.read_bytes() != source.read_bytes():
                raise ValueError('Refusing to overwrite archived evidence: ' + str(destination))
        else:
            shutil.copyfile(source, destination)

    preserve(full_path, archive / 'status.json')
    for relative, digest in full['input_sha256'].items():
        if relative.endswith('-status.json'):
            saved = archive / 'component-status' / relative
            if saved.exists():
                if sha(saved) != digest:
                    raise ValueError('Archived component certificate changed: ' + relative)
            else:
                source = CASE / relative
                if sha(source) != digest:
                    raise ValueError('Archive original component status before relocation: ' + relative)
                preserve(source, saved)
    for record in full['records']:
        source = run / (record['label'] + '.log')
        if sha(source) != record['log_sha256']:
            raise ValueError('Completed command log changed: ' + record['label'])
        preserve(source, archive / 'logs' / source.name)
    preserve(run / 'FinalCaseCheck.v', archive / 'FinalCaseCheck.v')
    preserve(run / 'FinalCaseCheck.log', archive / 'FinalCaseCheck.log')
    original_run = Path(full['run_directory'])
    for unit in units:
        folder = archive / 'units' / unit['label'].replace('/', '-')
        for key, name, digest_key in [('actual_c_path', 'expanded.c', 'cpp_sha256'),
                                      ('fresh_goal_path', 'goal.v', 'goal_sha256')]:
            source = run / Path(unit[key]).relative_to(original_run)
            if sha(source) != unit[digest_key]:
                raise ValueError('Completed C unit artifact changed: ' + unit['label'])
            preserve(source, folder / name)
    for strategy in full['strategies']:
        source = (run / 'coq' / strategy['namespace'].replace('.', '/')
                  / (strategy['stem'] + '_strategy_goal.v'))
        if sha(source) != strategy['goal_sha256']:
            raise ValueError('Completed strategy goal changed: ' + strategy['label'])
        preserve(source, archive / 'strategies' / strategy['label'].replace('/', '-') / source.name)

    previous_path = HERE / 'status.json'
    if previous_path.exists():
        previous = json.loads(previous_path.read_text())
        if not previous.get('whole_kernel_verified'):
            preserve(previous_path, evidence / 'candidate-history/status.json')
            preserve(HERE / 'manifest.json', evidence / 'candidate-history/manifest.json')
    files = []
    for path in sorted(CASE.rglob('*')):
        relative = path.relative_to(CASE)
        if (not path.is_file() or any(x in {'.build', '__pycache__'} for x in relative.parts)
                or path in {HERE / 'manifest.json', HERE / 'status.json'}
                or path.suffix in {'.vo', '.vos', '.vok', '.glob', '.pyc', '.aux'}):
            continue
        files.append({'path': str(relative), 'sha256': sha(path)})
    manifest = {
        'schema': 2, 'kernel': 'f32-vcmul', 'variant': 'original',
        'whole_kernel_proved': True, 'originals': originals, 'files': files,
        'full_evidence': 'proof/full-status.json', 'full_evidence_sha256': sha(full_path),
        'generated_source_policy': 'Archived CPP and goal snapshots bind identities; every full replay regenerates actual C targets and compiles all required ordinary Coq source afresh.',
    }
    (HERE / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    status = {
        'schema': 2, 'kernel': 'f32-vcmul', 'status': 'proved', 'passed': True,
        'whole_kernel_proved': True, 'whole_kernel_verified': True,
        'implementation_variant': 'original',
        'verification_scope': 'Original planar NEON/RVV C kernels and complete C-shim call closure, with public observation caller; modular partial correctness under explicit memory contracts.',
        'checked_c_units': full['checked_c_units'], 'checked_c_vcs': full['checked_c_vcs'],
        'unit_vc_counting': full['unit_vc_counting'],
        'checked_strategy_fields': full['checked_strategy_fields'],
        'ordinary_modules_including_final': full['fresh_compiled_local_modules'],
        'unique_c_functions_with_bodies': closure['unique_c_functions_with_bodies'],
        'parallel_jobs': full['parallel_jobs'],
        'full_evidence': 'full-status.json', 'full_evidence_sha256': sha(full_path),
        'immutable_full_archive': 'evidence/full-run/status.json',
        'manifest_sha256': sha(HERE / 'manifest.json'),
        'native_evidence': 'native-status.json', 'native_evidence_sha256': sha(HERE / 'native-status.json'),
        'native_cases': native['cases'], 'output_lanes_per_side': native['output_lanes_per_side'],
        'limits': full['limits'], 'remaining': [],
        'not_claimed': ['Actual hardware execution', 'Formal ISA/runtime/layout refinement',
                        'Arbitrary hardware VLEN', 'Termination', 'FP exception flag/trap equivalence'],
        'verified_manifest_changed': False,
    }
    (HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({'passed': True, 'kernel': 'f32-vcmul',
                      'checked_c_units': status['checked_c_units'],
                      'checked_c_vcs': status['checked_c_vcs'],
                      'ordinary_modules_including_final': status['ordinary_modules_including_final'],
                      'archived_files': len(files)}))


if __name__ == '__main__':
    main()
