import sys
blocks = {}; cur = None
for l in open(sys.argv[1]):
    if not l.startswith(' '): cur = l.strip(); blocks[cur] = []
    else: blocks[cur].append(l.rstrip()[:230])
for op in sys.argv[2:]:
    print(op); print('\n'.join(blocks.get(op, ['   (no config refs)'])))
