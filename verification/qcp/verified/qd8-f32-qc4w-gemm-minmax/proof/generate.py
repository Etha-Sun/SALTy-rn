"""Fresh actual C generation only; never declares kernel proof success."""
from pathlib import Path
import argparse,datetime,hashlib,json,os,re,signal,subprocess,time
from prepare import ROOT,UNITS,source
p=argparse.ArgumentParser();p.add_argument('unit',choices=UNITS);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--seconds',type=int,default=21600);p.add_argument('--memory-gib',type=int,default=64);a=p.parse_args()
assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
U=UNITS[a.unit];O=ROOT/'.build'/a.run/'generation'/a.unit;O.mkdir(parents=True,exist_ok=False)
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
files=[ROOT/'spec.c',ROOT/'proof/prepare.py',Path(__file__)]
for folder in ['impl','shim','contracts','proof/c']:files+=list((ROOT/folder).rglob('*'))
inputs={str(f.relative_to(ROOT)):sha(f)for f in files if f.is_file()}
src=O/'annotated.c';src.write_text(source(a.unit));dest=O/(U['base']+'.c')
qcp=[os.getenv('QCP_SYMEXEC','/tmp/qcp214-src/linux-binary/symexec'),'--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--no-record-strategies','--strategy-application-limit','4096','--input-file='+str(dest),'--coq-output-dir='+str(O),'--coq-logic-path='+U['namespace']]
for path,namespace in U['strategies']:qcp+=['-slp',str(ROOT/path),namespace]
commands=[['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(src),'-o',str(dest)],qcp]
records=[];start=time.monotonic()
for label,cmd in zip(['cpp','qcp'],commands):
    cmd=['/usr/bin/prlimit','--as='+str(a.memory_gib*2**30),'--cpu='+str(a.seconds),'--',*cmd];t=time.monotonic()
    with (O/(label+'.log')).open('w')as log:
        proc=subprocess.Popen(cmd,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
        try:rc=proc.wait(timeout=a.seconds)
        except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();rc=124
    records.append({'label':label,'command':cmd,'exit':rc,'seconds':time.monotonic()-t})
    if rc:break
goal=O/(U['base']+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M)if goal.exists()else[]
unchanged=all(sha(ROOT/f)==h for f,h in inputs.items())
r={'unit':a.unit,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'generation_passed':rc==0 and bool(fields)and unchanged,'whole_kernel_proved':False,'generation_exit':rc,'vc_fields':len(fields),'goal_sha256':sha(goal)if goal.exists()else None,'seconds':time.monotonic()-start,'input_hashes':inputs,'inputs_unchanged':unchanged,'commands':records}
(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k not in ['input_hashes','commands']},flush=True);raise SystemExit(not r['generation_passed'])
