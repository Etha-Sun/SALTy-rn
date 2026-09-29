#!/usr/bin/env python3
"""Recheck completed artifacts; incomplete experiments stay separate."""
import argparse, hashlib, json, sys, re
from pathlib import Path
from probe import HERE, STUDY, UP, OLD, ENV, run, configure, inventory

def main():
    p=argparse.ArgumentParser()
    p.add_argument('--attempt-rvv-proof',action='store_true')
    p.add_argument('--proof-timeout',type=int,default=7200)
    p.add_argument('--compare-smt',action='store_true')
    p.add_argument('--coqchk',action='store_true')
    args=p.parse_args()
    configure();inventory();checks=[]
    common=[ENV,'coqc','-Q',UP/'_build/default/theories','isla',
            '-Q',HERE/'generated','Bridge','-Q',OLD,'']
    r=run('core-build',[ENV,'dune','build','--root',UP,
                        'theories/aarch64/aarch64.vo','theories/riscv64/riscv64.vo','-j4'],timeout=600)
    checks.append(r)
    for f in sorted((HERE/'generated').glob('*/*.v')):
        if f.stem=='instrs':continue
        checks.append(run('coq-import-'+f.parent.name,[*common,f],timeout=600))
    proof_names=['NeonProof','Mapping','TypeBridge','NeonPairProof','NeonLaneBridge',
                 'NeonWordProof','MemoryBridge','NeonLoadProof',
                 'LanePacking','WordPacking','NeonBlockSpec']
    for name in proof_names:
        r=run('proof-'+name,[*common,HERE/(name+'.v')],timeout=120)
        output=(HERE/'logs'/f'proof-{name}.log').read_text()
        source=HERE/(name+'.v')
        r['source_sha256']=r['input_sha256'][str(source)]
        r['source_unchanged']=r['source_sha256']==hashlib.sha256(source.read_bytes()).hexdigest()
        r['contains_unfinished_command']=bool(re.search(r'\b(?:Abort|Admitted|admit)\s*\.',source.read_text()))
        r['no_extra_axioms']=r['exit_code']==0 and 'Closed under the global context' in output and 'Axioms:' not in output and r['source_unchanged'] and not r['contains_unfinished_command']
        (HERE/'results'/('proof-'+name+'.json')).write_text(json.dumps(r,indent=2)+'\n')
        checks.append(r)
    if args.coqchk and all(r['exit_code']==0 for r in checks):
        r=run('coqchk-bridge',[ENV,'coqchk','-silent','-Q',UP/'_build/default/theories','isla',
                              '-Q',HERE/'generated','Bridge','-Q',OLD,'',*proof_names],timeout=args.proof_timeout)
        r['source_sha256']={name:hashlib.sha256((HERE/(name+'.v')).read_bytes()).hexdigest() for name in proof_names}
        r['vo_sha256']={name:hashlib.sha256((HERE/(name+'.vo')).read_bytes()).hexdigest() for name in proof_names}
        (HERE/'results/coqchk-bridge.json').write_text(json.dumps(r,indent=2)+'\n')
        checks.append(r)
    # Wrong arithmetic must fail at the semantic obligation, not an import.
    (HERE/'negative').mkdir(exist_ok=True)
    original=(HERE/'NeonProof.v').read_text()
    wrong=original.replace('Definition neon_sum4 (v : bv 128) : bv 32 :=\n  bv_add',
                           'Definition neon_sum4 (v : bv 128) : bv 32 :=\n  bv_sub')
    assert wrong!=original
    (HERE/'negative/WrongNeon.v').write_text(wrong)
    r=run('negative-neon-sub',[*common,HERE/'negative/WrongNeon.v'],timeout=120)
    output=(HERE/'logs/negative-neon-sub.log').read_text()
    r['expected_failure']=r['exit_code'] not in (None,0) and ('incomplete proof' in output or 'Unable to unify' in output)
    checks.append(r)
    if args.attempt_rvv_proof:
        r=run('attempt-RvvProof',[*common,'-time',HERE/'RvvProof.v'],timeout=args.proof_timeout)
        output=(HERE/'logs/attempt-RvvProof.log').read_text()
        r['no_extra_axioms']=r['exit_code']==0 and 'Closed under the global context' in output and 'Axioms:' not in output
        r['source_sha256']=hashlib.sha256((HERE/'RvvProof.v').read_bytes()).hexdigest()
        (HERE/'results/attempt-RvvProof.json').write_text(json.dumps(r,indent=2)+'\n')
        checks.append(r)
    if args.compare_smt:
        checks.append(run('smt-block-comparison',[sys.executable,HERE/'compare_blocks.py'],timeout=800))
    sources=[*HERE.glob('*.v'),*HERE.glob('*.py'),*HERE.glob('configs/*.toml'),
             *HERE.glob('generated/*/*.v'),*HERE.glob('generated/*/*.isla'),
             STUDY/'vendor/islaris-pinned-aarch64.ir',STUDY/'vendor/riscv64.ir']
    report=dict(checks=checks,
                completed_coq_checks_passed=all(r.get('expected_failure',r['exit_code']==0) and r.get('no_extra_axioms',True)
                                              for r in checks if not r['name'].startswith(('attempt-','smt-'))),
                arbitrary_length_kernel_proved=False,cross_isa_kernel_equivalence_proved=False,
                sha256={str(f.relative_to(STUDY)):hashlib.sha256(f.read_bytes()).hexdigest() for f in sources})
    (HERE/'results/replay.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='sha256'},indent=2))
    return 0 if report['completed_coq_checks_passed'] else 1

if __name__=='__main__':sys.exit(main())
