#!/usr/bin/env python3
"""Fresh compile the complete local Coq source closure of named modules in parallel.
This alone is not a C-shim case certificate; full actual-C regeneration is separate.
"""
from pathlib import Path
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,concurrent.futures
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--targets',nargs='+',required=True);ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--timeout',type=int,default=1800);args=ap.parse_args();assert 0<args.jobs<=16 and 0<args.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix='coq-closure-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),'' if p.name=='relations' else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(coq),'Rndne'];graph={};sources={};records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'fresh_ordinary_Coq_source_closure_only','targets':args.targets,'run_directory':str(run),'records':records}
 def visit(n):
  if n in graph:return
  p=H/'coq'/(n+'.v');assert p.is_file(),p;t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
  # Generated interface Module Types may declare fields; handwritten proof modules may not.
  if not n.endswith('_goal'):assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'From\s+Rndne\s+Require\s+(?:Import|Export)\s+([^.]*)\.',clean):deps+=m[1].split()
  deps+=re.findall(r'Require\s+(?:Import|Export)\s+Rndne\.(\w+)\.',clean)
  graph[n]=sorted(set(deps));sources[n]=sha(p);shutil.copyfile(p,coq/p.name)
  for d in graph[n]:visit(d)
 def compile(n):
  cmd=flags+[str(coq/(n+'.v'))];log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=cwd,stdout=f,stderr=f,timeout=args.timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  rec={'module':n,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'source_sha256':sources[n],'log_sha256':sha(log)};print(n,ec,flush=True);return rec
 try:
  for n in args.targets:visit(n)
  s['source_sha256']=sources;s['dag']=graph;done=set();pending=set(graph);failed=False
  with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs)as pool:
   active={}
   while pending or active:
    if not failed:
     ready=sorted(n for n in pending if set(graph[n])<=done)
     for n in ready[:args.jobs-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
    if not active:assert not pending or failed,('cycle or missing dependency',pending);break
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for fut in finished:
     n=active.pop(fut);rec=fut.result();records.append(rec)
     if rec['exit_code']:failed=True
     else:done.add(n)
  s['compiled_modules']=len(done);s['unstarted_modules']=sorted(pending);assert not failed and not pending,'ordinary Coq module failed'
  assert all(sha(H/'coq'/(n+'.v'))==h for n,h in sources.items()),'source changed during ordinary replay'
  s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'.build'/('coq-status-'+'-'.join(args.targets)+'.json')).write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
