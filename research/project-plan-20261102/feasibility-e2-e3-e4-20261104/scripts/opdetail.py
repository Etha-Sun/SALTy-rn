#!/usr/bin/env python3
"""Read-only: for given ops, list per-family kernels with file, template, params type/init,
registration (config lines), line count and distinct intrinsic count.
Usage: python3 -I opdetail.py <XNNPACK root> inventory.json inc.json cfgarch.json op [op...] [--fam x86,arm,rvv,hvx,scalar] [--reg-only]"""
import sys, json, re, os, collections
root = sys.argv[1]; inv = json.load(open(sys.argv[2])); inc = json.load(open(sys.argv[3])); cfg = json.load(open(sys.argv[4]))
args = sys.argv[5:]; fams = ['x86', 'arm', 'rvv', 'hvx', 'scalar']; regonly = False; ops = []
i = 0
while i < len(args):
    if args[i] == '--fam': fams = args[i+1].split(','); i += 2; continue
    if args[i] == '--reg-only': regonly = True; i += 1; continue
    ops.append(args[i]); i += 1
creg = collections.defaultdict(list)
for r in cfg: creg[r['name']].append('%s:%d{%s}' % (r['file'].replace('src/configs/', ''), r['line'], (r['arch'] or 'noarch')[:40]))
INTR = re.compile(r'\b(_mm\d*_[a-z0-9_]+|v[a-z0-9_]+q?_[a-z0-9]+|__riscv_[a-z0-9_]+|Q6_[A-Za-z0-9_]+|xnn_[a-z0-9]+_[a-z0-9_]+)\s*\(')
def info(path):
    t = open(os.path.join(root, path), errors='ignore').read()
    tm = re.search(r'Template:\s*(\S+)', t[:600]); 
    calls = [m for m in INTR.findall(t) if not m.startswith('xnn_') or m.startswith(('xnn_load','xnn_store','xnn_add','xnn_mul','xnn_sub','xnn_max','xnn_min','xnn_fma','xnn_div','xnn_set','xnn_and','xnn_or','xnn_xor','xnn_sl','xnn_sr','xnn_cmp','xnn_get','xnn_neg','xnn_abs','xnn_round','xnn_zero','xnn_reduce','xnn_extract'))]
    return tm.group(1) if tm else '-', t.count('\n'), len(set(calls)), len(calls), 'OOB' if 'XNN_OOB_READS' in t else ''
for op in ops:
    print('=== ' + op)
    for f in fams:
        e = inv.get(op, {}).get(f)
        if not e: print('  [%s] none' % f); continue
        for d in sorted(e['def'], key=lambda x: x['name']):
            n = d['name']; reg = creg.get(n, [])
            if regonly and not reg: continue
            ic = inc.get(n, {})
            tmpl, nl, nd, nc, oob = info(d['files'][0])
            print('  [%s] %s\n       file=%s tmpl=%s lines=%d intr=%d/%d %s\n       params=%s init=%s inc=%s:%s\n       reg=%s' % (
                f, n, d['files'][0], tmpl, nl, nd, nc, oob, ','.join(ic.get('params', [])) or '?', ','.join(ic.get('init', [])) or '-',
                ic.get('inc', '?'), ic.get('line', ''), ' '.join(reg[:3]) or 'NOT-REGISTERED'))
