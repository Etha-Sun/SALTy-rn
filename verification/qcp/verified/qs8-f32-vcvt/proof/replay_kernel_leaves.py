#!/usr/bin/env python3
"""Replay failed/changed leaf proofs while retaining first-attempt sources/logs."""
from pathlib import Path
import argparse,hashlib,json,shutil,subprocess,time,threading
from concurrent.futures import ThreadPoolExecutor
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--run',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=900);a=p.parse_args();r=a.run.resolve();coq=r/'coq';old=json.loads((r/'status.json').read_text());assert old['generation_dir'];records=json.loads((r/'records.json').read_text());cmd=next(x['command']for x in records if x['label']=='KernelBounds');before=r/'before-leaf-replay';before.mkdir(exist_ok=True);saved=before/'status.json'
 if not saved.exists():shutil.copyfile(r/'status.json',saved)
 results=old['results'];newrecords=[];lock=threading.Lock();changed=[]
 def one(row):
  n=row['module'];public=HERE/'coq'/(n+'.v');private=coq/(n+'.v');v=coq/(n+'.vo')
  if row['exit_code']==0 and v.exists()and sha(public)==sha(private):return dict(row,source_sha256=sha(public),origin='first exact-source ordinary-Coq leaf')
  with lock:changed.append(n)
  if not(before/(n+'.v')).exists():shutil.copyfile(private,before/(n+'.v'))
  shutil.copyfile(public,private);h=sha(private);call=cmd.copy();call[-1]=str(private);work=r/'jobs'/(n+'-leaf-replay');work.mkdir(exist_ok=True);log=r/(n+'-leaf-replay.log');start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(call,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  if sha(private)!=h or sha(public)!=h:code=125
  rec={'label':n,'command':call,'exit_code':code,'seconds':time.monotonic()-start,'source_sha256':h,'log_sha256':sha(log)}
  with lock:newrecords.append(rec);(r/'leaf-replay-records.json').write_text(json.dumps(newrecords,indent=2)+'\n');print(n,code,flush=True)
  return dict(row,exit_code=code,source_sha256=h,origin='leaf-replay-records.json')
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:final=list(pool.map(one,results))
 d=dict(old,results=final,passed=all(x['exit_code']==0 for x in final),passed_fields=sum(x['exit_code']==0 for x in final),replay_changed_modules=changed,replay_records=newrecords,source_identity_checked=True,first_attempt_preserved=str(saved));d['whole_kernel_verified']=False
 for p in[r/'status.json',HERE/(a.isa+'-calls-status.json')]:p.write_text(json.dumps(d,indent=2)+'\n')
 print('complete',d['passed_fields'],'/',len(final),flush=True);return 0 if d['passed']else 1
if __name__=='__main__':raise SystemExit(main())
