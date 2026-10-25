#!/usr/bin/env python3
"""Rebuild the current complete support DAG from .v; zero actual C credit.

The old63-fact receipt is preserved. A private admission file controls actual
live jobs independently of configured capacity, without restarting proofs.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
C=Path(__file__).resolve().parents[1]
MODULES='Bits Model CountFacts NanFacts Types VectorModel MemoryModel MemoryFacts ProgramModel WriteFacts BitRangeFacts MemoryViews PackModel OutputFacts AdapterModel AdapterFacts CompareTypes CompareModel CompareFacts ContractModel KernelState KernelFacts KernelTail WindowFacts WordFacts WindowExtra FastFrame StateObservation TraceLookup RvvMemoryModel RvvStepFacts'.split()
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=32);a=p.parse_args();assert 1<=a.live_jobs<=a.jobs<=32
 r=Path(tempfile.mkdtemp(prefix='math-complete-',dir=C/'.build'));coq=r/'coq';coq.mkdir();inputs={'proof/check_math_complete.py':sha(__file__)};dag={};facts=[]
 for n in MODULES:
  source=C/'proof/coq'/(n+'.v');text=source.read_text();assert not re.search(r'\b(?:Admitted|Axiom|Parameter|Abort)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S)),n
  deps=[]
  for m in re.finditer(r'From\s+MaxPool\s+Require\s+(?:Import|Export)\s+([^.]*)\.',text):deps+=m[1].split()
  assert set(deps)<=set(MODULES),(n,deps);dag[n]=list(dict.fromkeys(deps));shutil.copy2(source,coq/source.name);inputs[str(source.relative_to(C))]=sha(source)
  facts += ['MaxPool.'+n+'.'+f for f in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',text)]
 assert len(set(facts))==len(facts)
 parts={}
 for i in range(16):
  n='MathAssumptions'+str(i).zfill(2);fs=facts[i::16];parts[n]=fs;(coq/(n+'.v')).write_text('From MaxPool Require Import '+' '.join(MODULES)+'.\n'+''.join('Print Assumptions '+f+'.\n'for f in fs))
 control=r/'live-limit.json';control.write_text(json.dumps({'live_jobs':a.live_jobs})+'\n');cv=threading.Condition();lock=threading.Lock();live={'count':0,'peak':0};records=[];s=dict(passed=False,whole_kernel_verified=False,actual_c_vcs=0,scope='current mathematical support only; allownsources rebuilt, externalQCP/Flocq libraries pinned separately; not actualC closure',run_directory=str(r),configured_jobs=a.jobs,initial_live_jobs=a.live_jobs,ordinary_memory_GiB=16,per_process_timeout_seconds=7200,input_sha256=inputs,dependency_graph=dag,records=records)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def run(n):
  with cv:
   while live['count']>=json.loads(control.read_text())['live_jobs']:cv.wait(timeout=.25)
   live['count']+=1;live['peak']=max(live['peak'],live['count'])
  begin=time.monotonic();log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))]
  try:
   with log.open('w')as out:code=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=7200).returncode
  except subprocess.TimeoutExpired:code=124
  finally:
   with cv:live['count']-=1;cv.notify_all()
  with lock:records.append(dict(label=n,exit_code=code,command=cmd,seconds=time.monotonic()-begin,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log)));save()
  assert code==0,log.read_text()[-2500:]
 save();print(r,flush=True)
 try:
  pending=set(MODULES);done=set();active={}
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
   while pending or active:
    for n in MODULES:
     if n in pending and set(dag[n])<=done:active[pool.submit(run,n)]=n;pending.remove(n)
    assert active,'Missing/cyclic own dependency'
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in finished:f.result();done.add(active.pop(f))
   for f in pool.map(run,parts):pass
  assert inputs=={p:sha(C/p)for p in inputs};s.update(passed=True,no_component_vo_reused=True,maximum_actual_live_jobs=live['peak'],checked_math_lemmas=len(facts),facts=facts,math_reports=parts,fresh_ordinary_modules=len(records),compiled_source_sha256={n:sha(coq/(n+'.v'))for n in MODULES})
 except Exception as e:s['error']=str(e)
 save();dest=C/'proof/math-complete-status.json'
 if dest.exists():(C/'proof/history'/('math-complete-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_math_lemmas','fresh_ordinary_modules','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
