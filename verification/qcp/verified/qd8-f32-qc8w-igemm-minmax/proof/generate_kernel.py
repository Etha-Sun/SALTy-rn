#!/usr/bin/env python3
"""Fresh whole-kernel goals; reports generation separately from proof closure."""
from pathlib import Path
import argparse,json,hashlib,subprocess,time,re,signal,os
from prepare import ROOT,prepare
p=argparse.ArgumentParser();p.add_argument('side',choices=['rvv','neon']);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/a.side;O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={str(f.relative_to(ROOT)):sha(f) for d in ['impl','shim','contracts','proof/c'] for f in (ROOT/d).rglob('*') if f.is_file()};inputs['spec.c']=sha(ROOT/'spec.c');inputs['proof/prepare.py']=sha(ROOT/'proof/prepare.py');inputs['proof/generate_kernel.py']=sha(Path(__file__))
(O/'input.json').write_text(json.dumps(inputs,indent=2)+'\n');(O/'annotated.c').write_text(prepare(a.side));B=Path('/tmp/qcp214-src/linux-binary');common=['--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info'];commands=[('strategy',[str(B/'StrategyCheck'),'--input-file',str(ROOT/'shim/copy.strategies'),'--coq-output-dir',str(O),'--coq-logic-path','Qd8API',*common]),('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(O/'annotated.c'),'-o',str(O/(a.side+'.c'))]),('c',[str(B/'symexec'),'--input-file',str(O/(a.side+'.c')),'--coq-output-dir',str(O),'--coq-logic-path','IGemm'+a.side.title(),'--no-record-strategies','--strategy-application-limit','4096','-slp',str(ROOT/'shim'),'Qd8API',*common])];records=[]
for label,cmd in commands:
 start=time.monotonic()
 with (O/(label+'.log')).open('w') as out:
  proc=subprocess.Popen(['/usr/bin/prlimit','--as='+str(64*2**30),'--cpu=21600','--',*cmd],stdout=out,stderr=subprocess.STDOUT,start_new_session=True,cwd=O)
  try:rc=proc.wait(timeout=21600)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();rc=124
 records.append({'phase':label,'exit':rc,'seconds':time.monotonic()-start,'command':cmd})
 if rc:break
 if label=='strategy':
  actual=O/'copy_strategy_goal.v';checked=ROOT/'proof/coq/Qd8API/copy_strategy_goal.v'
  if actual.read_bytes()!=checked.read_bytes():
   records.append({'phase':'strategy-identity','exit':1,'message':'fresh strategy goal differs from checked source'});rc=1;break
goal=O/(a.side+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M) if goal.exists() else [];unchanged=all(sha(ROOT/f)==h for f,h in inputs.items());result={'generated':rc==0,'fields':len(fields),'goal_sha256':sha(goal) if goal.exists() else None,'configured_jobs':32,'source_hashes':inputs,'inputs_unchanged':unchanged,'records':records,'strategy_goal_exact_match':(O/'copy_strategy_goal.v').exists() and (O/'copy_strategy_goal.v').read_bytes()==(ROOT/'proof/coq/Qd8API/copy_strategy_goal.v').read_bytes(),'whole_kernel_proved':False,'scope':'fresh full '+a.side+' goals; proof closure pending'};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['records','source_hashes']});raise SystemExit(not(rc==0 and unchanged))
