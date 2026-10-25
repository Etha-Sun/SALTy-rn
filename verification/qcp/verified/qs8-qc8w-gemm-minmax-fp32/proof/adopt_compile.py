#!/usr/bin/env python3
"""Bind an explicitly selected completed continuation of this case's fresh compile."""
from pathlib import Path
import argparse,json,hashlib,datetime
T=Path(__file__).resolve().parents[1];p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--run',required=True);a=p.parse_args();B=T/'.build'/a.compile_run/'compile';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();r=json.loads((B/'result.json').read_text());d=json.loads((B/'manifest.json').read_text())
assert r['passed']and r['inputs_unchanged']and r['configured_jobs']==32 and d==json.loads((T/'proof/dependencies.json').read_text())
assert d['roots']==['proof/coq/Qs8Admission/FinalCheck.v']and r['fresh_modules']==len(d['modules'])==len(r['records'])
for m in d['modules']:assert sha(T/m['path'])==sha(B/m['path'])==m['sha256']
for m in r['records']:assert m['exit']==0 and m['proof_object_exists']and m['budget_ok']and sha((B/m['path']).with_suffix('.vo'))==m['vo_sha256']
launch=json.loads((B/'launch.json').read_text());assert sha(Path(launch['coqc']))==launch['coqc_sha256']
result={'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'compile_run':a.compile_run,'manifest_sha256':sha(B/'manifest.json'),'result_sha256':sha(B/'result.json'),'fresh_compiled_modules':len(r['records']),'continuations':len(r.get('continuations',[])),'scope':'Explicit adoption of the completed same-case fresh compile, including recorded continuations. No local proof object copied or recompiled by this stage; recursive checking and complete admission audit still required.'}
O=T/'.build'/a.run/'compile-adoption.json';assert not O.exists();O.write_text(json.dumps(result,indent=2)+'\n');print(result)
