#!/usr/bin/env python3
"""Fresh ordinary-Coq bootstrap of an exact generated-goal source projection."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,re,shutil,subprocess,tempfile,time
from prepare_neon import imports
from split_goal import project,audit
C=Path(__file__).resolve().parent.parent;NS='Qs8Add';UNSIGNED=False
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=14400
 isa=a.isa;r=Path(tempfile.mkdtemp(prefix=isa+'-projected-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[];graph={};sources={};s=dict(passed=False,prepared=False,vc_correct_passed=False,whole_kernel_verified=False,scope='fresh exact goal projection bootstrap only; C proof fields pending',run_directory=str(r),coq_directory=str(coq),parallel_jobs=a.jobs,memory_limit_bytes_per_process=17179869184,records=records,source_sha256=sources,dag=graph,projection_tool_sha256=sha(C/'proof/split_goal.py'))
 try:
  gen=json.loads((C/'proof'/(isa+'-generation-status.json')).read_text());assert gen['generation_passed'] and gen['raw_source_unchanged'] and gen['same_frontend_cpp_tokens_identical'];assert sha(C/'impl'/('test'+('NEON'if isa=='neon'else'RVV')+'.c'))==gen['raw_c_sha256'];g=Path(gen['run_directory'])/(isa+'_unit_goal.v');pr=r/'projection';projection=project(g,pr,NS,isa+'_unit');audit(g,pr,NS,isa+'_unit');s['goal_projection']=projection
  known={p.stem:p for p in pr.glob('*.v')};byte='u8'if UNSIGNED else's8';tail='unsigned_tail'if UNSIGNED else'signed_tail';comp=json.loads((C/'proof/neon-composed-status.json').read_text());assert comp['passed'];cr=Path(comp['run_directory'])
  for n in [byte+'_arrays_strategy_goal']+([tail+'_strategy_goal']if isa=='neon'else[]):
   hits=list(cr.rglob(n+'.v'));assert hits and len({sha(x)for x in hits})==1;known[n]=hits[0]
  stname='neon-memory-strategy-status'if isa=='neon'else'rvv-kernel-strategy-status';d=json.loads((C/'proof'/(stname+'.json')).read_text());assert d['passed'];n=byte+'_neon_memory_strategy_goal'if isa=='neon'else'rvv_kernel_strategy_goal';hits=list(Path(d['run_directory']).rglob(n+'.v'));assert hits and len({sha(x)for x in hits})==1;known[n]=hits[0]
  def visit(n):
   if n in graph:return
   src=known[n]if n in known else C/'proof/coq'/(n+'.v');text=src.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
   if n not in known:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
   graph[n]=imports(text);sources[n]=dict(origin=str(src),sha256=sha(src));shutil.copyfile(src,coq/(n+'.v'))
   for dep in graph[n]:visit(dep)
  visit(isa.capitalize()+'KernelAutomation');visit(isa+'_unit_goal_source_identity');assert not list(coq.glob('*.vo'));flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS];done=set();probe=False
  def check(n):
   cwd=r/('job-'+n);cwd.mkdir();log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];t=time.monotonic()
   with log.open('w')as f:
    try:z=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:z=124
   return dict(label=n,command=cmd,exit_code=z,seconds=time.monotonic()-t,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log),vo_sha256=sha(coq/(n+'.vo'))if(coq/(n+'.vo')).exists()else None)
  while len(done)<len(graph):
   ready=sorted(n for n in graph if n not in done and set(graph[n])<=done);assert ready,'unresolved module imports';chunks=[n for n in ready if '_goal_chunk'in n]
   if chunks and not probe:ready=[chunks[0]];probe=True;s['first_single_chunk_probe']=ready[0]
   with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
    futures={pool.submit(check,n):n for n in ready}
    failed=[]
    for f in concurrent.futures.as_completed(futures):
     x=f.result();records.append(x);print(x['label'],x['exit_code'],round(x['seconds'],2),flush=True);(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
     if x['exit_code']:failed.append(x['label'])
     else:done.add(x['label'])
    assert not failed,'Ordinary Coq failed: '+repr(failed)
  assert all(sha(Path(x['origin']))==x['sha256']for x in sources.values());audit(g,coq,NS,isa+'_unit');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);s.update(prepared=True,actual_goal_fields=len(fields),fields=fields,goal_sha256=sha(coq/(isa+'_unit_goal.v')),actual_goal_sha256=sha(g),actual_goal_artifact=str(g),compiled_local_modules=len(done),no_component_vo_reused=True,compiled_source_sha256={NS+'.'+n:sha(coq/(n+'.v'))for n in done})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof'/(isa+'-preparation-status.json')
 if out.exists():(C/'proof/history'/(isa+'-preparation-status-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['prepared','run_directory','actual_goal_fields','error']},indent=2));return 0 if s['prepared']else 1
if __name__=='__main__':raise SystemExit(main())
