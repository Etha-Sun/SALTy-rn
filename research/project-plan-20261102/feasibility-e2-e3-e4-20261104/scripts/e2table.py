#!/usr/bin/env python3
"""Read-only: for ops with x86 microkernels, summarise per-ISA defs and what the RISCV/HEXAGON/ARM builds register.
Usage: python3 -I e2table.py inventory.json cfgarch.json"""
import json, sys, collections
inv = json.load(open(sys.argv[1])); recs = json.load(open(sys.argv[2]))
def opof(n):
    n = n.replace('__ukernel_', '_ukernel_'); pre, isa = n.split('__', 1)
    base = pre.replace('xnn_', '', 1)
    return (base.split('_ukernel_', 1)[0] if '_ukernel_' in base else base.replace('_ukernel', '')), isa
reg = collections.defaultdict(lambda: collections.defaultdict(set))
for r in recs:
    op, isa = opof(r['name']); a = r['arch']
    for k in ('RISCV', 'HEXAGON', 'ARM64'):
        if 'XNN_ARCH_' + k in a and not a.startswith('else'): reg[op][k].add(isa.split('_')[0])
    if a.startswith('else(') or a == '': reg[op]['ELSE/NOARCH'].add(isa.split('_')[0])
def nd(op, f):
    e = inv[op].get(f); return len(e['def']) if e else 0
for op in sorted(inv):
    if not nd(op, 'x86'): continue
    x86isas = sorted(set(x['isa'].split('_')[0] if x['isa'].split('_')[0] != 'asm' else x['isa'].split('_')[2] for x in inv[op]['x86']['def']))
    r = reg.get(op, {})
    print('%-34s def[x86=%d arm=%d rvv=%d hvx=%d sc=%d] RISCV:%s HEX:%s A64:%s ELSE:%s x86isa:%s' % (
        op, nd(op,'x86'), nd(op,'arm'), nd(op,'rvv'), nd(op,'hvx'), nd(op,'scalar'),
        ','.join(sorted(r.get('RISCV', []))) or '-', ','.join(sorted(r.get('HEXAGON', []))) or '-',
        ','.join(sorted(r.get('ARM64', [])))[:30] or '-', ','.join(sorted(r.get('ELSE/NOARCH', []))) or '-', ','.join(x86isas)))
