#!/usr/bin/env python3
"""Fresh ordinary Coq, dependency order, 32 configured workers and finite limits."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,os,re,shutil,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--seconds',type=int,default=7200);p.add_argument('--budget-runner',type=Path);p.add_argument('--resume',type=Path);a=p.parse_args()
assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'compile';O.mkdir(parents=True,exist_ok=False);dep=json.loads((ROOT/'proof/dependencies.json').read_text());sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
flags=['-q'];toolroot=os.getenv('QCP_HOME','/tmp/qcp214-src');coqc=os.getenv('QCP_COQC','/tmp/qcp-coq820-install/bin/coqc')
for kind,path,ns in dep['external_flags']:flags += [kind,path.replace('/tmp/qcp214-src',toolroot),ns]
for ns,path in dep['namespaces'].items():flags += ['-Q',str(O/path),ns]
for m in dep['modules']:
 src=ROOT/m['path'];assert sha(src)==m['sha256'],m['path'];dest=O/m['path'];dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
assert not list(O.rglob('*.vo'))
(O/'flags.json').write_text(json.dumps(flags,indent=2)+'\n');(O/'manifest.json').write_text(json.dumps(dep,indent=2)+'\n')
mods={m['path']:m for m in dep['modules']};graph={k:set(d for d in v['dependencies'] if d in mods) for k,v in mods.items()}
# External objects belong only to the installed QCP/Coq/Flocq toolchain.
assert all(not d.startswith('/srv') for m in mods.values() for d in m['dependencies'])
start=time.monotonic();records=[];done=set();pending=set(mods);failed=[];futures={}
if a.resume:
 prior=json.loads((a.resume/'result.json').read_text()); old={r['path']:r for r in prior['records'] if r['exit']==0}
 changed=True
 while changed:
  changed=False
  for k in sorted(pending):
   if k not in old or not graph[k]<=done:continue
   r=old[k];src=a.resume/k;vo=src.with_suffix('.vo')
   if sha(src)!=mods[k]['sha256'] or r['source_sha256']!=mods[k]['sha256']:continue
   assert vo.exists() and sha(vo)==r['vo_sha256'],k
   shutil.copy2(vo,(O/k).with_suffix('.vo'));done.add(k);pending.remove(k)
   records.append({**r,'reused_from_current_admission':str(a.resume.relative_to(ROOT)), 'validated_against_current_source_and_dependencies':True});changed=True
 print('Validated reuse from this fresh admission:',len(done),flush=True)

(O/'launch.json').write_text(json.dumps({'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':a.jobs,'memory_gib_per_process':16,'maximum_aggregate_gib':512,'pool':'per-process shared leases' if a.budget_runner else 'caller must reserve aggregate budget','coqc':coqc,'coqc_sha256':sha(Path(coqc)),'module_count':len(mods),'source_manifest_sha256':sha(ROOT/'proof/dependencies.json')},indent=2)+'\n')
def run(k):
 dest=O/k;log=dest.with_suffix('.log');t=time.monotonic();cmd=['/usr/bin/prlimit','--as='+str(16*2**30),'--cpu='+str(a.seconds),'--',coqc,*flags,str(dest)]
 if a.budget_runner:cmd=['python3',str(a.budget_runner),'--out',str(dest.with_suffix('.budget')),'--timeout',str(a.seconds+30),'--reserve-gib','16','--memory-gib','16','--',*cmd]
 with log.open('w') as out:
  r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,cwd=O)
 r={'path':k,'exit':r.returncode,'seconds':round(time.monotonic()-t,3),'source_sha256':sha(dest),'vo_sha256':sha(dest.with_suffix('.vo')) if dest.with_suffix('.vo').exists() else None,'log':str(log.relative_to(O))}
 return r
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
 while pending or futures:
  ready=sorted(k for k in pending if graph[k]<=done)
  while ready and len(futures)<a.jobs and not failed:
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
(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ('records','not_compiled')},flush=True);raise SystemExit(not r['passed'])
