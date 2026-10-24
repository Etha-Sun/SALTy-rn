#!/usr/bin/env python3
"""Complete fresh admission. Never overwrites a named run or the published certificate."""
from pathlib import Path
import argparse,concurrent.futures,json,subprocess,sys,time
from prepare import ROOT,UNITS
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run;O.mkdir(parents=True,exist_ok=False);records=[]
def invoke(cmd,label,memory=None):
 if a.budget_runner and memory:cmd=['python3',str(a.budget_runner),'--out',str(O/'budget'/label),'--timeout','21700','--reserve-gib',str(memory),'--memory-gib',str(memory),'--',*cmd]
 t=time.monotonic()
 with (O/(label+'.log')).open('w') as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
 out={'phase':label,'exit':r.returncode,'seconds':time.monotonic()-t,'command':cmd};records.append(out);return r.returncode
assert invoke(['python3',str(ROOT/'proof/environment.py'),'--run',a.run],'environment')==0
assert invoke(['python3',str(ROOT/'proof/dependency_audit.py'),'--run',a.run],'dependencies')==0
assert invoke(['python3',str(ROOT/'proof/strategy_binding.py'),'--run',a.run,'--jobs','32'],'strategy',16)==0
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
 jobs=[pool.submit(invoke,['python3',str(ROOT/'proof/generate.py'),unit,'--run',a.run,'--jobs','32','--memory-gib','64' if unit=='neon' else '16'],'generate-'+unit,64 if unit=='neon' else 16) for unit in UNITS]
 codes=[f.result() for f in jobs]
if any(codes):raise SystemExit('C generation failed; inspect immutable run logs')
assert invoke(['python3',str(ROOT/'proof/audit.py'),'--run',a.run],'bindings')==0
budget=['--budget-runner',str(a.budget_runner)] if a.budget_runner else []
assert invoke(['python3',str(ROOT/'proof/compile.py'),'--run',a.run,'--jobs','32',*budget],'compile')==0
assert invoke(['python3',str(ROOT/'proof/final.py'),'--compile-run',a.run,'--run',a.run,'--jobs','32',*budget],'final')==0
assert invoke(['python3',str(ROOT/'proof/native.py'),'--run',a.run,'--jobs','32'],'native',16)==0
assert invoke(['python3',str(ROOT/'proof/negative.py'),'--run',a.run,'--jobs','32'],'negative',16)==0
(O/'complete.json').write_text(json.dumps({'passed':True,'configured_jobs':32,'records':records,'scope':'full actual C bodies under source-reviewed intrinsic specs; modular partial correctness'},indent=2)+'\n')
print(O/'complete.json')
