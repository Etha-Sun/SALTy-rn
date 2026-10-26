#!/usr/bin/env python3
"""Replay every previously failed actual leaf with new proof tactics.
The original failed leaves and their logs remain intact; no target is removed.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--failed-run',required=True);ap.add_argument('--base-run',required=True);ap.add_argument('--max-live',type=int,default=4);ap.add_argument('--timeout',type=int,default=7200);a=ap.parse_args();assert 0<a.max_live<=4 and 0<a.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 old=Path(a.failed_run).resolve();o=json.loads((old/'status.json').read_text());base=Path(a.base_run).resolve();b=json.loads((base/'status.json').read_text());assert b['passed']and o['actual_goal_sha256']==sha(C/'proof/coq/neon_unit_goal.v')
 failed=[r for r in o['records']if r.get('field')and r['exit_code']];assert failed
 run=Path(tempfile.mkdtemp(prefix='neon-final-repairs-',dir=C/'.build'));q=run/'coq';q.mkdir();reuse={};new={};records=[];tasks=[]
 for p in sorted((base/'coq').glob('*.v')):
  assert sha(p)==sha(C/'proof/coq'/p.name),p.name
  for ext in ['.v','.vo']:
   f=p.with_suffix(ext);assert f.exists();shutil.copy2(f,q/f.name);reuse[f.name]=sha(f)
 for r in failed:
  n=r['module'].replace('NeonRepair','NeonFinalRepair');src=(C/'proof/coq'/(r['module']+'.v')).read_text().replace('NeonRepairTactics neon_unit_goal','NeonFinalRepairTactics neon_unit_goal').replace('emkx_frame','emkf_frame').replace('emkx_pure_goal','emkf_pure_goal');p=C/'proof/coq'/(n+'.v')
  if p.exists():assert p.read_text()==src,n
  else:p.write_text(src)
  shutil.copy2(p,q/p.name);new[n]=sha(p);tasks.append((n,r['field']))
 flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(q),'ExpMinusMax'];assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='previously failed exact actual C leaf replay only; no whole-case credit',run_directory=str(run),failed_run=str(old),failed_status_sha256=sha(old/'status.json'),base_status_sha256=sha(base/'status.json'),actual_goal_sha256=o['actual_goal_sha256'],configured_jobs=32,max_live_processes=a.max_live,per_process_memory_GiB=16,reused_source_object_sha256=reuse,new_source_sha256=new,records=records)
 def compile(n,f):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(q/(n+'.v'))];log=run/(n+'.log');cwd=run/'jobs'/n;cwd.mkdir(parents=True);t=time.monotonic()
  try:
   with log.open('w')as out:ec=subprocess.run(cmd,cwd=cwd,env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']},stdout=out,stderr=out,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:ec=124
  print(n,ec,flush=True);return dict(module=n,field=f,exit_code=ec,command=cmd,seconds=time.monotonic()-t,source_sha256=sha(q/(n+'.v')),log_sha256=sha(log))
 try:
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   fs=[pool.submit(compile,*task)for task in tasks]
   for f in concurrent.futures.as_completed(fs):records.append(f.result());(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert all(r['exit_code']==0 for r in records),'actual leaf failures remain'
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in new.items())
  assert all(sha(base/'coq'/n)==h for n,h in reuse.items());s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/neon-final-repair-leaf-status.json').write_bytes((run/'status.json').read_bytes());print(run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
