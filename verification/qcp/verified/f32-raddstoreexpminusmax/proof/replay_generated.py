#!/usr/bin/env python3
"""Ordinary component replay over an explicitly recorded coherent model bundle.

Reused objects are component evidence only. Whole admission recompiles sources.
"""
from pathlib import Path
import argparse, hashlib, json, os, re, shutil, subprocess, tempfile, time, concurrent.futures
C=Path(__file__).resolve().parents[1]; ROOT=C.parents[3]
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--base-run',required=True);ap.add_argument('--targets',nargs='+',required=True);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--max-live',type=int,default=1);a=ap.parse_args()
 assert 0<a.timeout<=14400 and 0<a.max_live<=14
 assert not json.loads((ROOT/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 base=Path(a.base_run).resolve();b=json.loads((base/'status.json').read_text());assert b['passed']and b.get('canonical_public_goal_overridden')is True
 hashes=b.get('source_sha256',b.get('new_source_sha256',{}));assert hashes
 run=Path(tempfile.mkdtemp(prefix='module-replay-',dir=C/'.build'));q=run/'coq';q.mkdir();reuse={};new={};records=[]
 for p in sorted((base/'coq').glob('*.v')):
  n=p.stem;src=C/'proof/coq'/p.name
  if n.endswith('_goal')and n in ['neon_unit_goal','rvv_unit_goal']:
   assert sha(p)==b['generated_actual_goal_sha256']and Path(b['generated_actual_goal_path']).read_bytes()==p.read_bytes(),n
  else:assert sha(src)==sha(p),n
  if n in hashes:assert sha(p)==hashes[n],n
  for ext in ['.v','.vo']:
   f=base/'coq'/(n+ext);assert f.is_file(),f;shutil.copy2(f,q/f.name);reuse[f.name]=sha(f)
 flags=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(q),'ExpMinusMax']
 assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 order=[];seen=set();graph={}
 def visit(n):
  if n in seen or (q/(n+'.vo')).exists()and n not in a.targets:return
  seen.add(n);p=C/'proof/coq'/(n+'.v');t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
  if not n.endswith('_goal'):assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   prefix,body=m.groups()
   for word in body.split():
    name=prefix+'.'+word if prefix else word
    if name.startswith('ExpMinusMax.'):
     d=name[len('ExpMinusMax.'):];assert '.'not in d;deps.append(d);visit(d)
  shutil.copy2(p,q/p.name);new[n]=sha(p);order.append(n);graph[n]=deps
 s=dict(passed=False,whole_kernel_verified=False,scope='ordinary component against explicitly bound actual generated candidate; coherent model reuse, not whole-case credit',canonical_public_goal_overridden=True,run_directory=str(run),base_run=str(base),base_status_sha256=sha(base/'status.json'),targets=a.targets,generated_actual_goal_path=b['generated_actual_goal_path'],generated_actual_goal_sha256=b['generated_actual_goal_sha256'],generation_status_sha256=b['generation_status_sha256'],configured_jobs=32,max_live_processes=a.max_live,per_process_memory_GiB=16,reused_source_object_sha256=reuse,new_source_sha256=new,records=records)
 try:
  for n in a.targets:visit(n)
  def compile(n):
   cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(q/(n+'.v'))];log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=cwd,env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']},stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   rec=dict(module=n,command=cmd,exit_code=ec,seconds=time.monotonic()-t,source_sha256=sha(q/(n+'.v')),log_sha256=sha(log));print(n,ec,flush=True);return rec
  todo=set(order);done=set();failed=False
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   active={}
   while todo or active:
    if not failed:
     ready=sorted(n for n in todo if set(graph[n])&set(order)<=done)
     for n in ready[:a.max_live-len(active)]:active[pool.submit(compile,n)]=n;todo.remove(n)
    if not active:assert not todo or failed,'Cycle or missing dependency';break
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for future in finished:
     n=active.pop(future);rec=future.result();records.append(rec)
     if rec['exit_code']:failed=True
     else:done.add(n)
  assert not failed and not todo,'Actual ordinary module failed'
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in new.items())
  assert all(sha(base/'coq'/n)==h for n,h in reuse.items())
  s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
