#!/usr/bin/env python3
"""Generate all actual C/strategy goals, optionally adopting hash-identical completed runs."""
from pathlib import Path
import argparse,concurrent.futures,datetime,gzip,hashlib,json,re,subprocess,sys,time
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',required=True);p.add_argument('--reuse-neon-run');p.add_argument('--reuse-rvv-run');a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run;O.mkdir(exist_ok=False,parents=True);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
units=['neon','rvv','caller','ordinary','strategy'];started=time.monotonic()
def run(unit):
 reuse=getattr(a,'reuse_'+unit+'_run',None)
 source_run=reuse or a.run
 if not reuse:
  cmd=[sys.executable,a.budget_runner,'--out',str(O/(unit+'-budget')),'--timeout','21630','--reserve-gib','64','--memory-gib','64','--',sys.executable,str(ROOT/'proof/generate.py'),unit,'--run',a.run,'--jobs','32']
  with(O/(unit+'.log')).open('w')as f:r=subprocess.run(cmd,cwd=ROOT,stdout=f,stderr=subprocess.STDOUT)
  assert r.returncode==0,(unit,r.returncode)
  budget=json.loads((O/(unit+'-budget/result.json')).read_text());assert budget['exit_code']==0 and 'seconds'in budget and budget.get('kind')!='service_or_resource_failure'
 G=ROOT/'.build'/source_run/'generation'/unit;r=json.loads((G/'result.json').read_text())
 assert r['generation_ok']and r['configured_jobs']==32 and r['live_inputs_unchanged']and r['snapshot_inputs_unchanged']
 assert all(sha(ROOT/f)==h and sha(G/'snapshot'/f)==h for f,h in r['input_hashes'].items()),unit
 name='copy_strategy_goal.v'if unit=='strategy'else unit+'_goal.v';goal=G/name
 assert sha(goal)==r['goal_sha256']
 if unit=='neon':
  archive=ROOT/'proof/generated/neon_goal.v.gz';assert hashlib.sha256(gzip.decompress(archive.read_bytes())).hexdigest()==r['goal_sha256']
 else:
  ns='Qs8Strategy'if unit=='strategy'else 'Qs8'+unit.capitalize();assert sha(ROOT/'proof/coq'/ns/name)==r['goal_sha256'],unit
 expected={'neon':1261,'rvv':240,'caller':29,'ordinary':1,'strategy':16};assert len(r['fields'])==expected[unit]
 return {'unit':unit,'passed':True,'source_run':source_run,'adopted_unchanged_generation':bool(reuse),'result_sha256':sha(G/'result.json'),'goal_sha256':r['goal_sha256'],'fields':len(r['fields']),'input_hashes':r['input_hashes'],'original_generation_utc':r['utc'],'original_generation_seconds':r['seconds']}
records=[]
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 for row in pool.map(run,units):records.append(row);print(row['unit'],row['fields'],'adopted'if row['adopted_unchanged_generation']else'fresh',flush=True)
r={'passed':all(x['passed']for x in records),'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'seconds':time.monotonic()-started,'units':records,'C_fields':sum(x['fields']for x in records if x['unit']!='strategy'),'strategy_fields':16,'scope':'Actual complete C and strategy goal generation/binding only; proof checking is separate.'}
(O/'generation-summary.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k!='units'})
