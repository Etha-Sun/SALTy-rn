#!/usr/bin/env python3
"""Read-only: parse XNN_*UKERNEL(...) entries in src/**/*.inc; record arch flag,
params type and init fn per microkernel, plus the preprocessor guard.
Usage: python3 -I incparse.py <XNNPACK root> <out.json>"""
import os, re, sys, json
root, out = sys.argv[1], sys.argv[2]
M = re.compile(r'^(XNN_[A-Z_]*UKERNEL[A-Z_0-9]*)\((.*)\)\s*$')
recs = {}
for dp, dn, fn in os.walk(os.path.join(root, 'src')):
    for f in fn:
        if not f.endswith('.inc') or '/configs' in dp: continue
        p = os.path.join(dp, f); rel = os.path.relpath(p, root)
        guard = []
        buf = ''; start = 0
        for i, line in enumerate(open(p, errors='ignore'), 1):
            s = line.strip()
            if s.startswith('#if'): guard.append(s)
            elif s.startswith('#endif') and guard: guard.pop()
            if buf or s.startswith('XNN_') and 'UKERNEL' in s.split('(')[0]:
                if not buf: start = i
                buf += ' ' + s
                if buf.count('(') == buf.count(')'):
                    m = M.match(buf.strip())
                    if m:
                        args = [a.strip() for a in re.split(r',(?![^()]*\))', m.group(2))]
                        name = next((a for a in args if a.startswith('xnn_') and '_ukernel' in a), None)
                        if name:
                            recs[name] = {'inc': rel, 'line': start, 'macro': m.group(1), 'arch': args[0],
                                          'params': [a for a in args if 'params' in a and not a.startswith('xnn_init') and not a.startswith('((')],
                                          'init': [a for a in args if 'init' in a],
                                          'args': args, 'guard': ' && '.join(guard)}
                    buf = ''
json.dump(recs, open(out, 'w'), indent=0)
print(len(recs), 'entries')
