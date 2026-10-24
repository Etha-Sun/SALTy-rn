#!/usr/bin/env python3
"""Complete151 actual RVV typed component using one source-fresh135 bundle.

New memory/support/strict interface and all160 assumption outputs compile normally
in one coherent copy. This is component evidence; whole admission regenerates C
and strategies and recompiles every required source without project VO reuse.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,importlib.util,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--bundle',type=Path,required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=8);ap.add_argument('--timeout',type=int,default=14400);a=ap.parse_args();assert 0<a.max_live<=a.jobs<=32 and 0<a.timeout<=14400
 quota=json.loads((R/'.build/memory/quota/state.json').read_text());assert quota.get('wind_down_requested')is False,'quota wind down: do not open a new batch'
 origin=a.bundle.resolve();old=json.loads((origin/'status.json').read_text());assert old['passed']and all(x['exit_code']==0 for x in old['records']);assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in old['source_sha256'].items())
 available=int(re.search(r'^MemAvailable:\s+(\d+)',Path('/proc/meminfo').read_text(),re.M)[1]);assert available>(16*a.max_live+32)*1024**2
 run=Path(tempfile.mkdtemp(prefix='rvv-complete151-',dir=C/'.build'));coq=run/'coq';shutil.copytree(origin/'coq',coq);records=[];source={};graph={};cached=set(old['source_sha256']);status=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='complete151 RVV component exact typed interface and160Print; explicit own54 source-fresh bundle continuity and external BASE mathematical object reuse; wholecase still pending',run_directory=str(run),records=records,configured_jobs=a.jobs,max_live_processes=a.max_live,per_process_memory_GiB=16,maximum_process_budget_GiB=16*a.max_live,mem_available_kib_at_launch=available,component_dependency_origin=str(origin),component_dependency_status_sha256=sha(origin/'status.json'),existing_source_fresh_compilation_records=old['records'],no_component_vo_credit_for_full_case=True)
 env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=next(x['command']for x in old['records']if x['module']=='RvvNonMemoryChecked')[:-1];flags=[x.replace(str(origin/'coq'),str(coq))for x in flags]
 def persist():(run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
 def visit(n):
  if n in graph:return
  p=C/'proof/coq'/(n+'.v');assert p.is_file(),p;text=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
  if not n.endswith('_goal'):assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pref,words=m.groups()
   for word in words.split():
    q=(pref+'.'+word)if pref else word
    if q.startswith('Dwconv.'):
     d=q[len('Dwconv.'):];assert '.'not in d;deps.append(d)
  graph[n]=sorted(set(deps));source[n]=sha(p)
  if n in cached:assert source[n]==old['source_sha256'][n]and(coq/(n+'.vo')).is_file()
  else:shutil.copy2(p,coq/p.name)
  for d in graph[n]:visit(d)
 def compile(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);t=time.monotonic()
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout)
   ec=p.returncode
  except subprocess.TimeoutExpired:ec=124
  return dict(module=n,command=cmd,exit_code=ec,seconds=time.monotonic()-t,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log),print_items=(coq/(n+'.v')).read_text().count('Print Assumptions'))
 try:
  goal=C/'proof/coq/rvv_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==151;status['goal_sha256']=sha(goal)
  spec=importlib.util.spec_from_file_location('dw_rvv_live_constructor',C/'proof/generate_rvv.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);(run/'rvv_unit.c').write_text(m.render('rvv'))
  cmd=['prlimit','--as=34359738368:34359738368','--','gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')];log=run/'cpp.log'
  with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=300)
  assert p.returncode==0,log.read_text()[-2000:];generation=json.loads((C/'proof/rvv-generation-status.json').read_text());prior=Path(generation['run_directory'])/'rvv_unit.i';assert generation['passed']and generation['goal_sha256']==sha(goal)and sha(prior)==sha(run/'rvv_unit.i')
  status['live_cpp_identity_audit']=dict(command=cmd,exit_code=0,cpp_sha256=sha(run/'rvv_unit.i'),historical_cpp=str(prior),historical_goal_bound=True,formal_proof_replayed=False)
  roots=['RvvKernelChecked']+[f'RvvKernelAudit{i:02}'for i in range(16)]
  for n in roots:visit(n)
  status.update(source_sha256=source,dag=graph,source_fresh_origin_modules=sorted(set(graph)&cached));pending=set(graph)-cached;done=set(graph)&cached;failed=False;persist()
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   active={}
   while pending or active:
    if not failed:
     ready=sorted(n for n in pending if set(graph[n])<=done)
     for n in ready[:a.max_live-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
    if not active:assert not pending or failed,'cycle/missing dependency';break
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in finished:
     n=active.pop(f);rec=f.result();records.append(rec);print(n,rec['exit_code'],flush=True)
     if rec['exit_code']:failed=True
     else:done.add(n)
     persist()
  status.update(unstarted_modules=sorted(pending),compiled_fresh_modules=sum(r['exit_code']==0 for r in records));assert not failed and not pending,'ordinary component failed'
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in source.items()),'component source drift'
  count=sum(r['print_items']for r in records if r['module'].startswith('RvvKernelAudit'));assert count==160
  status.update(passed=True,vc_correct_passed=True,checked_module='Dwconv.RvvKernelChecked.CheckedRvvKernel',actual_c_vcs=151,fields=fields,strategy_fields=9,total_print_items=count,source_unchanged=True)
 except Exception as e:status['error']=str(e)
 persist();dest=C/'proof/rvv-proof-status.json'
 if dest.exists():(C/'proof/history'/('rvv-proof-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(run,flush=True);raise SystemExit(0 if status['passed']else 1)
if __name__=='__main__':main()
