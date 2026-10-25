#!/usr/bin/env python3
"""Replay the complete packaged matrix-kernel case with 32 configured workers."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,re,subprocess,sys,time
T=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',required=True);p.add_argument('--reuse-neon-run');p.add_argument('--reuse-rvv-run');p.add_argument('--reuse-native-run');p.add_argument('--reuse-compile-run');a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
assert (T/'proof/coq/Qs8Admission/FinalCheck.v').is_file(),'Complete proof assembly required'
O=T/'.build'/a.run;O.mkdir(exist_ok=False,parents=True);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();start=time.monotonic();records=[]
manifest=T/'proof/manifest.json';sealed=json.loads(manifest.read_text())if manifest.exists()else None
if sealed:
 for x in sealed['files']:assert sha(T/x['path'])==x['sha256']
 sealed_sha=sha(manifest)
compile_run=a.reuse_compile_run or a.run+'-compile';generation_run=a.run+'-generation';aux_run=a.run+'-auxiliary';recursive_run=a.run+'-recursive';native_run=a.reuse_native_run or a.run+'-native'
def command(script,*options):return [sys.executable,str(T/'proof'/script),*options]
def task(name,cmd,mem=None,seconds=1800):
 actual=cmd
 if mem:actual=[sys.executable,a.budget_runner,'--out',str(O/(name+'-budget')),'--timeout',str(seconds),'--reserve-gib',str(mem),'--memory-gib',str(mem),'--',*cmd]
 t=time.monotonic()
 with(O/(name+'.log')).open('w')as f:r=subprocess.run(actual,cwd=T,stdout=f,stderr=subprocess.STDOUT)
 row={'stage':name,'exit':r.returncode,'seconds':time.monotonic()-t,'command':actual}
 if mem:
  bpath=O/(name+'-budget/result.json');b=json.loads(bpath.read_text())if bpath.exists()else{}
  row['budget_normal']='seconds'in b and b.get('exit_code')==0 and b.get('kind')!='service_or_resource_failure'
  if not row['budget_normal']and row['exit']==0:row['exit']=125
 print(name,'exit',row['exit'],flush=True);return row
gen=command('admission_generate.py','--run',generation_run,'--jobs','32','--budget-runner',a.budget_runner)
for unit in ['neon','rvv']:
 reuse=getattr(a,'reuse_'+unit+'_run')
 if reuse:gen+=['--reuse-'+unit+'-run',reuse]
compile_task=('compile-adopted',command('adopt_compile.py','--compile-run',compile_run,'--run',a.run),16)if a.reuse_compile_run else('compile',command('compile.py','--run',compile_run,'--jobs','32','--keep-going','--budget-runner',a.budget_runner))
work=[('generation',gen),compile_task,('environment',command('environment.py','--run',aux_run),16),('dependency-audit',command('dependency_audit.py','--run',aux_run),16)]
if not a.reuse_native_run:work.append(('native',command('native.py','--run',native_run,'--jobs','32','--budget-runner',a.budget_runner)))
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
 for future in concurrent.futures.as_completed([pool.submit(task,*row)for row in work]):records.append(future.result());(O/'progress.json').write_text(json.dumps(records,indent=2)+'\n')
passed=all(r['exit']==0 for r in records)
if passed:
 work=[('negative',command('negative.py','--run',aux_run,'--native-run',native_run,'--jobs','32','--budget-runner',a.budget_runner)),('recursive',command('recursive_check.py','--compile-run',compile_run,'--run',recursive_run,'--jobs','32','--memory-gib','32','--seconds','14400','--budget-runner',a.budget_runner,'--module','Qs8Admission.FinalCheck'))]
 with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
  for future in concurrent.futures.as_completed([pool.submit(task,*row)for row in work]):records.append(future.result());(O/'progress.json').write_text(json.dumps(records,indent=2)+'\n')
 passed=all(r['exit']==0 for r in records)
if passed:
 cmd=command('audit.py','--compile-run',compile_run,'--generation-run',generation_run,'--recursive-run',recursive_run,'--negative-run',aux_run,'--environment-run',aux_run,'--dependency-run',aux_run)
 records.append(task('binding-audit',cmd,16));passed=all(r['exit']==0 for r in records)
if sealed:passed &= sha(manifest)==sealed_sha and all(sha(T/x['path'])==x['sha256']for x in sealed['files'])
r={'passed':passed,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'seconds':time.monotonic()-start,'compile_run':compile_run,'generation_run':generation_run,'recursive_run':recursive_run,'auxiliary_run':aux_run,'native_run':native_run,'adopted_native':bool(a.reuse_native_run),'adopted_compile':bool(a.reuse_compile_run),'records':records,'sealed_evidence_overwritten':False,'boundary':'Source-reviewed intrinsic-spec modular partial correctness; explicit capacity/configuration contracts; no formal ISA/ABI or termination theorem.'};(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k!='records'});raise SystemExit(not passed)
