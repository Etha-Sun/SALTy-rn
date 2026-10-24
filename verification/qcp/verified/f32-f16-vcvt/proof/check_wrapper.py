#!/usr/bin/env python3
from pathlib import Path
import json,subprocess,sys,hashlib,tempfile,time
H=Path(__file__).resolve().parent;C=H.parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='wrapper-proof-',dir=C/'.build'));records=[];s={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records};inputs={str(p.relative_to(C)):sha(p)for p in [C/'spec.c',H/'generate_wrapper.py',Path(__file__),*sorted((C/'shim').glob('*.h'))]}
 def execute(cmd,n):
  log=run/(n+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=C,stdout=f,stderr=f,timeout=7200)
  records.append({'label':n,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,r.returncode,flush=True);assert r.returncode==0,log.read_text()[-1800:]
 try:
  execute([sys.executable,str(H/'generate_wrapper.py')],'actual-qcp');g=json.loads((H/'wrapper-generation-status.json').read_text());assert g['generation_passed']
  execute([sys.executable,str(H/'check_coq.py'),'--targets','WrapperChecked','--jobs','16','--timeout','3600'],'ordinary-closure');j=json.loads((C/'.build/coq-status-WrapperChecked.json').read_text());assert j['passed'];s['ordinary_closure']=j
  assert all(sha(C/n)==h for n,h in inputs.items());s.update(passed=True,vc_correct_passed=True,checked_c_vcs=g['actual_c_fields'],goal_sha256=g['goal_sha256'],generation_directory=g['run_directory'],source_sha256={**inputs,**{'proof/coq/'+n+'.v':v for n,v in j['source_sha256'].items()}},checked_module='F32F16.WrapperChecked.CheckedWrapper')
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'wrapper-proof-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
