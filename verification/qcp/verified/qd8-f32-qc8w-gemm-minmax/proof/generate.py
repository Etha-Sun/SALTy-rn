#!/usr/bin/env python3
import argparse,datetime,hashlib,json,os,re,resource,signal,subprocess,time
from pathlib import Path
from prepare import ROOT,UNITS,source
p=argparse.ArgumentParser();p.add_argument('unit',choices=UNITS);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--seconds',type=int,default=21600);p.add_argument('--memory-gib',type=int,default=64);a=p.parse_args()
assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
U=UNITS[a.unit];O=ROOT/'.build'/a.run/'generation'/a.unit;O.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
files=[ROOT/'spec.c',*sum([list((ROOT/d).rglob('*')) for d in ('impl','shim','contracts','proof/c')],[]),Path(__file__),ROOT/'proof/prepare.py']
inputs={str(f.relative_to(ROOT)):sha(f) for f in files if f.is_file()};(O/'input.json').write_text(json.dumps(inputs,indent=2)+'\n')
src=O/'annotated.c';src.write_text(source(a.unit));unit=O/(U['base']+'.c')
commands=[['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(src),'-o',str(unit)],
 [os.getenv('QCP_SYMEXEC','/tmp/qcp214-src/linux-binary/symexec'),'--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--no-record-strategies','--strategy-application-limit','4096','--input-file='+str(unit),'--coq-output-dir='+str(O),'--coq-logic-path='+U['namespace'],'-slp',str(ROOT/'shim'),'Qd8API']]
records=[];start=time.monotonic()
for label,cmd in zip(['cpp','qcp'],commands):
 t=time.monotonic();command=['/usr/bin/prlimit','--as='+str(a.memory_gib*2**30),'--cpu='+str(a.seconds),'--',*cmd]
 with (O/(label+'.log')).open('w') as log:
  proc=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:rc=proc.wait(timeout=a.seconds)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();rc=124
 records.append({'label':label,'command':command,'exit':rc,'seconds':time.monotonic()-t})
 if rc:break
goal=O/(U['base']+'_goal.v');expected=ROOT/U['expected'];fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M) if goal.exists() else []
r={'unit':a.unit,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':a.jobs,'per_process_memory_gib':a.memory_gib,'seconds':time.monotonic()-start,'commands':records,'generation_exit':rc,'vc_fields':len(fields),'expected_vc_fields':U['fields'],'goal_sha256':sha(goal) if goal.exists() else None,'expected_goal_sha256':sha(expected),'exact_goal_match':goal.exists() and goal.read_bytes()==expected.read_bytes(),'input_hashes':inputs,'inputs_unchanged':all(sha(ROOT/f)==h for f,h in inputs.items())}
r['passed']=rc==0 and r['exact_goal_match'] and r['inputs_unchanged'] and len(fields)==U['fields'];(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ('input_hashes','commands')},flush=True);raise SystemExit(not r['passed'])
