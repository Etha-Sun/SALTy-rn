from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,os
C=Path(__file__).resolve().parent.parent;H=C/'proof'
R=next(p for p in C.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();assert a.jobs==16 and 0<a.timeout<=7200
 run=Path(tempfile.mkdtemp(prefix='rvv-lane-math16-',dir=C/'.build'));coq=run/'coq';coq.mkdir();graph={};sources={};records=[]
 cfg=R/'.build/simple-kernels-bootstrap/coq-flags.json';flags=json.loads(cfg.read_text())['flags']+['-Q',str(coq),'Qu8Add']
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 state=dict(passed=False,whole_kernel_verified=False,scope='Fresh ordinary mathematical source closure only; no C VC or kernel credit',
  run_directory=str(run),parallel_jobs=a.jobs,per_process_memory_GiB=16,timeout=a.timeout,records=records,source_sha256=sources,dag=graph)
 def visit(n):
  if n in graph:return
  path=H/'coq'/(n+'.v');text=path.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
  assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'From\s+Qu8Add\s+Require\s+(?:Import|Export)\s+([^.]*)\.',clean):deps+=m[1].split()
  deps+=re.findall(r'Require\s+(?:Import|Export)\s+Qu8Add\.(\w+)\.',clean)
  graph[n]=sorted(set(deps));sources[n]=sha(path);shutil.copyfile(path,coq/path.name)
  for dep in graph[n]:visit(dep)
 def compile(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))]
  log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  print(n,code,flush=True)
  return dict(module=n,command=cmd,exit_code=code,seconds=time.monotonic()-start,source_sha256=sources[n],log_sha256=sha(log))
 try:
  visit('RvvLaneFacts');assert not list(coq.glob('*.vo'));done=set();pending=set(graph);failed=False
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:
   active={}
   while pending or active:
    if not failed:
     for n in sorted(n for n in pending if set(graph[n])<=done)[:a.jobs-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
    if not active:assert not pending or failed;break
    ready,_=wait(active,return_when=FIRST_COMPLETED)
    for future in ready:
     n=active.pop(future);rec=future.result();records.append(rec)
     if rec['exit_code']:failed=True
     else:done.add(n)
    (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
  state.update(compiled_modules=len(done),unstarted_modules=sorted(pending));assert not failed and not pending
  assert all(sha(H/'coq'/(n+'.v'))==h for n,h in sources.items())
  assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'RvvLaneFacts.log').read_text(),re.M))==5
  state.update(passed=True,Print_reports=5,no_component_vo_reused=True)
 except Exception as error:state['error']=str(error);print(error,flush=True)
 for path in [run/'status.json',C/'.build/rvv-lane-math16-status.json']:path.write_text(json.dumps(state,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
