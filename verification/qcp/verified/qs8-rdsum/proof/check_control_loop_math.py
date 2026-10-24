from pathlib import Path
import subprocess,json,tempfile,os,shutil,hashlib
c=Path(__file__).resolve().parent.parent;root=next(p for p in c.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='control-loop-math-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Rdsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};s={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':[]}
for n in ['Model','MemoryModel','Types','ControlModel','VectorModel','ProgramModel','IntegerFacts','RowFacts','VlModel','RvvModel','RvvFacts','ControlFacts','ControlLoopFacts']:
 src=c/'proof/coq'/(n+'.v');shutil.copyfile(src,coq/src.name);cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/src.name)]
 with(run/(n+'.log')).open('w')as f:r=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=1200)
 s['records'].append({'module':n,'command':cmd,'exit_code':r.returncode,'source_sha256':hashlib.sha256((coq/src.name).read_bytes()).hexdigest()});print(n,r.returncode,flush=True)
 if r.returncode:print((run/(n+'.log')).read_text()[-2500:],flush=True);break
else:s['passed']=True
for p in [run/'status.json',c/'proof/control-loop-math-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
