#!/usr/bin/env python3
"""Read-only: per op, which kernels each arch build selects (from cfgarch.json).
Usage: python3 -I opsummary.py cfgarch.json inventory.json > opsummary.txt"""
import json, sys, re, collections
sys.path = [p for p in sys.path if p]  # -I already isolates
recs = json.load(open(sys.argv[1])); inv = json.load(open(sys.argv[2]))
def opof(n):
    n = n.replace('__ukernel_', '_ukernel_')
    pre, isa = n.split('__', 1)
    base = pre.replace('xnn_', '', 1)
    return (base.split('_ukernel_', 1)[0] if '_ukernel_' in base else base.replace('_ukernel', '')), isa
def archkey(a):
    # 'ELSE' = generic fallback branch (taken by any arch without its own branch, e.g. RISCV/HEXAGON when absent)
    if a.startswith('else('):
        return 'ELSE'
    for k in ('RISCV', 'HEXAGON', 'ARM64', 'X86', 'WASM', 'PPC64', 'ARM'):
        if any('XNN_ARCH_' + k in part and not part.startswith('else') for part in a.split(' && ')[:1] + [x for x in a.split(' && ') if 'XNN_ARCH' in x][:1]):
            return k
    return 'NOARCH' if not a else 'OTHER:' + a[:50]
by = collections.defaultdict(lambda: collections.defaultdict(set))
for r in recs:
    op, isa = opof(r['name'])
    by[op][archkey(r['arch'])].add(isa)
for op in sorted(by):
    d = by[op]
    print(op)
    for k in sorted(d):
        print('   %-8s %s' % (k, ' '.join(sorted(d[k]))[:240]))
