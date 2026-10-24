#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,os
C=Path(__file__).resolve().parent.parent;P=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());NS=json.loads((P/'originals.json').read_text())['namespace'];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
a=argparse.ArgumentParser();a.add_argument('--side',choices=['neon','rvv'],required=True);a.add_argument('--include-other',action='store_true');a.add_argument('--jobs',type=int,default=16);a.add_argument('--timeout',type=int,default=3600);args=a.parse_args();assert args.jobs<=16
run=Path(tempfile.mkdtemp(prefix=args.side+'-kernel-core-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=R/'.build/simple-kernels-bootstrap/coq-flags.json';flags=json.loads(cfg.read_text())['flags']+['-Q',str(coq),NS];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};graph={};sources={};records=[];state={'passed':False,'whole_kernel_verified':False,'scope':'Fresh ordinary mathematical dependencies and actual generated goal only; no kernel VC proofs','run_directory':str(run),'source_sha256':sources,'dag':graph,'records':records,'parallel_jobs':args.jobs,'per_process_memory_GiB':16}
gen=json.loads((P/(args.side+'-generation-status.json')).read_text());assert gen['generation_passed'];goal=Path(gen['run_directory'])/(args.side+'_unit_goal.v');assert sha(goal)==gen['goal_sha256'];assert sha(C/'impl'/('testNEON.c'if args.side=='neon'else'testRVV.c'))==gen['raw_c_sha256'];goalname=args.side+'_unit_goal';goalpaths={goalname:goal};generations={goalname:gen}
if args.include_other:
 other='rvv'if args.side=='neon'else'neon';othergen=json.loads((P/(other+'-generation-status.json')).read_text());assert othergen['generation_passed'];othergoal=Path(othergen['run_directory'])/(other+'_unit_goal.v');assert sha(othergoal)==othergen['goal_sha256'];assert sha(C/'impl'/('testNEON.c'if other=='neon'else'testRVV.c'))==othergen['raw_c_sha256'];goalpaths[other+'_unit_goal']=othergoal;generations[other+'_unit_goal']=othergen
def visit(n):
 if n in graph:return
 src=goalpaths[n]if n in goalpaths else P/'coq'/(n+'.v');s=src.read_text();clean=re.sub(r'\(\*.*?\*\)','',s,flags=re.S)
 if n not in goalpaths:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
 deps=[]
 for m in re.finditer(r'From\s+'+NS+r'\s+Require\s+(?:Import|Export)\s+([^.]*)\.',clean):deps+=m[1].split()
 deps+=re.findall(r'Require\s+(?:Import|Export)\s+'+NS+r'\.(\w+)\.',clean)
 graph[n]=sorted(set(deps));sources[n]=sha(src);shutil.copyfile(src,coq/(n+'.v'))
 for d in graph[n]:visit(d)
def compile(n):
 cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];cwd=run/'jobs'/n;cwd.mkdir(parents=True);log=run/(n+'.log');t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=args.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 print(n,code,flush=True);return dict(module=n,command=cmd,exit_code=code,seconds=time.monotonic()-t,source_sha256=sources[n],log_sha256=sha(log))
try:
 for n in [*goalpaths,'RvvBounds','StoreFacts','ControlLoopFacts','NeonJoinModel','LoopCompatibility','FastFrame']:visit(n)
 done=set();pending=set(graph);failed=False
 with ThreadPoolExecutor(max_workers=args.jobs)as pool:
  active={}
  while pending or active:
   if not failed:
    for n in sorted(n for n in pending if set(graph[n])<=done)[:args.jobs-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
   if not active:assert not pending or failed;break
   ready,_=wait(active,return_when=FIRST_COMPLETED)
   for future in ready:
    n=active.pop(future);rec=future.result();records.append(rec)
    if rec['exit_code']:failed=True
    else:done.add(n)
   (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 assert not failed and not pending
 for n,h in sources.items():assert sha(goalpaths[n]if n in goalpaths else P/'coq'/(n+'.v'))==h
 
 for n,gp in goalpaths.items():assert len(re.findall(r'^Axiom proof_of_',gp.read_text(),re.M))==generations[n]['generated_c_vcs']
 state.update(passed=True,compiled_modules=len(done),actual_c_vcs=sum(g['generated_c_vcs']for g in generations.values()),goal_sha256=sha(goal),generated_goal=goalname,additional_goal_sha256={n:sha(gp)for n,gp in goalpaths.items()if n!=goalname},no_old_vo_reused=True)
except Exception as e:state['error']=str(e);print(e,flush=True)
for p in [run/'status.json',P/(args.side+'-core-status.json')]:p.write_text(json.dumps(state,indent=2)+'\n')
print(json.dumps({k:state.get(k)for k in ['passed','compiled_modules','actual_c_vcs','run_directory','error']}),flush=True);raise SystemExit(0 if state['passed']else 1)
