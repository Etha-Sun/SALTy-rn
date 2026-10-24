#!/usr/bin/env python3
"""Check actual kernel fields in one coherent prepared environment, with explicit live-memory cap."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,shutil,subprocess,tempfile,time,threading
C=Path(__file__).resolve().parent.parent;NS='Qu8Add';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--coq-dir',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=8);p.add_argument('--timeout',type=int,default=7200);p.add_argument('--kind',choices=['Pure','Calls','all'],default='all');a=p.parse_args();assert a.jobs==32 and 1<=a.live_jobs<=a.jobs and 0<a.timeout<=14400
 q=a.coq_dir.resolve();prep=json.loads((q.parent/'status.json').read_text());assert prep['prepared']and prep['no_component_vo_reused'];assert sha(q/'rvv_unit_goal.v')==prep['goal_sha256'];assert all(sha(q/(n+'.v'))==x['sha256']for n,x in prep['source_sha256'].items());metadata=json.loads((C/'proof/rvv-generated-partitions.json').read_text());names=[n for n in metadata['partitions']if a.kind=='all'or a.kind in n];r=Path(tempfile.mkdtemp(prefix='rvv-partitions32-',dir=C/'.build'));(r/'sources').mkdir();guard={};records=[];state=dict(passed=False,whole_kernel_verified=False,scope='actual kernel field partitions only; complete typed interface and full case remain required',run_directory=str(r),fresh_preparation_directory=str(q.parent),goal_sha256=prep['goal_sha256'],configured_workers=32,parallel_jobs=32,initial_live_workers=a.live_jobs,memory_limit_bytes_per_process=17179869184,timeout_seconds=a.timeout,records=records);limit=r/'live-limit.json';limit.write_text(json.dumps(dict(live_jobs=a.live_jobs))+'\n');(r/'status.json').write_text(json.dumps(state,indent=2)+'\n');flags=json.loads(a.config.read_text())['flags']+['-Q',str(q),NS]
 for n in names:
  f=C/'proof/coq'/(n+'.v');guard[n]=sha(f);shutil.copyfile(f,r/'sources'/f.name);shutil.copyfile(f,q/f.name)
 cv=threading.Condition();active=0;peak=0
 def check(n):
  nonlocal active,peak
  with cv:
   while True:
    try:live=json.loads(limit.read_text())['live_jobs']
    except(json.JSONDecodeError,OSError):live=a.live_jobs
    assert 1<=live<=32
    if active<live:active+=1;peak=max(peak,active);break
    cv.wait(.25)
  log=r/(n+'.log');cwd=r/n;cwd.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(q/(n+'.v'))];t=time.monotonic()
  try:
   with log.open('w')as f:
    try:z=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:z=124
  finally:
   with cv:active-=1;cv.notify_all()
  return dict(label=n,exit_code=z,seconds=time.monotonic()-t,command=cmd,source_sha256=guard[n],log_sha256=sha(log),completed_qed=log.read_text(errors='replace').count('[Qed.]'))
 with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
  fs=[pool.submit(check,n)for n in names]
  for f in concurrent.futures.as_completed(fs):
   x=f.result();records.append(x);state['peak_actual_live_workers']=peak;print(x['label'],x['exit_code'],round(x['seconds'],2),flush=True);(r/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 assert all(sha(C/'proof/coq'/(n+'.v'))==v and sha(q/(n+'.v'))==v for n,v in guard.items());assert all(sha(q/(n+'.v'))==x['sha256']for n,x in prep['source_sha256'].items());state.update(passed=all(x['exit_code']==0 for x in records),checked_c_vcs=sum(len(metadata['partitions'][x['label']])for x in records if x['exit_code']==0),source_sha256=guard,no_component_vo_reused_in_preparation=True);(r/'status.json').write_text(json.dumps(state,indent=2)+'\n');print(json.dumps({k:state[k]for k in ['passed','checked_c_vcs','run_directory']},indent=2));return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
