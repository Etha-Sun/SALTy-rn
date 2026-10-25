#!/usr/bin/env python3
"""Generate the actual two-kernel public caller; no whole-kernel credit."""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
R=next(p for p in C.parents if (p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='public-caller-generation-',dir=C/'.build'))
 sources=[C/'spec.c',C/'proof/build_public_spec.py',C/'proof/coq/PublicObservation.v',Path(__file__),*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in sources}
 s=dict(passed=False,whole_kernel_verified=False,scope='actual ordinary public caller generation only; main C bodies and typed interface still required',run_directory=str(run),input_sha256=inputs,records=[],configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  commands=[('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',str(C),str(C/'spec.c'),'-o',str(run/'public_caller.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'public_caller.c'),'--coq-output-dir='+str(run),'--coq-logic-path=DwChw','-slp',str(C/'shim'),'DwChw','-slp',str(C/'proof/c'),'DwChw'])]
  for label,command in commands:
   cmd=['prlimit','--as=17179869184:17179869184','--',*command];log=run/(label+'.log');start=time.monotonic()
   with log.open('w')as out:r=subprocess.run(cmd,cwd=run,env=env,stdout=out,stderr=out,timeout=7200)
   s['records'].append(dict(label=label,command=cmd,exit_code=r.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)))
   assert r.returncode==0,log.read_text()[-2500:]
  goal=run/'public_caller_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
  assert fields and all(sha(C/name)==h for name,h in inputs.items())
  s.update(passed=True,fields=fields,actual_c_fields=len(fields),goal_sha256=sha(goal),cpp_sha256=sha(run/'public_caller.c'))
 except Exception as error:s['error']=repr(error)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_fields','error']}))
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
