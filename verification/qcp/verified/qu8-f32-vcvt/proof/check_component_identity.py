#!/usr/bin/env python3
"""Fresh CPP/QCP target identity against existing typed component goals.

This is a source/target identity audit, not another Coq execution or new C VC.
The final unified gate still recompiles all required proof source afresh.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,hashlib,subprocess,tempfile,time,argparse
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();old=json.loads((HERE/'component-unit-preflight.json').read_text());units=[u for u in old['units']if u['generation_kind']=='direct'];assert len(units)==28;r=Path(tempfile.mkdtemp(prefix='component-identity-',dir=CASE/'.build'));slp=[]
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():slp+=['-slp',str(d),d.name]
 slp+=['-slp',str(CASE/'shim'),'Qu8Cvt','-slp',str(HERE/'c'),'Qu8Cvt']
 def one(u):
  d=r/u['stem'];d.mkdir();cpp=d/(u['stem']+'.c');cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc',str(CASE/u['actual_source']),'-o',str(cpp)];x=subprocess.run(cmd,cwd=d,capture_output=True,text=True,timeout=300);assert x.returncode==0,x.stderr
  out=d/'generated';out.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path=Qu8Cvt',*slp];t=time.monotonic()
  with(d/'qcp.log').open('w')as f:
   try:code=subprocess.run(cmd,cwd=d,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  g=out/(u['stem']+'_goal.v');passed=code==0 and g.exists()and sha(g)==u['goal_sha256'];row=dict(stem=u['stem'],audit_passed=passed,exit_code=code,command=cmd,seconds=time.monotonic()-t,current_cpp=str(cpp),current_cpp_sha256=sha(cpp),current_goal=str(g),current_goal_sha256=sha(g)if g.exists()else None,previous_typed_goal=u['goal'],previous_typed_goal_sha256=u['goal_sha256'],actual_c_vcs=u['actual_c_vcs'],typed_instance=u['typed_instance']);(d/'status.json').write_text(json.dumps(row,indent=2)+'\n');print(u['stem'],passed,code,flush=True);return row
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:rows=list(pool.map(one,units))
 s=dict(passed=all(x['audit_passed']for x in rows),formal_proof_replayed=False,coq_replayed=False,whole_kernel_verified=False,scope='Fresh live CPP/QCP target identity audit against byte-identical earlier typed goals; zero additional proven C VCs. Mandatory final full gate rebuilds all .v.',run_directory=str(r),units=rows,actual_c_units=len(rows),existing_typed_c_fields=sum(x['actual_c_vcs']for x in rows))
 for p in[r/'status.json',HERE/'component-identity-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',r,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
