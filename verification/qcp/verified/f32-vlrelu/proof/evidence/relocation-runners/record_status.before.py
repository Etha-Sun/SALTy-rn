#!/usr/bin/env python3
"""Record checked components without promoting an unfinished kernel."""
import hashlib
import json
from pathlib import Path
import shutil

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    evidence = HERE / 'evidence'
    evidence.mkdir(exist_ok=True)
    components = {}
    for name in ['primitive-closure', 'wrapper-proof', 'native', 'math']:
        source = HERE / (name + '-status.json')
        data = json.loads(source.read_text())
        if not data['passed'] or data.get('whole_kernel_verified', False):
            raise ValueError('Expected a passing component, not a kernel certificate: ' + name)
        destination = evidence / source.name
        shutil.copyfile(source, destination)
        components[name] = {'evidence': str(destination.relative_to(CASE)),
                            'sha256': sha(destination), 'passed': True,
                            'scope': data.get('scope', 'model lemmas only; zero C VCs')}
    primitives = json.loads((HERE / 'primitive-closure-status.json').read_text())
    if primitives['checked_c_units'] != 3 or primitives['checked_c_vcs'] != 427:
        raise ValueError('Unexpected primitive interface coverage; review the fixed case inventory')
    relocation_path = evidence / 'frontend-portability.json'
    relocation = json.loads(relocation_path.read_text()) if relocation_path.exists() else None
    for relative, digest in primitives['sources_sha256'].items():
        current = ROOT / relative
        if sha(current) == digest:
            continue
        if not (relocation and relocation['audit_passed'] and relocation['cpp_bytes_identical']
                and current == CASE / relocation['file'] and digest == relocation['before_sha256']
                and sha(current) == relocation['after_sha256']):
            raise ValueError('Primitive input changed without an identity audit: ' + relative)
    native = json.loads((HERE / 'native-status.json').read_text())
    for relative, digest in native['input_hashes'].items():
        if sha(CASE / relative) != digest:
            raise ValueError('Native input changed: ' + relative)
    wrapper = json.loads((HERE / 'wrapper-proof-status.json').read_text())
    if wrapper['public_spec_sha256'] != sha(CASE / 'spec.c'):
        raise ValueError('Public caller evidence refers to a different spec')
    for field, name in [('caller_proof_sha256', 'WrapperChecked.v'),
                        ('gate_source_sha256', 'WrapperGate.v')]:
        if wrapper[field] != sha(HERE / 'coq' / name):
            raise ValueError('Public caller proof changed: ' + name)
    math = json.loads((HERE / 'math-status.json').read_text())
    for record in math['records']:
        checked = HERE / 'coq' / Path(record['command'][-1]).name
        if sha(checked) != record['source_sha256']:
            raise ValueError('Math source changed since its check: ' + checked.name)
    original = json.loads((HERE / 'originals.json').read_text())
    for item in original['files']:
        if sha(CASE / item['copy']) != item['sha256']:
            raise ValueError('Original source identity changed')
    assumptions = Path(primitives['run_directory']) / 'FinalPrimitiveCheck.log'
    shutil.copyfile(assumptions, evidence / 'FinalPrimitiveCheck.log')
    gate = Path(primitives['run_directory']) / 'coq/FinalPrimitiveCheck.v'
    shutil.copyfile(gate, HERE / 'coq/FinalPrimitiveCheck.v')
    inventory = {}
    for folder in ['impl', 'shim', 'proof/coq', 'proof/c']:
        for path in sorted((CASE / folder).rglob('*')):
            if path.is_file() and path.suffix in ['.c', '.h', '.v', '.json', '.strategies']:
                inventory[str(path.relative_to(CASE))] = sha(path)
    for path in [CASE / 'spec.c', HERE / 'originals.json', HERE / 'semantics.json', *sorted(HERE.glob('*.py'))]:
        inventory[str(path.relative_to(CASE))] = sha(path)
    manifest = {'schema': 1, 'kernel': 'f32-vlrelu', 'variant': 'original',
                'whole_kernel_proved': False, 'originals': original,
                'source_inventory_sha256': inventory,
                'component_evidence': components,
                'post_check_identity_audits': ([{'path': 'proof/evidence/frontend-portability.json',
                                                 'sha256': sha(relocation_path)}] if relocation else []),
                'final_primitive_gate': 'proof/coq/FinalPrimitiveCheck.v',
                'primitive_units': {'bits': 19, 'neon_primitives': 61, 'rvv_primitives': 347},
                'remaining': ['original NEON complete VC gate pending',
                              'original RVV kernel generation and proof',
                              'complete kernel/helper/caller call-closure gate',
                              'ISA observation/refinement and termination outside current verified scope']}
    (HERE / 'manifest.json').write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + '\n')
    status = {'schema': 1, 'kernel': 'f32-vlrelu', 'status': 'in-progress',
              'passed': False, 'whole_kernel_proved': False, 'whole_kernel_verified': False,
              'scope': 'Completed primitive C-body capability and conditional caller; paired kernel unfinished',
              'primitive_closure': {'passed': True, 'checked_c_units': 3, 'checked_c_functions': 20,
                                    'checked_c_vcs': 427, 'vc_correct_passed': True,
                                    'fresh_local_coq_modules': primitives['fresh_local_coq_modules']},
              'conditional_public_c_vcs': 36, 'native_cases': native['cases'],
              'components': components, 'remaining': manifest['remaining'],
              'manifest_sha256': sha(HERE / 'manifest.json'),
              'not_claimed': ['complete paired kernel', 'actual hardware execution',
                              'ISA/shim formal correspondence', 'arbitrary VLEN', 'termination'],
              'verified_manifest_changed': False}
    (HERE / 'status.json').write_text(json.dumps(status, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps({'status': status['status'], 'whole_kernel_proved': False,
                      'primitive_c_vcs': 427, 'conditional_public_c_vcs': 36}))


if __name__ == '__main__':
    main()
