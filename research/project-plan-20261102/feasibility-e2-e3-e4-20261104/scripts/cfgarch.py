#!/usr/bin/env python3
"""Read-only: map every microkernel reference in src/configs/*.c to its
preprocessor arch context and enclosing init function.
Usage: python3 -I cfgarch.py <XNNPACK root> <out.json> [regex-filter-for-printing]"""
import os, re, sys, json
root, out = sys.argv[1], sys.argv[2]
flt = re.compile(sys.argv[3]) if len(sys.argv) > 3 else None
NAME = re.compile(r'\b(xnn_[a-z0-9_]+?_ukernel[a-z0-9_]*__[a-z0-9_]+)\b')
FN = re.compile(r'^(?:static\s+)?(?:void|bool|const\s+struct\s+\w+\s*\*|struct\s+\w+\s*\*)\s*(\w+)\s*\(')
recs = []
cdir = os.path.join(root, 'src', 'configs')
for f in sorted(os.listdir(cdir)):
    if not f.endswith('.c'): continue
    stack = []; fn = None
    for i, line in enumerate(open(os.path.join(cdir, f), errors='ignore'), 1):
        s = line.strip()
        m = FN.match(line)
        if m: fn = m.group(1)
        if s.startswith('#if'):
            stack.append([s[3:].strip()])
        elif s.startswith('#elif') and stack:
            stack[-1].append(s[5:].strip())
        elif s.startswith('#else') and stack:
            stack[-1].append('else')
        elif s.startswith('#endif') and stack:
            stack.pop()
        for n in NAME.findall(line):
            ctx = []
            for conds in stack:
                cur = conds[-1]
                if cur == 'else':
                    cur = 'else(' + ' | '.join(conds[:-1]) + ')'
                if 'XNN_ARCH' in cur: ctx.append(cur)
            recs.append({'name': n, 'file': 'src/configs/' + f, 'line': i, 'fn': fn, 'arch': ' && '.join(ctx)})
json.dump(recs, open(out, 'w'), indent=0)
if flt:
    for r in recs:
        if flt.search(r['name']) or flt.search(r['fn'] or ''):
            print('%s:%d [%s] {%s} %s' % (r['file'], r['line'], r['fn'], r['arch'], r['name']))
