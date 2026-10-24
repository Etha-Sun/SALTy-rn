#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import argparse,json,hashlib,shutil,subprocess,tempfile,re,os,time
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());NS=json.loads((P/'originals.json').read_text())['namespace'];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();pa=argparse.ArgumentParser();pa.add_argument('--core',type=Path,required=True);pa.add_argument('--module',action='append',required=True);pa.add_argument('--jobs',type=int,default=4);pa.add_argument('--timeout',type=int,default=3600);a=pa.parse_args();assert 1<=a.jobs<=16
run=Path(tempfile.mkdtemp(prefix='module-proof-',dir=C/'.build'));coq=run/'coq';coq.mkdir();base=json.loads((a.core.parent/'status.json').read_text());assert base['passed'];
if 'base_core'in base:
 old=json.loads((Path(base['base_core'])/'status.json').read_text());assert sha(Path(base['base_core'])/'status.json')==base['base_status_sha256'];base['source_sha256']={**old['source_sha256'],'rvv_unit_goal':base['goal_sha256']}
core_src=base['source_sha256'];graph={};sources={};records=[];reused=[];state={'passed':False,'whole_kernel_verified':False,'scope':'Ordinary Coq named mathematical/actual-target modules; coherent core reuse explicit, not a whole-kernel gate','run_directory':str(run),'core_run':str(a.core.parent),'modules':a.module,'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'source_sha256':sources,'dag':graph,'records':records,'reused_core_modules':reused}
for n,h in core_src.items():
 assert sha(a.core/(n+'.v'))==h
 for ext in ['.v','.vo','.vos','.vok']:
  q=a.core/(n+ext)
  if q.exists():shutil.copyfile(q,coq/q.name)
flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(coq),NS];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
def visit(n):
 if n in graph:return
 src=(a.core/(n+'.v'))if n.endswith('_goal')else P/'coq'/(n+'.v');s=src.read_text();clean=re.sub(r'\(\*.*?\*\)','',s,flags=re.S)
 if not n.endswith('_goal'):assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
 deps=[]
 for m in re.finditer(r'From\s+'+NS+r'\s+Require\s+(?:Import|Export)\s+([^.]*)\.',clean):deps+=m[1].split()
 deps+=re.findall(r'Require\s+(?:Import|Export)\s+'+NS+r'\.(\w+)\.',clean)
 graph[n]=sorted(set(deps));sources[n]=sha(src)
 if n in core_src:
  assert sources[n]==core_src[n],('core/source mismatch',n);assert(coq/(n+'.vo')).exists();reused.append(n)
 else:shutil.copyfile(src,coq/(n+'.v'))
 for d in graph[n]:visit(d)
def compile(n):
 cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];wd=run/'jobs'/n;wd.mkdir(parents=True);log=run/(n+'.log');t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 print(n,code,flush=True);return dict(module=n,exit_code=code,command=cmd,seconds=time.monotonic()-t,source_sha256=sources[n],log_sha256=sha(log))
try:
 for n in a.module:visit(n)
 done=set(reused);pending=set(graph)-done;failed=False
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:
  active={}
  while pending or active:
   if not failed:
    for n in sorted(n for n in pending if set(graph[n])<=done)[:a.jobs-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
   if not active:assert not pending or failed;break
   ready,_=wait(active,return_when=FIRST_COMPLETED)
   for f in ready:
    n=active.pop(f);rec=f.result();records.append(rec)
    if rec['exit_code']:failed=True
    else:done.add(n)
   (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 assert not failed and not pending
 for n,h in sources.items():assert sha((a.core/(n+'.v'))if n.endswith('_goal')else P/'coq'/(n+'.v'))==h
 reports=sum(len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/(n+'.log')).read_text(),re.M))for n in graph if n not in reused)
 expected=sum(len(re.findall(r'^Print Assumptions ',(coq/(n+'.v')).read_text(),re.M))for n in graph if n not in reused);assert reports==expected,(reports,expected)
 state.update(passed=True,new_compiled_modules=len(records),Print_reports=reports)
except Exception as e:state['error']=str(e);print(e,flush=True)
for p in [run/'status.json',P/('-'.join(a.module)+'-status.json')]:p.write_text(json.dumps(state,indent=2)+'\n')
print(json.dumps({k:state.get(k)for k in ['passed','new_compiled_modules','run_directory','error']}),flush=True);raise SystemExit(0 if state['passed']else 1)
