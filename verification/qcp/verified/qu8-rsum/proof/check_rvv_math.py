from pathlib import Path
import os,json,hashlib,subprocess,tempfile,time
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='rvv-math-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qu8Rsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d={'passed':False,'whole_kernel_verified':False,'scope':'pure RVV arithmetic only','run_directory':str(run),'records':records,'sources':{}}
try:
 for n in ['Model','Types','MemoryModel','IntegerFacts','VectorModel','VectorFacts','VlModel','ByteWindow','RvvBounds','PrefixFacts','ProgramFacts','RvvProgramModel','RvvFacts']:
  src=P/'coq'/(n+'.v');d['sources'][str(src.relative_to(c))]=sha(src);dest=coq/src.name;dest.write_bytes(src.read_bytes());log=run/(n+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(dest)],cwd=run,env=env,stdout=f,stderr=f,timeout=3600)
  records.append({'module':n,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,r.returncode,flush=True)
  if r.returncode:raise RuntimeError(log.read_text()[-3000:])
 d['passed']=True
except Exception as e:d['error']=str(e);print(str(e),flush=True)
for p in [run/'status.json',P/'rvv-math-status.json']:p.write_text(json.dumps(d,indent=2)+'\n')
raise SystemExit(0 if d['passed'] else 1)
