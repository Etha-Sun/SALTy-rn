#!/usr/bin/env python3
"""Relocate a fully checked binary case; audit byte identity without rerunning Coq."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import tempfile

QCP = Path(__file__).resolve().parents[1]
ROOT = QCP.parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def refresh_index():
    catalog_path = QCP/'catalog.json'
    catalog = json.loads(catalog_path.read_text())
    entries = []
    for case in sorted((QCP/'verified').iterdir()):
        status_file = case/'proof/status.json'
        if not status_file.is_file():
            continue
        status = json.loads(status_file.read_text())
        require(status.get('passed') and status.get('scope') == 'full' and status.get('c_shim_equivalence_checked'), 'Unproved case in verified: '+case.name)
        manifest = json.loads((case/'proof/manifest.json').read_text())
        require(status['freshly_compiled_local_modules'] == len(manifest['modules']), 'Incomplete module coverage')
        require(sha(case/'spec.c') == status['spec_sha256'], 'Verified spec changed')
        for item in manifest['files']:
            require(sha(case/item['path']) == item['sha256'], 'Verified source changed')
        entry = {'kernel': case.name, 'directory': case.name, 'full_status': case.name+'/proof/status.json',
                 'status_sha256': sha(status_file), 'spec_sha256': status['spec_sha256'],
                 'local_coq_modules': status['freshly_compiled_local_modules'], 'parallel_jobs': status['parallel_jobs']}
        entries.append(entry)
        kernel = next(k for k in catalog['kernels'] if k['name'] == case.name)
        kernel['qcp'] = {'whole_kernel_proved': True, 'status': 'verified_c_shim_partial_correctness',
                         'status_scope': 'unchanged original bodies + actual shim bodies + explicit output relation; modular C-shim partial correctness',
                         'case': str(case.relative_to(ROOT)), 'evidence': 'proof/status.json',
                         'isa_correspondence_proved': False, 'termination_proved': False}
    registry = {'schema': 1, 'scope': 'C-shim modular partial correctness under each public spec; not ISA correspondence or termination',
                'kernel_count_total': catalog['kernel_count'], 'verified_count': len(entries), 'kernels': entries}
    (QCP/'verified/manifest.json').write_text(json.dumps(registry, indent=2)+'\n')
    catalog_path.write_text(json.dumps(catalog, ensure_ascii=False, indent=2)+'\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('kernel')
    kernel = parser.parse_args().kernel
    require(re.fullmatch(r'[a-z0-9][a-z0-9-]*', kernel), 'Invalid kernel name')
    old, new = QCP/'candidates'/kernel, QCP/'verified'/kernel
    require(old.is_dir() and not old.is_symlink() and not new.exists(), 'Candidate missing or destination exists')
    proof = old/'proof'
    manifest_bytes, status_bytes = (proof/'manifest.json').read_bytes(), (proof/'status.json').read_bytes()
    manifest, status = json.loads(manifest_bytes), json.loads(status_bytes)
    require(status.get('scope') == 'full' and all(status.get(k) is True for k in
            ['passed', 'c_shim_equivalence_checked', 'checked_c_call_closure', 'final_checker_modules_checked',
             'original_kernel_tokens_preserved', 'original_kernel_cpp_tokens_preserved', 'kernel_contracts_match_spec']), 'Full proof has not passed')
    require(len(manifest['modules']) == status['freshly_compiled_local_modules'] == 87, 'Expected all 87 local modules')
    require(len(manifest['units']) == 11, 'Expected all 11 C units')
    old_run = Path(status['run_directory']).resolve()
    require(old_run.parent == (old/'.build').resolve(), 'Checked run must belong to this candidate')
    require((old_run/'status.json').read_bytes() == status_bytes, 'Proof/run status mismatch')
    require(sha(old/'spec.c') == status['spec_sha256'] == sha(old_run/'spec.c'), 'Spec changed')
    for item in manifest['files']:
        require(sha(old/item['path']) == item['sha256'], 'Manifest file changed: '+item['path'])
    entry = next(x for x in json.loads((QCP/'catalog.json').read_text())['kernels'] if x['name'] == kernel)
    for side, filename in [('neon', 'testNEON.c'), ('rvv', 'testRVV.c')]:
        original = ROOT/entry['files'][side]['path']
        require(sha(original) == entry['files'][side]['sha256'] and original.read_bytes() == (old/'impl'/filename).read_bytes(), 'Original implementation changed: '+side)
    required = {str(old_run/m['path']) for m in manifest['modules']}
    compiled = {r['command'][-1] for r in status['records'] if r['command'][:2] == ['qcp-env', 'coqc']}
    require(len(required) == 87 and compiled == required | {str(old_run/'FinalCheck.v')}, 'Compiled module coverage mismatch')
    require(all(r['exit_code'] == 0 for r in status['records']), 'Failed command in passed status')
    for item in manifest['modules']:
        require((proof/item['path']).read_bytes() == (old_run/item['path']).read_bytes(), 'Checked Coq source changed: '+item['path'])
    old_prefix, new_prefix = str(old.relative_to(ROOT))+'/', str(new.relative_to(ROOT))+'/'
    for item in manifest['units']:
        if 'frontend' in item:
            require(item['frontend'].startswith(old_prefix), 'Frontend outside candidate')
            item['frontend'] = new_prefix + item['frontend'][len(old_prefix):]
    new_run = new/old_run.relative_to(old)
    old.rename(new)
    try:
        proof = new/'proof'
        (proof/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
        prepare = load(proof/'prepare.py', 'promoted_prepare')
        coverage = load(proof/'coverage.py', 'promoted_coverage')
        review, kernels = prepare.review_units(), prepare.kernel_audit()
        expanded, identities = [], {}
        with tempfile.TemporaryDirectory(prefix='relocation-', dir=new/'.build') as temporary:
            for item in manifest['units']:
                source = proof/item['path']
                namespace, stem = item['namespace'], item.get('stem', source.stem)
                target = Path(temporary)/namespace/(stem+'.c')
                target.parent.mkdir(parents=True, exist_ok=True)
                prepare.write_unit(source, kernels.get(source, review.get((namespace, stem), source.read_text())), target)
                result = subprocess.run(['gcc', '-E', '-P', '-CC', '-nostdinc', str(target)], capture_output=True, check=True, timeout=30)
                saved = new_run/'units'/namespace/(stem+'_expanded.c')
                require(result.stdout == saved.read_bytes(), 'Relocated CPP drift: '+namespace+'/'+stem)
                identities[namespace+'/'+stem] = sha(saved)
                expanded.append({'namespace': namespace, 'stem': stem, 'text': result.stdout.decode()})
        final = coverage.check_coverage(manifest, expanded, review_only=False)
        require(final == (new_run/'FinalCheck.v').read_text(), 'C/Coq closure changed')
        for item in manifest['modules']:
            require((proof/item['path']).read_bytes() == (new_run/item['path']).read_bytes(), 'Relocated Coq drift')
        require((new_run/'status.json').read_bytes() == status_bytes, 'Historical status changed')
        audit = {'passed': True, 'kind': 'relocation_identity_audit_not_proof_replay',
                 'original_passed_status_sha256': hashlib.sha256(status_bytes).hexdigest(),
                 'old_case_directory': str(old), 'new_case_directory': str(new),
                 'old_run_directory': str(old_run), 'new_run_directory': str(new_run),
                 'manifest_sha256': sha(proof/'manifest.json'), 'identical_cpp_units': identities,
                 'identical_coq_modules': 87, 'full_call_and_module_closure': True}
        (proof/'relocation-audit.json').write_text(json.dumps(audit, indent=2)+'\n')
        status.update(run_directory=str(new_run), original_run_directory=str(old_run), relocation_report='relocation-audit.json')
        (proof/'status.json').write_text(json.dumps(status, indent=2)+'\n')
    except BaseException:
        (new/'proof/manifest.json').write_bytes(manifest_bytes)
        (new/'proof/status.json').write_bytes(status_bytes)
        (new/'proof/relocation-audit.json').unlink(missing_ok=True)
        new.rename(old)
        raise
    refresh_index()
    print(json.dumps({'promoted': kernel, 'cpp_units': 11, 'coq_modules': 87, 'proof_replayed': False}))


if __name__ == '__main__':
    main()
