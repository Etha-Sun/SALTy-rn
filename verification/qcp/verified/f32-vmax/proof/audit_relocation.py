#!/usr/bin/env python3
"""Check live source/CPP identity against a completed proof; do not replay it."""
import argparse
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path,
                        help='Completed original fresh run, including its source and logs')
    args = parser.parse_args()
    full_runner = module('fmax_identity_full', HERE / 'check_full.py')
    sha = full_runner.sha
    full_path = HERE / 'full-status.json'
    full = json.loads(full_path.read_text())
    archive = HERE / 'evidence/full-run/status.json'
    if (not full.get('passed') or not full.get('whole_kernel_verified')
            or full_path.read_bytes() != archive.read_bytes()):
        raise ValueError('A complete, byte-preserved full-run certificate is required')
    proof_run = (args.proof_run.resolve() if args.proof_run else
                 full_runner.artifact_path(full['run_directory']))
    if (proof_run / 'status.json').read_bytes() != full_path.read_bytes():
        raise ValueError('Referenced proof run does not match the complete certificate')
    (CASE / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='source-identity-', dir=CASE / '.build'))
    report = {
        'audit_passed': False, 'formal_proof_replayed': False,
        'kind': 'live_source_cpp_and_compiled_source_identity_only',
        'scope': 'Identity audit against the archived completed proof; no new QCP/Coq proof',
        'case': str(CASE), 'proof_run': str(proof_run), 'audit_directory': str(run),
        'full_status_sha256': sha(full_path), 'cpp_records': [],
        'compiled_source_records': [],
    }
    expected = {u['label']: u for u in full['actual_c_units']}
    base_manifest = json.loads((BASE / 'proof/manifest.json').read_text())

    def cpp(label, stem, text, cpp_flags):
        folder = run / label.replace('/', '-')
        folder.mkdir()
        source = folder / (stem + '.c')
        source.write_text(text)
        expanded = folder / 'expanded.c'
        command = ['gcc', '-E', '-P', '-CC', '-nostdinc', str(source), *map(str, cpp_flags),
                   '-I', str(CASE), '-o', str(expanded)]
        result = subprocess.run(command, cwd=folder, capture_output=True,
                                text=True, timeout=90)
        (folder / 'cpp.log').write_text(result.stdout + result.stderr)
        if result.returncode:
            raise RuntimeError('CPP failed: ' + label)
        recorded = expected[label]
        historical_path = Path(recorded['actual_c_path'])
        historical_run = Path(full['run_directory'])
        historical = proof_run / historical_path.relative_to(historical_run)
        if sha(historical) != recorded['cpp_sha256']:
            raise ValueError('Completed proof CPP artifact changed: ' + label)
        if expanded.read_bytes() != historical.read_bytes():
            raise ValueError('Current CPP differs from completed proof: ' + label)
        report['cpp_records'].append({
            'label': label, 'cpp_sha256': sha(expanded),
            'historical_cpp_sha256': recorded['cpp_sha256'],
            'cpp_bytes_identical': True, 'command': command,
        })

    try:
        immutable = {
            rel: digest for rel, digest in full['input_sha256'].items()
            if not rel.endswith('-status.json')
        }
        for rel, digest in immutable.items():
            if sha(CASE / rel) != digest:
                raise ValueError('Completed proof source changed: ' + rel)
        report['immutable_source_files_checked'] = len(immutable)
        originals = json.loads((HERE / 'originals.json').read_text())
        repair = json.loads((HERE / 'repair.json').read_text())
        neon = originals['files']['neon']
        rvv = originals['files']['rvv']
        if (sha(ROOT / neon['path']) != neon['sha256']
                or (ROOT / neon['path']).read_bytes() != (CASE / neon['copy']).read_bytes()):
            raise ValueError('Current original NEON differs')
        if (sha(ROOT / rvv['path']) != rvv['sha256']
                or repair['original_rvv_sha256'] != rvv['sha256']
                or sha(CASE / rvv['copy']) != repair['repaired_rvv_sha256']
                or sha(CASE / repair['patch']) != repair['patch_sha256']):
            raise ValueError('Current original/repaired RVV or retained patch differs')
        report['repository_original_and_repaired_identities_checked'] = True
        for item in base_manifest['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Reviewed BASE input changed: ' + item['path'])
        if sha(BASE / 'proof/manifest.json') != full['dependency_manifest_sha256']:
            raise ValueError('Reviewed BASE manifest changed')
        # The full checker and this audit share only pure live C construction.
        # GCC preprocessing is performed again in this private audit directory.
        for unit in full_runner.iter_current_unit_texts():
            cpp(unit['label'], unit['stem'], unit['text'], unit.get('cpp_flags', []))
        if (set(expected) != set(full_runner.EXPECTED_BODIES)
                or {r['label'] for r in report['cpp_records']} != set(expected)
                or len(report['cpp_records']) != len(expected)):
            raise ValueError('Incomplete CPP unit coverage')
        for name, digest in full['compiled_source_sha256'].items():
            namespace, stem = name.rsplit('.', 1)
            folder = namespace.replace('.', '/') if namespace else 'relations'
            current = proof_run / 'coq' / folder / (stem + '.v')
            if sha(current) != digest:
                raise ValueError('Completed proof Coq source changed: ' + name)
            report['compiled_source_records'].append({'logical_name': name, 'sha256': digest})
        for item in base_manifest['modules']:
            if (BASE / 'proof' / item['path']).read_bytes() != (proof_run / item['path']).read_bytes():
                raise ValueError('Live BASE differs from compiled source: ' + item['path'])
        for relative, digest in immutable.items():
            source = Path(relative)
            if source.parent == Path('proof/coq') and source.suffix == '.v':
                logical = 'FMax.' + source.stem
                if full['compiled_source_sha256'].get(logical) != digest:
                    raise ValueError('Public Coq source differs from compiled input: ' + relative)
        if sha(proof_run / 'FinalCaseCheck.v') != full['final_gate_sha256']:
            raise ValueError('Final gate source changed')
        if sha(proof_run / 'FinalCaseCheck.log') != full['final_assumptions_log_sha256']:
            raise ValueError('Final gate execution log changed')
        total = len(report['compiled_source_records']) + 1
        if total != full['fresh_compiled_local_modules']:
            raise ValueError('Compiled source count differs from completed proof')
        report.update(audit_passed=True, current_cpp_units=len(expected),
                      cpp_bytes_identical=True,
                      compiled_source_count_including_final=total,
                      final_gate_source_and_log_identical=True,
                      component_status_policy='All live *-status.json files are excluded from immutable source checks; the complete archived full certificate remains byte-preserved and binds its original component status digests. Historical component JSON preservation is separately checked by the publication manifest.')
    except Exception as error:
        report['error'] = str(error)
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'relocation-identity.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({k: report.get(k) for k in [
        'audit_passed', 'current_cpp_units', 'compiled_source_count_including_final',
        'formal_proof_replayed', 'error']}))
    return 0 if report['audit_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
