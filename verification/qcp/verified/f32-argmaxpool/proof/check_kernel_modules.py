#!/usr/bin/env python3
"""Ordinary source replay for new modules over the exact 1949-field core.

The 24 coherent core objects are explicitly reused for this component only.
A whole case gate must regenerate actual C and rebuild every required source.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb')as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--targets',nargs='+',required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=1);ap.add_argument('--timeout',type=int,default=7200);a=ap.parse_args();assert a.jobs==32 and 0<a.max_live<=4 and 0<a.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 cp=C/'proof/neon-core-status.json';core=json.loads(cp.read_text());assert core['passed']and core['actual_C_fields']==1949;old=Path(core['coherent_core_directory'])
 run=Path(tempfile.mkdtemp(prefix='kernel-modules-',dir=C/'.build'));Q=run/'coq';Q.mkdir();shutil.copy2(__file__,run/'driver.py');copied={};graph={};sources={};records=[]
 for n,h in core['source_sha256'].items():
  assert sha(old/(n+'.v'))==h
  if n!='neon_unit_goal':assert sha(C/'proof/coq'/(n+'.v'))==h,'core source drift: '+n
  for e in['.v','.vo']:
   p=old/(n+e);shutil.copy2(p,Q/p.name);copied[p.name]=sha(p)
 assert copied['neon_unit_goal.vo']==core['goal_object_sha256']
 def visit(n):
  if n in core['source_sha256']or n in graph:return
  p=C/'proof/coq'/(n+'.v');t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
  assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pref,body=m.groups()
   for word in body.split():
    q=(pref+'.'+word)if pref else word
    if q.startswith('ArgmaxPool.'):
     d=q[len('ArgmaxPool.'):];assert'.'not in d;deps.append(d)
  graph[n]=sorted(set(d for d in deps if d not in core['source_sha256']));sources[n]=sha(p);shutil.copy2(p,Q/p.name)
  for d in graph[n]:visit(d)
 for n in a.targets:visit(n)
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());base=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(base.iterdir())if p.is_dir()),[])+['-Q',str(Q),'ArgmaxPool'];assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 s=dict(passed=False,whole_kernel_verified=False,scope='new ordinary source modules over explicit reused coherent actual-goal core; not whole case',run_directory=str(run),targets=a.targets,core_status_sha256=sha(cp),actual_goal_sha256=core['actual_goal_sha256'],reused_core_source_and_object_sha256=copied,new_source_sha256=sources,dag=graph,records=records,configured_jobs=32,max_live_processes=a.max_live,per_process_memory_GiB=16,per_process_timeout_seconds=a.timeout)
 def compile(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(Q/(n+'.v'))];cwd=run/'jobs'/n;cwd.mkdir(parents=True);log=run/(n+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:r=124
  rec=dict(module=n,command=cmd,exit_code=r,seconds=time.monotonic()-start,source_sha256=sha(Q/(n+'.v')),log_sha256=sha(log));print(n,r,flush=True);return rec
 try:
  done=set();pending=set(graph);failed=False
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   active={}
   while pending or active:
    if not failed:
     for n in sorted(n for n in pending if set(graph[n])<=done)[:a.max_live-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
    if not active:assert not pending or failed,'cycle';break
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in finished:
     n=active.pop(f);rec=f.result();records.append(rec)
     if rec['exit_code']:failed=True
     else:done.add(n)
    s.update(compiled_modules=sorted(done),unstarted_modules=sorted(pending));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert not failed and not pending,'ordinary module failed'
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in sources.items()),'new source drift'
  assert sha(cp)==s['core_status_sha256'],'core status changed'
  assert all(sha(old/n)==h for n,h in copied.items()),'core object/source drift'
  s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in['passed','run_directory','compiled_modules','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
