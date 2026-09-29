#!/usr/bin/env python3
"""Longer, monitored continuation of the two previously interrupted checks."""
import argparse, json, shutil
from probe import HERE, UP, OLD, ENV, run, sha

p=argparse.ArgumentParser()
p.add_argument('--timeout',type=int,default=7200)
args=p.parse_args()
for stem in ['attempt-RvvProof.json']:
    source=HERE/'results'/stem
    if source.exists():shutil.copy2(source,HERE/'attempts'/('previous-'+stem))
command=[ENV,'coqc','-time','-Q',UP/'_build/default/theories','isla',
         '-Q',HERE/'generated','Bridge','-Q',OLD,'',HERE/'RvvProof.v']
r=run('attempt-RvvProof',command,timeout=args.timeout)
output=(HERE/'logs/attempt-RvvProof.log').read_text()
r.update(no_extra_axioms=r['exit_code']==0 and 'Closed under the global context' in output and 'Axioms:' not in output,
         source_sha256=sha(HERE/'RvvProof.v'),theorem_completed=r['exit_code']==0)
(HERE/'results/attempt-RvvProof.json').write_text(json.dumps(r,indent=2)+'\n')
raise SystemExit(0 if r['no_extra_axioms'] else 1)
