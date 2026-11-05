#!/usr/bin/env python3
"""Read-only inventory of XNNPACK microkernels per op and ISA family.
Usage: python3 -I inventory.py <XNNPACK root> <out.json>
Sources: (1) function definitions in src/**/*.c|*.S (excluding .in templates),
(2) declarations in src/xnnpack/*.h and src/**/*.inc, (3) references in src/configs/*.c."""
import os, re, sys, json, collections
root = sys.argv[1]; out = sys.argv[2]
src = os.path.join(root, 'src')
NAME = re.compile(r'\b(xnn_[a-z0-9_]+?_ukernel[a-z0-9_]*__[a-z0-9_]+)\b')
X86 = ('sse','ssse3','sse2','sse41','avx','f16c','fma3','avx2','avx512','avxvnni','avx256','xop','avxvnniint8')
ARMTOK = ('aarch32','aarch64','neon','sve','sme','sme2','arm','fp16arith','armsimd32','neonfp16arith','neonsme','neonsme2')
def tok_family(t):
    if t.startswith('rvv'): return 'rvv'
    if t.startswith('hvx'): return 'hvx'
    if t.startswith('wasm'): return 'wasm'
    if t.startswith(('aarch','neon','sve','sme')) or t in ARMTOK: return 'arm'
    if t == 'amd64': return 'x86'
    for p in X86:
        if t.startswith(p): return 'x86'
    if t.startswith('scalar'): return 'scalar'
    return None
def isa_family(isa):
    # v2: scan every token of the ISA suffix (handles tile-before-ISA names such as
    # transposec '__4x4_sse', 'asm_amd64_avx512f', '__ukernel_4x16c4__asm_aarch64').
    for t in re.split(r'[_]+', isa):
        f = tok_family(t)
        if f: return f
    return 'other:'+isa.split('_')[0]
TILE = re.compile(r'_(\d+x\d+[a-z0-9]*|x\d+[a-z0-9]*|\d+p\d+c[a-z0-9]*|\d+f\d+m\d+l\d+c\d+s\d+r|\d+x\d+s\d+p\d+|p\d+[a-z0-9]*|c\d+[a-z0-9]*|\d+x\d+p\d+|\d+p\d+c|\dx\d+c\d+s\d+r)$')
def split(name):
    name = name.replace('__ukernel_', '_ukernel_')
    pre, isa = name.split('__', 1)
    op = pre.replace('_ukernel', '').replace('xnn_', '', 1)
    m = re.match(r'^(.*?)(?:_ukernel_(.+))?$', pre.replace('xnn_','',1))
    base = pre.replace('xnn_','',1)
    if '_ukernel_' in base:
        opn, tile = base.split('_ukernel_', 1)
    else:
        opn, tile = base.replace('_ukernel',''), ''
    return opn, tile, isa
defs = collections.defaultdict(set); decl = collections.defaultdict(set); cfg = collections.defaultdict(set)
files = collections.defaultdict(set)
for dp, dn, fn in os.walk(src):
    for f in fn:
        p = os.path.join(dp, f); rel = os.path.relpath(p, root)
        if f.endswith('.in'): continue
        try: txt = open(p, errors='ignore').read()
        except Exception: continue
        if f.endswith(('.c','.S','.cc')) and '/configs/' not in p and '/test' not in p:
            for m in re.finditer(r'(?:void|size_t)\s+(xnn_[a-z0-9_]+__[a-z0-9_]+)\s*\(', txt):
                defs[m.group(1)].add(rel)
            for m in re.finditer(r'BEGIN_FUNCTION\s+(xnn_[a-z0-9_]+__[a-z0-9_]+)', txt):
                defs[m.group(1)].add(rel)
        if f.endswith(('.h','.inc')) and '/configs/' not in p:
            for m in NAME.finditer(txt): decl[m.group(1)].add(rel)
        if '/configs/' in p and f.endswith('.c'):
            for m in NAME.finditer(txt): cfg[m.group(1)].add(rel)
ops = collections.defaultdict(lambda: collections.defaultdict(lambda: {'def':[], 'decl':0, 'cfg':[]}))
allnames = set(defs)|set(decl)|set(cfg)
for n in allnames:
    if '__' not in n.replace('__ukernel_','_ukernel_') or '_ukernel' not in n: continue
    opn, tile, isa = split(n)
    fam = isa_family(isa)
    e = ops[opn][fam]
    if n in defs: e['def'].append({'name':n,'files':sorted(defs[n]),'tile':tile,'isa':isa})
    if n in decl: e['decl'] += 1
    if n in cfg: e['cfg'].append(n)
json.dump(ops, open(out,'w'), indent=1, sort_keys=True)
fams = ['x86','arm','rvv','hvx','scalar']
print('op'.ljust(40), *[f.ljust(12) for f in fams])
for opn in sorted(ops):
    row=[]
    for f in fams:
        e = ops[opn].get(f)
        row.append(('%d/%d'%(len(e['def']),len(e['cfg'])) if e else '-').ljust(12))
    print(opn.ljust(40), *row)
