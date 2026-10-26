#!/usr/bin/env python3
"""Fresh compile the complete local Coq source closure of named modules in parallel.
This alone is not a C-shim case certificate; full actual-C regeneration is separate.
"""
from pathlib import Path
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,concurrent.futures,os
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--generation-status',type=Path,required=True);ap.add_argument('--stem',choices=['neon_unit','rvv_unit'],required=True);ap.add_argument('--targets',nargs='+',required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=1);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--memory-gib',type=int,choices=[16,32],default=16);args=ap.parse_args();assert 0<args.jobs<=32 and 0<args.max_live<=args.jobs and 0<args.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 generation_path=args.generation_status.resolve();generation=json.loads(generation_path.read_text());assert generation['passed'] and not generation.get('prepare_only',False)
 generated_goal=Path(generation['goal_path']).resolve();assert generated_goal.is_relative_to((C/'.build').resolve())and generated_goal.name==args.stem+'_goal.v'and sha(generated_goal)==generation['goal_sha256']
 generation_run=Path(generation['run_directory']).resolve();assert all(r['exit_code']==0 for r in generation['records'])and {r['label']for r in generation['records']}=={'cpp','raw-cpp','qcp'}
 token=lambda t:re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
 assert sha(generation_run/(args.stem+'.i'))==generation['CPP_sha256'] and token((generation_run/(args.stem+'.i')).read_text())==token((generation_run/'raw.i').read_text())
 for name,digest in generation['input_sha256'].items():
  if Path(name).suffix in {'.c','.h','.py'}:assert sha(C/name)==digest,'CPP/constructor input drift '+name
 def source_for(n):return generated_goal if n==args.stem+'_goal'else H/'coq'/(n+'.v')

 run=Path(tempfile.mkdtemp(prefix='generated-coq-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());flags=cfg['flags']+['-Q',str(coq),'ExpMinusMax'];graph={};sources={};records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'fresh ordinary Coq for an explicitly bound actual generated candidate goal; public canonical promotion pending','parallel_jobs':args.jobs,'max_live_processes':args.max_live,'per_process_memory_GiB':args.memory_gib,'targets':args.targets,'run_directory':str(run),'records':records}
 def visit(n):
  if n in graph:return
  p=source_for(n);assert p.is_file(),p;t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
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
  visit(args.stem+'_goal')
  for n in args.targets:visit(n)
  model_nodes=set()
  def collect_models(n):
   for d in graph[n]:
    if d not in model_nodes:model_nodes.add(d);collect_models(d)
  collect_models(args.stem+'_goal')
  semantic_hashes={}
  for n in sorted(model_nodes):
   name='proof/coq/'+n+'.v'
   assert generation['input_sha256'].get(name)==sources[n], 'actual goal imported model drift '+name
   semantic_hashes[name]=sources[n]
  s['actual_goal_model_source_sha256']=semantic_hashes
  s['generation_status_sha256']=sha(generation_path);s['generated_actual_goal_path']=str(generated_goal);s['generated_actual_goal_sha256']=sha(generated_goal);s['canonical_public_goal_overridden']=True;s['source_sha256']=sources;s['dag']=graph;done=set();pending=set(graph);failed=False
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
  assert all(sha(source_for(n))==h for n,h in sources.items()),'source changed during ordinary replay'
  s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'.build'/('generated-coq-status-'+('-'.join(args.targets) if len('-'.join(args.targets))<=160 else '-'.join(args.targets)[:80]+'-'+hashlib.sha256('-'.join(args.targets).encode()).hexdigest()[:16])+'.json')).write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
