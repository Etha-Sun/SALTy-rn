#!/usr/bin/env python3
"""Fresh compile the complete local Coq source closure of named modules in parallel.
This alone is not a C-shim case certificate; full actual-C regeneration is separate.
"""
from pathlib import Path
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,concurrent.futures,os
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--targets',nargs='+',required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=1);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--memory-gib',type=int,choices=[16,32],default=16);args=ap.parse_args();assert 0<args.jobs<=32 and 0<args.max_live<=args.jobs and 0<args.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='coq-closure-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());flags=cfg['flags']+['-Q',str(coq),'ExpMinusMax'];graph={};sources={};records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'fresh_ordinary_Coq_source_closure_only','parallel_jobs':args.jobs,'max_live_processes':args.max_live,'per_process_memory_GiB':args.memory_gib,'targets':args.targets,'run_directory':str(run),'records':records}
 def visit(n):
  if n in graph:return
  p=H/'coq'/(n+'.v');assert p.is_file(),p;t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
  # Generated interface Module Types may declare fields; handwritten proof modules may not.
  if not n.endswith('_goal'):assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter|Abort)\b',clean),n
  deps=[]
  for match in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   prefix,body=match.groups()
   for word in body.split():
    qualified=(prefix+'.'+word)if prefix else word
    if qualified.startswith('ExpMinusMax.'):
     name=qualified[len('ExpMinusMax.'):];assert '.'not in name,name;deps.append(name)
  graph[n]=sorted(set(deps));sources[n]=sha(p);shutil.copyfile(p,coq/p.name)
  for d in graph[n]:visit(d)
 def compile(n):
  cmd=['prlimit','--as='+str(args.memory_gib*1024**3)+':'+str(args.memory_gib*1024**3),'--',*flags,'-time',str(coq/(n+'.v'))];log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(cmd,cwd=cwd,env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']},stdout=f,stderr=f,timeout=args.timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  rec={'module':n,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'source_sha256':sources[n],'log_sha256':sha(log)};print(n,ec,flush=True);return rec
 try:
  for n in args.targets:visit(n)
  s['source_sha256']=sources;s['dag']=graph;done=set();pending=set(graph);failed=False
  with concurrent.futures.ThreadPoolExecutor(max_workers=args.max_live)as pool:
   active={}
   while pending or active:
    if not failed:
     ready=sorted(n for n in pending if set(graph[n])<=done)
     for n in ready[:args.max_live-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
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
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'.build'/('coq-status-'+('-'.join(args.targets) if len('-'.join(args.targets))<=160 else '-'.join(args.targets)[:80]+'-'+hashlib.sha256('-'.join(args.targets).encode()).hexdigest()[:16])+'.json')).write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
