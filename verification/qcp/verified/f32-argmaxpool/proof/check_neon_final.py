#!/usr/bin/env python3
from pathlib import Path
import json,hashlib,shutil,tempfile,subprocess,os,time,re,argparse,concurrent.futures
C=Path(__file__).resolve().parents[1];R=C.parents[3];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 a=argparse.ArgumentParser();a.add_argument('--jobs',type=int,default=32);a.add_argument('--max-live',type=int,default=1);a.add_argument('--repair-noncall-closure',action='store_true');a=a.parse_args();assert a.jobs==32 and 1<=a.max_live<=4;assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 names=['r7j_ih9_','widsgvyk','v0vz684g','nyi8ku7d','a5fl0bai','2vttbuu1','m_5a6lx7'];runs=[C/'.build'/('neon-guarded-modules-'+x)for x in names];out=Path(tempfile.mkdtemp(prefix='neon-final-typed-',dir=C/'.build'));Q=out/'coq';Q.mkdir();shutil.copy2(__file__,out/'driver.py');chosen={};conflicts=[];records=[];sourcehash={}
 for run in runs:
  d=json.loads((run/'status.json').read_text());assert d['passed']and d['actual_goal_sha256']=='5526ae555aedcdcef3fa37ff70e9861783171acdfebbedd088fd3735b4fc29be'
  for p in(run/'coq').glob('*.v'):
   h=sha(p);n=p.stem
   if n!='neon_unit_goal':assert sha(C/'proof/coq'/p.name)==h,('public source drift',p)
   if n in sourcehash:assert sourcehash[n]==h,('duplicate source conflict',n)
   else:sourcehash[n]=h;shutil.copy2(p,Q/p.name)
   vo=p.with_suffix('.vo');assert vo.exists();v=sha(vo)
   if n in chosen:
    if chosen[n]['sha256']!=v:conflicts.append(dict(module=n,selected=chosen[n],other=dict(path=str(vo),sha256=v,bytes=vo.stat().st_size),identity_claim=False))
   else:chosen[n]=dict(path=str(vo),sha256=v,bytes=vo.stat().st_size);shutil.copy2(vo,Q/vo.name)
 callset=set(p.stem for p in (runs[0]/'coq').glob('*.v'))
 new=['NeonMemoryChecked','NeonKernelChecked']+[f'NeonKernelAudit{k:02d}'for k in range(16)]+['FinalNeonKernel'];newhash={}
 for n in new:
  p=C/'proof/coq'/(n+'.v');t=p.read_text();assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',re.sub(r'\(\*.*?\*\)','',t,flags=re.S));newhash[n]=sha(p);shutil.copy2(p,Q/p.name)
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());flags=cfg['flags']+['-Q',str(Q),'ArgmaxPool'];assert not set(flags)&{'-vos','-vok','-quick','-vio'};env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def compile(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(Q/(n+'.v'))];log=out/(n+'.log');cwd=out/'jobs'/n;cwd.mkdir(parents=True);start=time.monotonic()
  try:
   with log.open('w')as f:code=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=7200).returncode
  except subprocess.TimeoutExpired:code=124
  d=dict(module=n,command=cmd,exit_code=code,seconds=time.monotonic()-start,source_sha256=sha(Q/(n+'.v')),log_sha256=sha(log));print(n,code,flush=True);return d
 s=dict(passed=False,whole_kernel_verified=False,scope='complete1949 actual NEON strict interface+second type+field Print over explicitly reused checked scalar-profile component objects; not whole-sourcefresh kernel gate',run_directory=str(out),actual_goal_sha256=sourcehash['neon_unit_goal'],component_runs=[str(x)for x in runs],reused_source_sha256=sourcehash,reused_object_selection=chosen,duplicate_VO_SHA_conflicts=conflicts,new_source_sha256=newhash,records=records,configured_jobs=32,max_actual=a.max_live,memory_GiB_each=16,timeout_seconds=7200)
 try:
  if a.repair_noncall_closure:
   pending=set(sourcehash)-callset;done=set(callset);s['recompiled_noncall_closure']=sorted(pending);s['preserved_coherent_call_run']=str(runs[0])
   for n in pending:(Q/(n+'.vo')).unlink()
   graph={}
   for n in pending:
    t=(Q/(n+'.v')).read_text();deps=[]
    for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',t):
     prefix,body=m.groups()
     for word in body.split():
      q=(prefix+'.'+word)if prefix else word
      if q.startswith('ArgmaxPool.'):deps.append(q[len('ArgmaxPool.'):])
    graph[n]=set(deps)
   s['repair_dag']={n:sorted(x)for n,x in graph.items()}
   with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
    active={};failed=False
    while pending or active:
     if not failed:
      for n in sorted(n for n in pending if graph[n]<=done)[:a.max_live-len(active)]:active[pool.submit(compile,n)]=n;pending.remove(n)
     if not active:assert not pending or failed,('noncall source cycle',pending);break
     fs,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
     for z in fs:
      n=active.pop(z);d=z.result();records.append(d)
      if d['exit_code']:failed=True
      else:done.add(n)
   assert not failed and not pending,'noncall source repair failed'
  for n in ['NeonMemoryChecked','NeonKernelChecked']:
   d=compile(n);records.append(d);assert d['exit_code']==0,('Require/strict type failed',n)
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   for d in pool.map(compile,[f'NeonKernelAudit{k:02d}'for k in range(16)]):records.append(d)
  assert all(d['exit_code']==0 for d in records)
  d=compile('FinalNeonKernel');records.append(d);assert d['exit_code']==0
  reports=[]
  for k in range(16):
   n=f'NeonKernelAudit{k:02d}';source=(Q/(n+'.v')).read_text();outlog=(out/(n+'.log')).read_text();last=0
   for m in re.finditer(r'(?m)^Chars (\d+) - (\d+) \[Print~Assumptions~.*$',outlog):
    statement=source[int(m.group(1)):int(m.group(2))];fm=re.fullmatch(r'Print Assumptions ArgmaxPool.NeonKernelChecked.CheckedNeonKernel.(proof_of_\w+)\.',statement);assert fm
    block=outlog[last:m.start()];last=m.end()
    if'Axioms:\n'in block:ass=sorted(set(re.findall(r'(?m)^([A-Za-z_][\w.\']*)\s*:',block.rsplit('Axioms:\n',1)[1])))
    else:assert 'Closed under the global context'in block;ass=[]
    reports.append(dict(field=fm.group(1),shard=n,source_span=[int(m.group(1)),int(m.group(2))],assumptions=ass))
  assert len(reports)==1949
  s.update(assumption_reports=reports,inherited_assumption_union=sorted(set(x for d in reports for x in d['assumptions'])),source_digest_and_object_dependency_compatibility='ordinary Coq Require and complete VC_Correct strict module ascriptions accepted selected library dependency digests; duplicate object SHA identity was not assumed')
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in newhash.items());assert all(sha(Path(v['path']))==v['sha256']for v in chosen.values());s['passed']=True
 except Exception as e:s['error']=str(e)
 (out/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in['passed','run_directory','error']}),flush=True)
if __name__=='__main__':main()
