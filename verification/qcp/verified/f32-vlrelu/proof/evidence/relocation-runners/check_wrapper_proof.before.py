#!/usr/bin/env python3
"""Bind fresh helper goals and close the conditional public caller interface."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--config', type=Path, required=True)
    p.add_argument('--dependency-dir', type=Path, required=True)
    args = p.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    generation = json.loads((HERE / 'wrapper-generation.json').read_text())
    if not generation.get('generation_passed'):
        raise RuntimeError('Fresh public C VC generation has not passed')
    run = Path(generation['run_directory'])
    coq = run / 'coq'
    sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
    if sha(CASE / 'spec.c') != generation['public_spec_sha256']:
        raise RuntimeError('Public spec changed after VC generation')
    for unit in generation['actual_units']:
        if sha(Path(unit['goal'])) != unit['goal_sha256'] or sha(Path(unit['source'])) != unit['cpp_sha256']:
            raise RuntimeError('Fresh C VC source/goal identity changed')
    counts = {}
    for unit in generation['actual_units']:
        count = len(re.findall(r'^Axiom proof_of_\w+ :', Path(unit['goal']).read_text(), re.M))
        if count != unit['c_vcs']:
            raise RuntimeError('Generated C VC count mismatch')
        counts[unit['namespace']] = count
    expected_counts = {'VLRelu.read': 2, 'VLRelu.bridge': 14, 'VLRelu.comparator': 12, 'VLRelu.wrapper': 8}
    if counts != expected_counts:
        raise RuntimeError('Public helper/caller VC interface changed')
    flags = cfg['flags'][2:]
    for d in sorted(dep.iterdir()):
        if d.is_dir():
            flags += ['-Q', str(d), '' if d.name == 'relations' else d.name]
    flags += ['-Q', str(coq), 'VLRelu']
    # The reviewed proof is the source of truth; do not regenerate tactics here.
    text = (HERE / 'coq/WrapperChecked.v').read_text()
    goal = (coq / 'wrapper/wrapper_goal.v').read_text()
    names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
    proved = re.findall(r'^Lemma proof_of_(\w+) :', text, re.M)
    if sorted(proved) != sorted(names):
        raise RuntimeError('Wrapper proof does not cover the exact generated C VC interface')
    cleaned = re.sub(r'\(\*.*?\*\)', '', text, flags=re.S)
    if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', cleaned):
        raise RuntimeError('Unchecked declaration in wrapper proof')
    (coq / 'WrapperChecked.v').write_text(text)
    gate = (HERE / 'coq/WrapperGate.v').read_text()
    gates = re.findall(r'^Module (\w+) :', gate, re.M)
    if gates != ['ReadGate', 'BridgeGate', 'CompareGate', 'CallerGate']:
        raise RuntimeError('Four public C VC module gates are required')
    (coq / 'WrapperGate.v').write_text(gate)
    records = []
    report = {'passed': False, 'scope': 'Public helper/caller actual C VC interfaces; conditional on kernel contracts',
              'whole_kernel_verified': False, 'run_directory': str(run), 'records': records,
              'checked_c_vcs': sum(counts.values()), 'actual_c_vcs_by_namespace': counts,
              'module_interface_gates': gates, 'public_spec_sha256': sha(CASE / 'spec.c'),
              'input_identities': generation['actual_units'],
              'kernel_source_identity': json.loads((HERE / 'originals.json').read_text()),
              'caller_proof_sha256': sha(HERE / 'coq/WrapperChecked.v'),
              'gate_source_sha256': sha(HERE / 'coq/WrapperGate.v'),
              'helper_proof_reuse': 'Existing checked modules are rebound to all 28 fresh helper C VC fields by ordinary Coq Module aliases.',
              'assumptions': 'Print Assumptions retained in WrapperChecked.v.log; existing external C memory/type/address and classical assumptions are not claimed closed.'}
    try:
        for name in ['WrapperChecked.v', 'WrapperGate.v']:
            command = ['qcp-env', 'coqc', '-time', *flags, str(coq / name)]
            started = time.monotonic()
            with (run / (name + '.log')).open('w') as out:
                result = subprocess.run(command, cwd=run, stdout=out, stderr=subprocess.STDOUT, timeout=180)
            records.append({'command': command, 'exit_code': result.returncode, 'seconds': time.monotonic() - started,
                            'source_sha256': sha(coq / name), 'log_sha256': sha(run / (name + '.log'))})
            print(name, result.returncode, flush=True)
            if result.returncode:
                raise RuntimeError((run / (name + '.log')).read_text()[-3500:])
        if sha(CASE / 'spec.c') != generation['public_spec_sha256']:
            raise RuntimeError('Spec changed during ordinary Coq checking')
        for unit in generation['actual_units']:
            if sha(Path(unit['goal'])) != unit['goal_sha256'] or sha(Path(unit['source'])) != unit['cpp_sha256']:
                raise RuntimeError('Generated C inputs changed during checking')
        report.update(passed=True, actual_fresh_vc_interfaces_bound=True, kernel_contracts_still_conditional=True)
    finally:
        (run / 'proof-status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'wrapper-proof-status.json').write_text(json.dumps(report, indent=2) + '\n')

if __name__ == '__main__':
    main()
