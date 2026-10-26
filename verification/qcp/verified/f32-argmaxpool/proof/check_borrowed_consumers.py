#!/usr/bin/env python3
"""Generate the ordinary borrowed-adapter C bodies, preserving all evidence."""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='borrowed-consumers-generation-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),C/'proof/build_borrowed_consumers.py',C/'shim/borrowed_consumers.c',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='ordinary_C_borrowed_consumer_body_goal_generation_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(C/'shim/borrowed_consumers.c'),'-o',str(run/'borrowed_consumers.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'borrowed_consumers.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
   cmd=['prlimit','--as=17179869184:17179869184','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));assert ec==0,log.read_text()[-2500:]
  goal=gen/'borrowed_consumers_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
  assert inputs=={n:sha(C/n)for n in inputs};assert fields
  s.update(passed=True,fields=fields,actual_C_fields=len(fields),goal_sha256=sha(goal));(C/'proof/coq/borrowed_consumers_goal.v').write_bytes(goal.read_bytes())
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof/borrowed-consumers-generation-status.json'
 if out.exists():(C/'proof/history'/('borrowed-consumers-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
