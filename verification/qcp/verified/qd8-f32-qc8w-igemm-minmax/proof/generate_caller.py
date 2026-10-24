#!/usr/bin/env python3
"""Generate the actual IGEMM caller. Goal generation is not a closed kernel proof."""
from pathlib import Path
import argparse,json,hashlib,subprocess,time,re
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'caller';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={str(f.relative_to(ROOT)):sha(f) for d in ['shim','contracts'] for f in (ROOT/d).rglob('*') if f.is_file()};inputs['spec.c']=sha(ROOT/'spec.c')
(O/'input.json').write_text(json.dumps(inputs,indent=2)+'\n');B=Path('/tmp/qcp214-src/linux-binary');common=['--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info'];commands=[('strategy',[str(B/'StrategyCheck'),'--input-file',str(ROOT/'shim/copy.strategies'),'--coq-output-dir',str(O),'--coq-logic-path','Qd8API',*common]),('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(ROOT/'spec.c'),'-o',str(O/'caller.c')]),('c',[str(B/'symexec'),'--input-file',str(O/'caller.c'),'--coq-output-dir',str(O),'--coq-logic-path','IGemmCaller','--no-record-strategies','-slp',str(ROOT/'shim'),'Qd8API',*common])];records=[]
for label,cmd in commands:
 start=time.monotonic()
 with (O/(label+'.log')).open('w') as out:
  try:r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=7200','--',*cmd],stdout=out,stderr=subprocess.STDOUT,timeout=7230,cwd=O);rc=r.returncode
  except subprocess.TimeoutExpired:rc=124
 records.append({'phase':label,'exit':rc,'seconds':time.monotonic()-start,'command':cmd})
 if rc:break
goal=O/'caller_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M) if goal.exists() else [];unchanged=all(sha(ROOT/f)==h for f,h in inputs.items());result={'generated':rc==0,'fields':len(fields),'goal_sha256':sha(goal) if goal.exists() else None,'configured_jobs':32,'source_hashes':inputs,'inputs_unchanged':unchanged,'records':records,'whole_kernel_proved':False,'scope':'fresh caller goals; caller and kernels not yet checked'};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['records','source_hashes']});raise SystemExit(not(rc==0 and unchanged))
