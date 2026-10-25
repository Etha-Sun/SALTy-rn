#!/usr/bin/env python3
"""Fresh namespace-local mathematical support; zero actual C VC credit."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
C=Path(__file__).resolve().parents[1]
DAG={'Bits':[],'Model':['Bits'],'CountFacts':['Model'],'NanFacts':['Model'],'Types':['Model'],'VectorModel':['Model'],'MemoryModel':['Model'],'MemoryFacts':['MemoryModel'],'ProgramModel':['MemoryModel'],'WriteFacts':['MemoryModel'],'BitRangeFacts':['NanFacts','VectorModel'],'MemoryViews':['MemoryModel'],'PackModel':['MemoryModel'],'OutputFacts':['WriteFacts'],'AdapterModel':['VectorModel'],'AdapterFacts':['AdapterModel'],'CompareTypes':['Types'],'CompareModel':['MemoryViews'],'CompareFacts':['CompareModel'],'ContractModel':['ProgramModel'],'KernelState':['ContractModel'],'KernelFacts':['KernelState','MemoryViews','WriteFacts']}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,default=32);a=ap.parse_args();assert 1<=a.jobs<=32
 r=Path(tempfile.mkdtemp(prefix='math-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[];inputs={};lock=threading.Lock();state={'live':0,'peak':0}
 for n in DAG:
  s=C/'proof/coq'/(n+'.v');assert not re.search(r'\b(?:Admitted|Axiom|Parameter|Abort)\b',s.read_text());inputs[str(s.relative_to(C))]=sha(s);shutil.copy2(s,coq/s.name)
 inputs['proof/check_math.py']=sha(__file__);flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];facts=[]
 for n in DAG:facts+=['MaxPool.'+n+'.'+x for x in re.findall(r'^Lemma\s+(\w+)',(coq/(n+'.v')).read_text(),re.M)]
 (coq/'MathCheck.v').write_text('From MaxPool Require Import '+' '.join(DAG)+'.\n'+''.join('Print Assumptions '+n+'.\n'for n in facts))
 status=dict(passed=False,whole_kernel_verified=False,actual_c_vcs=0,scope='ordinary Coq support only; ISA definitions reviewed separately',run_directory=str(r),configured_jobs=a.jobs,input_sha256=inputs,records=records)
 def save():
  (r/'status.json').write_text(json.dumps(status,indent=2)+'\n')
 def run(n):
  log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];t=time.monotonic()
  with lock:state['live']+=1;state['peak']=max(state['peak'],state['live'])
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  finally:
   with lock:state['live']-=1
  with lock:records.append(dict(label=n,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log),source_sha256=sha(coq/(n+'.v'))));save()
  assert p.returncode==0,log.read_text()[-3000:]
 save();(C/'proof/math-status.json').write_bytes((r/'status.json').read_bytes())
 try:
  done=set();remaining=set(DAG);active={}
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
   while remaining or active:
    ready=[n for n in DAG if n in remaining and set(DAG[n])<=done]
    for n in ready:
     active[pool.submit(run,n)]=n;remaining.remove(n)
    assert active,'cyclic or missing dependency'
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in finished:f.result();done.add(active.pop(f))
  run('MathCheck');assert inputs=={p:sha(C/p)for p in inputs}
  status.update(passed=True,maximum_actual_live_jobs=state['peak'],facts=facts,checked_math_lemmas=len(facts),fresh_ordinary_modules=len(DAG)+1,assumptions_log_sha256=sha(r/'MathCheck.log'),no_component_vo_reused=True,dependency_graph=DAG)
 except Exception as e:status['error']=str(e)
 save();(C/'proof/math-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','checked_math_lemmas','fresh_ordinary_modules','maximum_actual_live_jobs','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
