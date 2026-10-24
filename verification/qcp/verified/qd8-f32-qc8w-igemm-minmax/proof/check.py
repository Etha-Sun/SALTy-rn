#!/usr/bin/env python3
"""Fresh full C/strategy generation, exact bindings, complete Coq interfaces and controls."""
from pathlib import Path
import argparse,concurrent.futures,json,subprocess,time
from admission_prepare import ROOT,UNITS
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run;O.mkdir(parents=True,exist_ok=False);records=[]
def invoke(cmd,label,memory=None,timeout=21700):
 if memory:cmd=['python3',str(a.budget_runner),'--out',str(O/'budget'/label),'--timeout',str(timeout),'--reserve-gib',str(memory),'--memory-gib',str(memory),'--',*cmd]
 start=time.monotonic()
 with (O/(label+'.log')).open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,cwd=ROOT)
 records.append({'phase':label,'exit':r.returncode,'seconds':time.monotonic()-start,'command':cmd});return r.returncode
for phase in ['environment','dependency_audit']:assert invoke(['python3',str(ROOT/'proof'/f'{phase}.py'),'--run',a.run],phase)==0
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 futures=[pool.submit(invoke,['python3',str(ROOT/'proof/generate.py'),u,'--run',a.run,'--jobs','32','--memory-gib',str(64 if u in ['neon','rvv']else 16)],'generate-'+u,64 if u in ['neon','rvv']else 16)for u in UNITS]
 futures += [pool.submit(invoke,['python3',str(ROOT/'proof/strategy_binding.py'),'--run',a.run,'--jobs','32','--strategy',s],'strategy-'+s,16)for s in ['copy','indirection']]
 codes=[f.result()for f in futures]
assert not any(codes),'fresh C or strategy generation failed'
assert invoke(['python3',str(ROOT/'proof/audit.py'),'--run',a.run],'bindings')==0
budget=['--budget-runner',str(a.budget_runner)]
assert invoke(['python3',str(ROOT/'proof/compile.py'),'--run',a.run,'--jobs','32',*budget],'compile')==0
assert invoke(['python3',str(ROOT/'proof/final.py'),'--compile-run',a.run,'--run',a.run,'--jobs','32',*budget],'final')==0
assert invoke(['python3',str(ROOT/'proof/native.py'),'--run',a.run,'--jobs','32'],'native',16,1800)==0
assert invoke(['python3',str(ROOT/'proof/negative.py'),'--run',a.run,'--jobs','32'],'negative',16,240)==0
(O/'complete.json').write_text(json.dumps({'passed':True,'configured_jobs':32,'records':records,'scope':'complete C-shim modular partial correctness under source-reviewed intrinsic specs'},indent=2)+'\n');print(O/'complete.json')
