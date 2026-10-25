#!/usr/bin/env python3
"""Generate actual live C obligations into a new isolated evidence directory."""
from pathlib import Path
import argparse,datetime,hashlib,json,os,re,shutil,subprocess,time
from prepare import ROOT,source
p=argparse.ArgumentParser();p.add_argument('unit',choices=['neon','rvv','caller','ordinary','strategy']);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--seconds',type=int,default=21600);p.add_argument('--memory-gib',type=int,default=64);a=p.parse_args();assert a.jobs==32 and re.fullmatch('[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'generation'/a.unit;O.mkdir(parents=True,exist_ok=False);S=O/'snapshot';S.mkdir();sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
files=[ROOT/'spec.c',ROOT/'proof/prepare.py',Path(__file__)]+[f for d in ['impl','shim','contracts','proof/c'] for f in (ROOT/d).rglob('*') if f.is_file()]
inputs={str(f.relative_to(ROOT)):sha(f) for f in files}
for f in files:
 target=S/f.relative_to(ROOT);target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(f,target)
(O/'input.json').write_text(json.dumps(inputs,indent=2)+'\n')
ns='Qs8Strategy' if a.unit=='strategy' else 'Qs8'+a.unit.capitalize();commands=[]
if a.unit=='strategy':
 commands=[['/tmp/qcp214-src/linux-binary/StrategyCheck','--input-file='+str(S/'shim/copy.strategies'),'--coq-output-dir='+str(O),'--coq-logic-path='+ns,'--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info']];goal=O/'copy_strategy_goal.v'
else:
 annotated=O/'annotated.c';annotated.write_text(source(a.unit));unit=O/(a.unit+'.c')
 commands=[['gcc','-E','-P','-CC','-nostdinc','-I',str(S),'-I',str(S/'shim'),str(annotated),'-o',str(unit)],['/tmp/qcp214-src/linux-binary/symexec','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--no-record-strategies','--strategy-application-limit','4096','--input-file='+str(unit),'--coq-output-dir='+str(O),'--coq-logic-path='+ns,'-slp',str(S/'shim'),'Qs8Gemm']];goal=O/(a.unit+'_goal.v')
records=[];start=time.monotonic()
for i,cmd in enumerate(commands):
 cmd=['/usr/bin/prlimit','--as='+str(a.memory_gib*2**30),'--cpu='+str(a.seconds),'--',*cmd]
 t=time.monotonic()
 with (O/f'step{i}.log').open('w') as log:
  try:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,cwd=O,timeout=a.seconds);rc=r.returncode
  except subprocess.TimeoutExpired:rc=124
 records.append({'command':cmd,'exit':rc,'seconds':time.monotonic()-t})
 if rc:break
fields=re.findall(r'^\s*Axiom\s+(\w+)',goal.read_text(),re.M) if goal.exists() else []
res={'generation_ok':rc==0 and bool(fields),'whole_kernel_verified':False,'unit':a.unit,'namespace':ns,'configured_jobs':32,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seconds':time.monotonic()-start,'fields':fields,'goal_sha256':sha(goal) if goal.exists() else None,'input_hashes':inputs,'live_inputs_unchanged':all(sha(ROOT/n)==h for n,h in inputs.items()),'snapshot_inputs_unchanged':all(sha(S/n)==h for n,h in inputs.items()),'records':records}
(O/'result.json').write_text(json.dumps(res,indent=2)+'\n');print({k:v for k,v in res.items() if k not in ['input_hashes','fields','records']},'fields',len(fields));raise SystemExit(not res['generation_ok'])
