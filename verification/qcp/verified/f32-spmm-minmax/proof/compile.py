#!/usr/bin/env python3
"""Fresh ordinary Coq, dependency order, 32 configured workers and finite limits."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,os,re,shutil,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--seconds',type=int,default=7200);p.add_argument('--budget-runner',type=Path);p.add_argument('--keep-going',action='store_true',help='continue independent proof fields after a failure');p.add_argument('--root',action='append',help='compile only this checked dependency closure; repeatable');a=p.parse_args()
assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'compile';O.mkdir(parents=True,exist_ok=False);dep=json.loads((ROOT/'proof/dependencies.json').read_text());sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
if a.root:
 allmods={m['path']:m for m in dep['modules']};closure=set()
 def visit(k):
  assert k in allmods,k
  if k in closure:return
  closure.add(k)
  for d in allmods[k]['dependencies']:
   if d in allmods:visit(d)
 for k in a.root:visit(k)
 dep['modules']=[m for m in dep['modules'] if m['path']in closure]
 dep['source_paths']=sorted(closure);dep['roots']=a.root
 dep['namespaces']={ns:path for ns,path in dep['namespaces'].items() if any(k.startswith(path+'/')for k in closure)}
 dep['scope']='selected dependency closure only; no whole-kernel claim'
flags=['-q'];toolroot=os.getenv('QCP_HOME','/tmp/qcp214-src');coqc=os.getenv('QCP_COQC','/tmp/qcp-coq820-install/bin/coqc')
for kind,path,ns in dep['external_flags']:flags += [kind,path.replace('/tmp/qcp214-src',toolroot),ns]
for ns,path in dep['namespaces'].items():flags += ['-Q',str(O/path),ns]
for m in dep['modules']:
 src=ROOT/m['path'];assert sha(src)==m['sha256'],m['path'];dest=O/m['path'];dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
assert not list(O.rglob('*.vo'))
(O/'flags.json').write_text(json.dumps(flags,indent=2)+'\n');(O/'manifest.json').write_text(json.dumps(dep,indent=2)+'\n')
mods={m['path']:m for m in dep['modules']};graph={k:set(d for d in v['dependencies'] if d in mods) for k,v in mods.items()}
# Large generated source closures have a finite32GiB reservation.
# Partitions keep ordinary independent fields below the64MiB threshold.
closure_cache={}
def source_closure(k):
 if k not in closure_cache:
  out={k}
  for d in graph[k]:out.update(source_closure(d))
  closure_cache[k]=out
 return closure_cache[k]
source_bytes={k:(O/k).stat().st_size for k in mods}
memory_gib={k:32 if sum(source_bytes[d]for d in source_closure(k))>=64*2**20 else 16 for k in mods}
# External objects belong only to the installed QCP/Coq/Flocq toolchain.
assert all(not d.startswith('/srv') for m in mods.values() for d in m['dependencies'])
start=time.monotonic();records=[];done=set();pending=set(mods);failed=[];futures={}
(O/'launch.json').write_text(json.dumps({'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':a.jobs,'ordinary_memory_gib':16,'large_source_memory_gib':32,'large_source_threshold_bytes':64*2**20,'module_memory_gib':memory_gib,'maximum_aggregate_gib':512,'pool':'per-process shared leases' if a.budget_runner else 'caller must reserve aggregate budget','coqc':coqc,'coqc_sha256':sha(Path(coqc)),'keep_going':a.keep_going,'module_count':len(mods),'source_manifest_sha256':sha(ROOT/'proof/dependencies.json'),'runner_sha256':sha(Path(__file__))},indent=2)+'\n')
def run(k):
 dest=O/k;log=dest.with_suffix('.log');t=time.monotonic();mem=memory_gib[k];cmd=['/usr/bin/prlimit','--as='+str(mem*2**30),'--cpu='+str(a.seconds),'--',coqc,*flags,str(dest)]
 if a.budget_runner:cmd=['python3',str(a.budget_runner),'--out',str(dest.with_suffix('.budget')),'--timeout',str(a.seconds+30),'--reserve-gib',str(mem),'--memory-gib',str(mem),'--',*cmd]
 with log.open('w') as out:
  r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,cwd=O)
 exit_code=r.returncode
 # systemd stop may itself exit zero although coqc never produced a proof.
 # A normal fresh proof object and completed inner budget result are mandatory.
 budget_result=dest.with_suffix('.budget')/'result.json'
 budget_ok=(not a.budget_runner) or (budget_result.exists() and json.loads(budget_result.read_text()).get('kind')!='service_or_resource_failure')
 proof_object_exists=dest.with_suffix('.vo').is_file()
 if exit_code==0 and (not proof_object_exists or not budget_ok):exit_code=125
 r={'path':k,'exit':exit_code,'launcher_exit':r.returncode,'proof_object_exists':proof_object_exists,'budget_ok':budget_ok,'seconds':round(time.monotonic()-t,3),'memory_gib':mem,'source_sha256':sha(dest),'vo_sha256':sha(dest.with_suffix('.vo')) if dest.with_suffix('.vo').exists() else None,'log':str(log.relative_to(O))}
 return r
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
 while pending or futures:
  ready=sorted(k for k in pending if graph[k]<=done)
  while ready and len(futures)<a.jobs and (not failed or a.keep_going):
   k=ready.pop(0);pending.remove(k);futures[pool.submit(run,k)]=k
  if not futures:break
  completed,_=concurrent.futures.wait(futures,return_when=concurrent.futures.FIRST_COMPLETED)
  for f in completed:
   k=futures.pop(f);r=f.result();records.append(r)
   if r['exit']==0:done.add(k)
   else:failed.append(k);print('FAIL',k,flush=True)
  progress={'completed':len(done),'total':len(mods),'active':len(futures),'pending':len(pending),'failed':failed,'seconds':round(time.monotonic()-start,1)}
  (O/'progress.json').write_text(json.dumps(progress,indent=2)+'\n')
  (O/'records.json').write_text(json.dumps(records,indent=2)+'\n')
  if len(done)%50==0:print(progress,flush=True)
unchanged=all(sha(ROOT/m['path'])==m['sha256'] and sha(O/m['path'])==m['sha256'] for m in mods.values())
r={'passed':len(done)==len(mods) and not failed and unchanged,'fresh_modules':len(done),'total_modules':len(mods),'configured_jobs':a.jobs,'seconds':time.monotonic()-start,'failed':failed,'not_compiled':sorted(pending),'inputs_unchanged':unchanged,'roots':dep['roots'],'records':records}
(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ('records','not_compiled','roots')},flush=True);raise SystemExit(not r['passed'])
