#!/usr/bin/env python3
"""Fresh source closure and the exact large actual NEON goal in a private cwd.

The 171 MB generated goal stays in .build, never becomes a second public
source entrypoint. No case .vo is reused. This is not a kernel certificate.
"""
from pathlib import Path
import concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb')as f:
  for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
 return h.hexdigest()
def main():
 generation=C/'.build/neon-borrowed-kernel-29jd4mzv/status.json';g=json.loads(generation.read_text());assert g['passed']and g['actual_C_fields']==1949
 old=json.loads((C/'proof/borrowed-consumers-status.json').read_text());assert old['passed']and old['actual_C_fields']==20
 original_models=old['ordinary_source_closure']['source_sha256']
 for n,h in g['input_sha256'].items():assert sha(C/n)==h,('primary generation source changed',n)
 actual_goal=Path(g['goal_path']);assert sha(actual_goal)==g['goal_sha256']
 run=Path(tempfile.mkdtemp(prefix='neon-core-',dir=C/'.build'));Q=run/'coq';Q.mkdir();graph={};sources={};paths={};records=[]
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());base=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq'
 flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(base.iterdir())if p.is_dir()),[])+['-Q',str(Q),'ArgmaxPool']
 assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 s=dict(passed=False,whole_kernel_verified=False,scope='fresh_ordinary_Coq_models_and_exact_actual_NEON_goal_only',run_directory=str(run),generation_status_sha256=sha(generation),actual_C_fields=1949,actual_goal_source=str(actual_goal),actual_goal_sha256=g['goal_sha256'],source_sha256=sources,records=records,configured_jobs=32,max_live_processes=2,goal_memory_GiB=32,goal_timeout_seconds=14400,dependency_memory_GiB=16,dependency_timeout_seconds=7200,no_case_vo_reused=True)
 def visit(n):
  if n in graph:return
  p=actual_goal if n=='neon_unit_goal'else C/'proof/coq'/(n+'.v');assert p.is_file(),p
  h=sha(p)
  if n!='neon_unit_goal':assert n in original_models and original_models[n]==h,('not the frozen original 20-helper profile',n)
  t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S)
  if n=='neon_unit_goal':
   fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',clean,re.M);assert len(fields)==1949 and len(set(fields))==1949
   assert not re.search(r'\b(?:Admitted|admit|Abort|Parameter)\b',clean)
   assert clean.count('Module Type VC_Correct.')==1
   clean=t[:t.index('(*----- Function')]
  else:assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pre,body=m.groups()
   for w in body.split():
    full=(pre+'.'+w)if pre else w
    if full.startswith('ArgmaxPool.'):
     d=full[len('ArgmaxPool.'):];assert '.'not in d;deps.append(d)
  graph[n]=sorted(set(deps));sources[n]=h;paths[n]=str(p);shutil.copy2(p,Q/(n+'.v'));assert sha(Q/(n+'.v'))==h
  for d in graph[n]:visit(d)
 def compile(n):
  goal=n=='neon_unit_goal';gib=32 if goal else 16;seconds=14400 if goal else 7200
  cmd=['prlimit','--as='+str(gib*1024**3)+':'+str(gib*1024**3),'--',*flags,'-time',str(Q/(n+'.v'))];cwd=run/'jobs'/n;cwd.mkdir(parents=True);log=run/(n+'.log');start=time.monotonic();env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
  try:
   with log.open('w')as f:ec=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=seconds).returncode
  except subprocess.TimeoutExpired:ec=124
  print(n,ec,flush=True);return dict(module=n,command=cmd,exit_code=ec,seconds=time.monotonic()-start,memory_GiB=gib,timeout_seconds=seconds,source_sha256=sources[n],log_sha256=sha(log))
 try:
  visit('neon_unit_goal');visit('BorrowedConsumerSupport');s.update(dag=graph,original_source_paths=paths)
  (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print('run_directory',run,flush=True)
  pending=set(graph);done=set();failed=False
  with concurrent.futures.ThreadPoolExecutor(max_workers=2)as pool:
   active={}
   while pending or active:
    if not failed:
     ready=sorted(n for n in pending if set(graph[n])<=done)
     for n in ready[:2-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
    if not active:assert failed or not pending,('dependency cycle',pending);break
    finished,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in finished:
     n=active.pop(f);rec=f.result();records.append(rec)
     if rec['exit_code']:failed=True
     else:done.add(n)
     s.update(compiled_modules=len(done),unstarted_modules=sorted(pending));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert not failed and not pending,'ordinary Coq core failed'
  assert all(sha(Path(paths[n]))==h for n,h in sources.items()),'source drift during fresh core compilation'
  assert sha(Q/'neon_unit_goal.v')==g['goal_sha256'];s.update(passed=True,goal_object_sha256=sha(Q/'neon_unit_goal.vo'),coherent_core_directory=str(Q))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/neon-core-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','compiled_modules','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
