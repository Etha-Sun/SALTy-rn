#!/usr/bin/env python3
"""Recursively check the fresh compiled closure; no no-check/admit shortcuts."""
from pathlib import Path
import argparse,json,hashlib,subprocess,time,datetime,re
T=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--memory-gib',type=int,choices=[16,32],default=16);p.add_argument('--seconds',type=int,default=7200);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',required=True);p.add_argument('--module',action='append',required=True);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[\w-]+',a.run)
B=T/'.build'/a.compile_run/'compile';C=json.loads((B/'result.json').read_text());assert C['passed'] and C['inputs_unchanged'];O=T/'.build'/a.run/'recursive-check';O.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();manifest=json.loads((B/'manifest.json').read_text());sources={m['path']:m['sha256'] for m in manifest['modules']};objects={r['path'][:-2]+'.vo':r['vo_sha256']for r in C['records']}
assert all(v and sha(B/k)==v for k,v in objects.items());assert all(sha(T/k)==v and sha(B/k)==v for k,v in sources.items())
flags=json.loads((B/'flags.json').read_text());flags=[x for x in flags if x!='-q'];checker=Path('/tmp/qcp-coq820-install/bin/coqchk');command=[str(checker),'-silent',*flags,*a.module]
inputs={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'scope':'explicit recursive roots and their complete transitive imports','modules':a.module,'compile_run':a.compile_run,'coqchk_sha256':sha(checker),'sources':sources,'objects':objects,'command':command};(O/'inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
cmd=['python3',a.budget_runner,'--out',str(O/'budget'),'--timeout',str(a.seconds+30),'--reserve-gib',str(a.memory_gib),'--memory-gib',str(a.memory_gib),'--','/usr/bin/prlimit','--as='+str(a.memory_gib*2**30),'--cpu='+str(a.seconds),'--',*command];start=time.monotonic();r=subprocess.run(cmd,cwd=B)
p=O/'budget/result.json';budget=json.loads(p.read_text()) if p.exists() else {};unchanged=all(sha(T/k)==v and sha(B/k)==v for k,v in sources.items()) and all(sha(B/k)==v for k,v in objects.items());passed=r.returncode==0 and budget.get('exit_code')==0 and 'seconds' in budget and budget.get('kind')!='service_or_resource_failure' and unchanged
R={'passed':passed,'exit':r.returncode,'seconds':time.monotonic()-start,'configured_jobs':32,'checked_roots':a.module,'fresh_local_objects':len(objects),'inputs_unchanged':unchanged,'recursive':True,'no_skip_flags':True};(O/'result.json').write_text(json.dumps(R,indent=2)+'\n');print(R);raise SystemExit(not passed)
