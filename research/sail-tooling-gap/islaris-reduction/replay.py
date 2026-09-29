#!/usr/bin/env python3
"""Recheck the Islaris instruction demo, without claiming a kernel proof."""
import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
STUDY = HERE.parent
ISLARIS = STUDY / 'vendor/islaris-main'
ENV = HERE / 'env-exec.sh'

def run(name, args, timeout=300, expect=0):
    start = time.monotonic()
    log = HERE / 'logs' / (name + '.log')
    with log.open('w') as out:
        try:
            p = subprocess.run([str(ENV), *map(str, args)], cwd=HERE,
                               stdout=out, stderr=subprocess.STDOUT, timeout=timeout)
            code = p.returncode
        except subprocess.TimeoutExpired:
            code = None
    ok = code == expect if expect == 0 else code is not None and code != 0
    record = dict(check=name, exit_code=code, passed=ok,
                  seconds=round(time.monotonic()-start, 3), log=str(log.relative_to(HERE)))
    print(json.dumps(record), flush=True)
    return record

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--skip-build', action='store_true')
    args = parser.parse_args()
    records = []
    if not args.skip_build:
        records.append(run('core-build', ['dune', 'build', '--root', ISLARIS,
            'theories/riscv64/riscv64.vo', 'instructions/riscv64_test/instrs.vo', '-j4'], 600))
    records.append(run('scalar-smoke', ['coqc', '-Q', ISLARIS/'_build/default/theories', 'isla',
        '-Q', ISLARIS/'_build/default/instructions', 'isla.instructions',
        ISLARIS/'examples/riscv64_test.v']))
    common = ['coqc', '-Q', ISLARIS/'_build/default/theories', 'isla',
              '-Q', HERE/'generated', 'ReductionDemo',
              '-Q', HERE/'generated-vset', 'ReductionDemoVset']
    for name, file in [('spec-check','ReductionSpec.v'), ('struct-rules','WholeStruct.v'),
                       ('bits-proof','BitsProof.v'), ('trace-check','generated/a800001ea.v'),
                       ('vset-trace-check','generated-vset/a800001c6.v'),
                       ('vset-proof','VsetProof.v'), ('instruction-proof','InstructionProof.v')]:
        records.append(run(name, [*common, file], timeout=600))
        if name in {'spec-check', 'vset-proof', 'instruction-proof'} and records[-1]['passed']:
            assumptions = (HERE/'logs'/(name+'.log')).read_text()
            records[-1]['no_extra_axioms'] = ('Closed under the global context' in assumptions
                                              and 'Axioms:' not in assumptions)
            records[-1]['passed'] = records[-1]['no_extra_axioms']
        if not records[-1]['passed']:
            break
    if all(x['passed'] for x in records):
        negative = HERE/'negative'
        negative.mkdir(exist_ok=True)
        original = (HERE/'InstructionProof.v').read_text()
        wrong = original.replace('(bv_extract 0 32 seed).', '(BV 32 0).')
        assert wrong != original
        (negative/'WrongSeed.v').write_text(wrong)
        records.append(run('negative-wrong-seed', [*common, negative/'WrongSeed.v'], expect=1))
        text = (HERE/'logs/negative-wrong-seed.log').read_text()
        records[-1]['passed'] = records[-1]['passed'] and 'Unable to unify' in text
    paths = [HERE/f for f in ['ReductionSpec.v','WholeStruct.v','BitsProof.v',
             'InstructionProof.v','VsetProof.v','generated/a800001ea.v',
             'generated-vset/a800001c6.v','rvv-legacy.toml']]
    paths += [STUDY/'vendor/riscv64.ir']
    report = dict(checks=records, all_checks_passed=all(x['passed'] for x in records),
                  vsetvl_arbitrary_remaining_proved=any(x['check']=='vset-proof' and x['passed'] for x in records),
                  vredsum_64_lanes_proved=any(x['check']=='instruction-proof' and x['passed'] for x in records),
                  arbitrary_length_kernel_proved=False,
                  cross_isa_equivalence_proved=False,
                  input_sha256={str(p.relative_to(STUDY)):hashlib.sha256(p.read_bytes()).hexdigest()
                                for p in paths})
    (HERE/'results/replay.json').write_text(json.dumps(report, indent=2)+'\n')
    raise SystemExit(0 if report['all_checks_passed'] else 1)

if __name__ == '__main__':
    main()
