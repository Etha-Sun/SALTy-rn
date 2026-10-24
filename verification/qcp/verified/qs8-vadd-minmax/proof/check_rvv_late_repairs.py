#!/usr/bin/env python3
"""Check actual kernel partitions in one recorded fresh preparation environment."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent
NS='Qs8Add'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--coq-dir',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=7200);p.add_argument('--kind',choices=['Pure','Calls','all'],default='all');a=p.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=14400
 coq=a.coq_dir.resolve();prep=json.loads((coq.parent/'status.json').read_text());assert prep['prepared'] and prep['no_component_vo_reused'];assert sha(coq/'rvv_unit_goal.v')==prep['goal_sha256'];assert all(sha(coq/(n+'.v'))==x['sha256'] for n,x in prep['source_sha256'].items())
 for n in prep['source_sha256']:assert (coq/(n+'.vo')).is_file(),n
 r=Path(tempfile.mkdtemp(prefix='rvv-late-repairs-',dir=C/'.build'));(r/'sources').mkdir();records=[];guard={};flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS];s=dict(passed=False,whole_kernel_verified=False,scope='actual kernel proof partitions only; complete VC_Correct gate remains required',run_directory=str(r),fresh_preparation_directory=str(coq.parent),goal_sha256=prep['goal_sha256'],parallel_jobs=a.jobs,memory_limit_bytes_per_process=17179869184,timeout_seconds=a.timeout,records=records)
 names=['RvvKernelPureRepairPart09', 'RvvKernelCallsRepairPart00']

 for n in names:
  source=C/'proof/coq'/(n+'.v');guard[n]=sha(source);shutil.copyfile(source,r/'sources'/(n+'.v'));shutil.copyfile(source,coq/(n+'.v'))
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def check(n):
  cwd=r/n;cwd.mkdir();log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];t=time.monotonic()
  with log.open('w')as f:
   try:z=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:z=124
  return dict(label=n,exit_code=z,seconds=time.monotonic()-t,command=cmd,source_sha256=guard[n],log_sha256=sha(log),completed_qed=log.read_text(errors='replace').count('[Qed.]'))
 with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
  fs={pool.submit(check,n):n for n in names}
  for f in concurrent.futures.as_completed(fs):
   x=f.result();records.append(x);print(x['label'],x['exit_code'],x['seconds'],flush=True);(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 assert all(sha(C/'proof/coq'/(n+'.v'))==v for n,v in guard.items()),'partition source changed'
 assert all(sha(coq/(n+'.v'))==x['sha256']for n,x in prep['source_sha256'].items()),'prepared dependency changed'
 s.update(passed=all(x['exit_code']==0 for x in records),checked_c_vcs=sum(x['completed_qed']for x in records if x['exit_code']==0),source_sha256=guard,no_component_vo_reused_in_preparation=True)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s[k]for k in ['passed','run_directory','checked_c_vcs']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
