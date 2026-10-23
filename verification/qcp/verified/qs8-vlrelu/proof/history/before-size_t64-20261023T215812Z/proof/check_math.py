#!/usr/bin/env python3
"""Fresh ordinary model/mask/quantization algebra; not a kernel proof."""
from pathlib import Path
import os,json,hashlib,subprocess,tempfile,time,shutil
case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='math-',dir=case/'.build'));coq=run/'coq';coq.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Lrelu'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[];inputs={};status={'passed':False,'whole_kernel_verified':False,'scope':'Mask choice and concrete arithmetic expression equivalence only; not C-body or whole-kernel verification','run_directory':str(run),'records':records,'source_sha256':inputs}
try:
 for n in ['Model','Types','LreluModel','LreluFacts']:
  p=case/'proof/coq'/(n+'.v');inputs[str(p.relative_to(case))]=sha(p);shutil.copyfile(p,coq/p.name);cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/p.name)];log=run/(n+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=1800)
  records.append({'module':n,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,r.returncode,flush=True)
  if r.returncode:raise RuntimeError(log.read_text()[-2700:])
 status['passed']=True
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in [run/'status.json',case/'proof/math-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(run,flush=True);raise SystemExit(0 if status['passed']else 1)
