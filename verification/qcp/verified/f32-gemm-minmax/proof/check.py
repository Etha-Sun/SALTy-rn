#!/usr/bin/env python3
"""Complete fresh F32 GEMM admission with32 configured workers and immutable run names."""
from pathlib import Path
import argparse,concurrent.futures,subprocess,json,time
from prepare import ROOT,UNITS
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run;O.mkdir(parents=True,exist_ok=False);records=[]
def invoke(cmd,label,memory=None):
 if a.budget_runner and memory:cmd=['python3',str(a.budget_runner),'--out',str(O/'budget'/label),'--timeout','21700','--reserve-gib',str(memory),'--memory-gib',str(memory),'--',*cmd]
 start=time.monotonic()
 with (O/(label+'.log')).open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
 records.append({'phase':label,'exit':r.returncode,'seconds':time.monotonic()-start,'command':cmd});return r.returncode
for name in ['environment','dependency_audit']:assert invoke(['python3',str(ROOT/'proof'/(name+'.py')),'--run',a.run],name)==0
with concurrent.futures.ThreadPoolExecutor(max_workers=32) as pool:
 jobs=[pool.submit(invoke,['python3',str(ROOT/'proof/generate.py'),u,'--run',a.run,'--jobs','32','--memory-gib','64' if u=='neon' else '32'],'generation-'+u,64 if u=='neon' else 32) for u in UNITS]
 jobs.append(pool.submit(invoke,['python3',str(ROOT/'proof/generate_assert.py'),'--run',a.run,'--jobs','32'],'generation-ordinary',16))
 assert all(f.result()==0 for f in jobs),'fresh C generation failed'
assert invoke(['python3',str(ROOT/'proof/audit.py'),'--run',a.run,'--ordinary-run',a.run],'bindings')==0
budget=['--budget-runner',str(a.budget_runner)] if a.budget_runner else []
assert invoke(['python3',str(ROOT/'proof/compile.py'),'--run',a.run,'--jobs','32',*budget],'compile')==0
assert invoke(['python3',str(ROOT/'proof/final.py'),'--compile-run',a.run,'--run',a.run,'--jobs','32',*budget],'final')==0
for name in ['native','negative']:assert invoke(['python3',str(ROOT/'proof'/(name+'.py')),'--run',a.run,'--jobs','32'],name,16)==0
(O/'complete.json').write_text(json.dumps({'passed':True,'configured_jobs':32,'records':records},indent=2)+'\n')
