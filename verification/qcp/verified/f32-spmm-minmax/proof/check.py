#!/usr/bin/env python3
"""Replay/adopt unchanged full-case inputs, then freshly recursively check and audit."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,re,subprocess,sys,time
T=Path(__file__).resolve().parents[1];p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',required=True)
for k in ['compile','generation','native','auxiliary']:p.add_argument('--reuse-'+k+'-run')
a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run);assert(T/'proof/coq/SpmmAdmission/FinalCheck.v').is_file()
O=T/'.build'/a.run;O.mkdir(exist_ok=False,parents=True);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();start=time.monotonic();records=[]
compile_run=a.reuse_compile_run or a.run+'-compile';generation_run=a.reuse_generation_run or a.run+'-generation';native_run=a.reuse_native_run or a.run+'-native';aux_run=a.reuse_auxiliary_run or a.run+'-auxiliary';recursive_run=a.run+'-recursive'
manifest=T/'proof/manifest.json';sealed=json.loads(manifest.read_text())if manifest.exists()else None
if sealed:
 sealed_sha=sha(manifest)
 for x in sealed['files']:assert sha(T/x['path'])==x['sha256']
def cmd(script,*args):return [sys.executable,str(T/'proof'/script),*args]
def task(name,args,mem=None,seconds=1800):
 if mem:args=[sys.executable,a.budget_runner,'--out',str(O/(name+'-budget')),'--timeout',str(seconds),'--reserve-gib',str(mem),'--memory-gib',str(mem),'--',*args]
 t=time.monotonic()
 with(O/(name+'.log')).open('w')as f:r=subprocess.run(args,cwd=T,stdout=f,stderr=subprocess.STDOUT)
 row={'stage':name,'exit':r.returncode,'seconds':time.monotonic()-t,'command':args}
 if mem:
  bp=O/(name+'-budget/result.json');b=json.loads(bp.read_text())if bp.exists()else{};row['budget_normal']=b.get('exit_code')==0 and 'seconds'in b and b.get('kind')!='service_or_resource_failure'
  if not row['budget_normal']and row['exit']==0:row['exit']=125
 print(name,'exit',row['exit'],flush=True);return row
def adopt_generation():
 G=T/'.build'/generation_run/'generation-summary.json';r=json.loads(G.read_text());assert r['passed']and r['C_fields']==788 and r['strategy_fields']==19 and r['configured_jobs']==32
 for x in r['units']:
  base=T/'.build'/x['source_run']/'generation'/x['unit'];assert sha(base/'result.json')==x['result_sha256'];assert sha(T/x['public_goal'])==x['goal_sha256']
  for f,h in x['input_hashes'].items():assert sha(T/f)==sha(base/'snapshot'/f)==h
 (O/'generation-adoption.json').write_text(json.dumps({'passed':True,'source_run':generation_run,'summary_sha256':sha(G),'scope':'Exact existing actual full-C/strategy generation; not newly run'},indent=2)+'\n')
 return {'stage':'generation-adopted','exit':0}
def adopt_auxiliary():
 A=T/'.build'/aux_run
 for k in ['negative','dependency-audit']:
  r=json.loads((A/k/'result.json').read_text());assert r['passed']
 r=json.loads((A/'negative/result.json').read_text());assert r['native_run']==native_run
 for f,h in r['input_sha256'].items():assert sha(T/f)==h
 r=json.loads((A/'environment/result.json').read_text())
 for x in r['external_files']+r['binaries']:assert sha(Path(x['path']))==x['sha256']
 return {'stage':'auxiliary-adopted','exit':0,'source_run':aux_run,'scope':'Unchanged installed environment and existing negative/dependency checks; final audit rechecks identities'}
work=[]
if a.reuse_compile_run:work.append(('compile-adopted',cmd('adopt_compile.py','--compile-run',compile_run,'--run',a.run),16))
else:work.append(('compile',cmd('compile.py','--run',compile_run,'--jobs','32','--keep-going','--budget-runner',a.budget_runner)))
if not a.reuse_generation_run:work.append(('generation',cmd('admission_generate.py','--run',generation_run,'--jobs','32','--budget-runner',a.budget_runner)))
if not a.reuse_auxiliary_run:work.extend([('environment',cmd('environment.py','--run',aux_run),16),('dependency-audit',cmd('dependency_audit.py','--run',aux_run),16)])
if not a.reuse_native_run:work.append(('native',cmd('native.py','--run',native_run,'--jobs','32','--budget-runner',a.budget_runner)))
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 futures=[pool.submit(task,*x)for x in work]
 if a.reuse_generation_run:futures.append(pool.submit(adopt_generation))
 if a.reuse_auxiliary_run:futures.append(pool.submit(adopt_auxiliary))
 for f in concurrent.futures.as_completed(futures):records.append(f.result());(O/'progress.json').write_text(json.dumps(records,indent=2)+'\n')
passed=all(x['exit']==0 for x in records)
if passed:
 work=[('recursive',cmd('recursive_check.py','--compile-run',compile_run,'--run',recursive_run,'--jobs','32','--memory-gib','32','--seconds','14400','--budget-runner',a.budget_runner,'--module','SpmmAdmission.FinalCheck'))]
 if not a.reuse_auxiliary_run:work.append(('negative',cmd('negative.py','--run',aux_run,'--native-run',native_run,'--jobs','32','--budget-runner',a.budget_runner)))
 with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
  for f in concurrent.futures.as_completed([pool.submit(task,*x)for x in work]):records.append(f.result());(O/'progress.json').write_text(json.dumps(records,indent=2)+'\n')
 passed=all(x['exit']==0 for x in records)
if passed:
 records.append(task('binding-audit',cmd('audit.py','--run',a.run,'--compile-run',compile_run,'--generation-run',generation_run,'--recursive-run',recursive_run,'--auxiliary-run',aux_run),16));passed=all(x['exit']==0 for x in records)
if sealed:passed &= sha(manifest)==sealed_sha and all(sha(T/x['path'])==x['sha256']for x in sealed['files'])
r={'passed':passed,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'seconds':time.monotonic()-start,'compile_run':compile_run,'generation_run':generation_run,'recursive_run':recursive_run,'auxiliary_run':aux_run,'native_run':native_run,'adopted_compile':bool(a.reuse_compile_run),'adopted_generation':bool(a.reuse_generation_run),'adopted_auxiliary':bool(a.reuse_auxiliary_run),'adopted_native':bool(a.reuse_native_run),'records':records,'sealed_evidence_overwritten':False,'boundary':'Full C-shim modular partial correctness under source-reviewed intrinsic specs; no formal ISA/ABI/termination/arbitrary-VLEN theorem.'}
(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k!='records'});raise SystemExit(not passed)
