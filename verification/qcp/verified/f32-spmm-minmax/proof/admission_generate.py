#!/usr/bin/env python3
"""Bind freshly generated full C and both strategy interfaces to public goals."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,re,subprocess,sys,time,shutil
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',required=True)
units=['neon','rvv','caller','ordinary','strategy']
for u in units:p.add_argument('--reuse-'+u+'-run')
a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run;O.mkdir(exist_ok=False,parents=True);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();started=time.monotonic()
expected={'neon':443,'rvv':335,'caller':6,'ordinary':4,'strategy':7,'tuple':12}
def name(u):return 'vectors_strategy_goal.v'if u=='strategy'else 'tuple_strategy_goal.v'if u=='tuple'else u+'_goal.v'
def public(u):return ROOT/'proof/coq'/('SpmmVectors/vectors_strategy_goal.v'if u=='strategy'else'SpmmSpec/tuple_strategy_goal.v'if u=='tuple'else'SpmmOrdinary/unit_goal.v'if u=='ordinary'else'Spmm'+u.capitalize()+'/'+u+'_goal.v')
def budget(unit,cmd):
 cmd=[sys.executable,a.budget_runner,'--out',str(O/(unit+'-budget')),'--timeout','21630','--reserve-gib','64','--memory-gib','64','--',*cmd]
 with(O/(unit+'.log')).open('w')as f:r=subprocess.run(cmd,cwd=ROOT,stdout=f,stderr=subprocess.STDOUT)
 assert r.returncode==0,(unit,r.returncode)
 b=json.loads((O/(unit+'-budget/result.json')).read_text());assert b['exit_code']==0 and 'seconds'in b and b.get('kind')!='service_or_resource_failure'
def tuple_run():
 G=O/'generation/tuple';S=G/'snapshot';S.mkdir(parents=True)
 inputs={f:sha(ROOT/f)for f in ['shim/tuple/tuple.strategies','shim/tuple/tuple.h','proof/admission_generate.py']}
 for f in inputs:
  q=S/f;q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(ROOT/f,q)
 t=time.monotonic();cmd=['/usr/bin/prlimit','--as='+str(64*2**30),'--cpu=21600','--','/tmp/qcp214-src/linux-binary/StrategyCheck','--input-file='+str(S/'shim/tuple/tuple.strategies'),'--coq-output-dir='+str(G),'--coq-logic-path=SpmmSpec','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info'];budget('tuple',cmd)
 goal=G/name('tuple');fields=re.findall(r'^\s*Axiom\s+(\w+)',goal.read_text(),re.M)
 r={'generation_ok':bool(fields),'whole_kernel_verified':False,'unit':'tuple','namespace':'SpmmSpec','configured_jobs':32,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seconds':time.monotonic()-t,'fields':fields,'goal_sha256':sha(goal),'input_hashes':inputs,'live_inputs_unchanged':all(sha(ROOT/f)==h for f,h in inputs.items()),'snapshot_inputs_unchanged':all(sha(S/f)==h for f,h in inputs.items()),'records':[{'command':cmd,'exit':0}]}
 (G/'result.json').write_text(json.dumps(r,indent=2)+'\n')
def run(u):
 reuse=getattr(a,'reuse_'+u+'_run',None);source_run=reuse or a.run
 if u=='tuple':tuple_run()
 elif not reuse:budget(u,[sys.executable,str(ROOT/'proof/generate.py'),u,'--run',a.run,'--jobs','32'])
 G=ROOT/'.build'/source_run/'generation'/u;r=json.loads((G/'result.json').read_text())
 assert r['generation_ok']and r['configured_jobs']==32 and r['live_inputs_unchanged']and r['snapshot_inputs_unchanged']
 assert all(sha(ROOT/f)==h and sha(G/'snapshot'/f)==h for f,h in r['input_hashes'].items()),u
 assert sha(G/name(u))==r['goal_sha256']==sha(public(u)),u
 assert len(r['fields'])==expected[u]
 return {'unit':u,'passed':True,'source_run':source_run,'adopted_unchanged_generation':bool(reuse),'result_sha256':sha(G/'result.json'),'goal_sha256':r['goal_sha256'],'fields':len(r['fields']),'input_hashes':r['input_hashes'],'original_generation_utc':r['utc'],'original_generation_seconds':r['seconds'],'public_goal':str(public(u).relative_to(ROOT))}
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:records=list(pool.map(run,units+['tuple']))
r={'passed':all(x['passed']for x in records),'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'seconds':time.monotonic()-started,'units':records,'C_fields':788,'strategy_fields':19,'scope':'Actual complete C and strategy goal generation/binding only; checking separate'}
(O/'generation-summary.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k!='units'})
