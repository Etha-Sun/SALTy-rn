#!/usr/bin/env python3
"""Compile one local proof and record its assumption check and source hash."""
import argparse,json,re
from probe import HERE,UP,OLD,ENV,run,sha
p=argparse.ArgumentParser();p.add_argument('file');p.add_argument('--timeout',type=int,default=7200)
a=p.parse_args();source=(HERE/a.file).resolve()
assert source.parent==HERE and source.suffix=='.v'
name='proof-'+source.stem
r=run(name,[ENV,'coqc','-time','-Q',UP/'_build/default/theories','isla','-Q',HERE/'generated','Bridge','-Q',OLD,'',source],timeout=a.timeout)
out=(HERE/'logs'/(name+'.log')).read_text()
checked=r['input_sha256'][str(source)]
contains_unfinished_command=bool(re.search(r'\b(?:Abort|Admitted|admit)\s*\.', source.read_text()))
r.update(no_extra_axioms=r['exit_code']==0 and 'Closed under the global context' in out and 'Axioms:' not in out and checked==sha(source) and not contains_unfinished_command,source_sha256=checked,source_unchanged=checked==sha(source),contains_unfinished_command=contains_unfinished_command)
(HERE/'results'/(name+'.json')).write_text(json.dumps(r,indent=2)+'\n')
raise SystemExit(0 if r['no_extra_axioms'] else 1)
