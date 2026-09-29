#!/usr/bin/env python3
"""Run standard Coq checking, with separate logs and a finite per-file budget."""
import argparse
import resource
import translate as t

def coq_args():
    return ['-Q',t.UP/'_build/default/theories','isla',
            '-Q',t.HERE,'','-Q',t.AUDIT,'','-Q',t.OLD,'',
            '-Q',t.AUDIT/'generated','Bridge',
            '-Q',t.HERE/'simple/generated/neon','Kernel.neon',
            '-Q',t.HERE/'simple/generated/rvv','Simple.rvv',
            '-Q',t.HERE/'generated/rvv','Kernel.rvv']

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('files',nargs='+')
    p.add_argument('--timeout',type=int,default=600)
    p.add_argument('--stack-mb',type=int,default=256,
                   help='Native OCaml stack limit for large, kernel-checked proof terms')
    args=p.parse_args()
    _, hard_stack = resource.getrlimit(resource.RLIMIT_STACK)
    requested_stack = args.stack_mb * 1024 * 1024
    resource.setrlimit(resource.RLIMIT_STACK,
                      (requested_stack if hard_stack == resource.RLIM_INFINITY
                       else min(requested_stack, hard_stack), hard_stack))
    failed=False
    for name in args.files:
        r=t.probe.run('proof-'+name.removesuffix('.v'),
            [t.ENV,'coqc','-time',*coq_args(),t.HERE/name],timeout=args.timeout)
        failed=failed or r['exit_code']!=0
    raise SystemExit(int(failed))
