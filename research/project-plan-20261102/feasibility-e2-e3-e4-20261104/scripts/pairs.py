#!/usr/bin/env python3
"""Read-only: per op, the kernels each production build registers (ARM64 / RISCV / HEXAGON / X86),
with params type, init fn, template and source file. Usage: python3 -I pairs.py <root> inventory.json inc.json cfgarch.json [ops...]"""
import sys, json, re, os, collections
root = sys.argv[1]; inv = json.load(open(sys.argv[2])); inc = json.load(open(sys.argv[3])); cfg = json.load(open(sys.argv[4]))
want = set(sys.argv[5:])
files = {}
for op in inv:
    for f in inv[op]:
        for d in inv[op][f]['def']: files[d['name']] = d['files'][0]
def opof(n):
    n = n.replace('__ukernel_', '_ukernel_'); pre, isa = n.split('__', 1)
    base = pre.replace('xnn_', '', 1)
    return (base.split('_ukernel_', 1)[0] if '_ukernel_' in base else base.replace('_ukernel', '')), isa
def tmpl(n):
    p = files.get(n)
    if not p: return '-'
    t = open(os.path.join(root, p), errors='ignore').read(800)
    m = re.search(r'Template:\s*(\S+)', t); return m.group(1) if m else '(handwritten)'
by = collections.defaultdict(lambda: collections.defaultdict(list))
for r in cfg:
    op, isa = opof(r['name']); a = r['arch']
    if a.startswith('else'): continue
    for k in ('RISCV', 'HEXAGON', 'ARM64', 'X86'):
        if 'XNN_ARCH_' + k in a:
            if isa.startswith('scalar') or 'scalar' in isa.split('_')[:2]: continue
            by[op][k].append((r['name'], r['file'].replace('src/configs/', ''), r['line']))
            break
for op in sorted(by):
    if want and op not in want: continue
    d = by[op]
    if sum(1 for k in d if d[k]) < 2: continue
    print('=== %s  [%s]' % (op, ' '.join(k for k in ('ARM64', 'RISCV', 'HEXAGON', 'X86') if d.get(k))))
    for k in ('ARM64', 'RISCV', 'HEXAGON', 'X86'):
        seen = set()
        for n, f, l in d.get(k, []):
            if n in seen: continue
            seen.add(n); ic = inc.get(n, {})
            print('  %-7s %s  %s:%d  params=%s init=%s tmpl=%s file=%s' % (k, n.split('__', 1)[-1] if '__' in n else n, f, l,
                  ','.join(ic.get('params', [])) or '?', ','.join(ic.get('init', [])) or '-', tmpl(n), files.get(n, '?')))
