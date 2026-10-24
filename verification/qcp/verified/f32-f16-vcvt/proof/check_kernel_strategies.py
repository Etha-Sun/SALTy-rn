#!/usr/bin/env python3
from pathlib import Path
import subprocess,json,tempfile,hashlib,re,time,shutil,sys
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='kernel-strategies-',dir=C/'.build'));records=[];s={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'groups':[]}
 slp=['-slp',C/'shim','F32F16','-slp',H/'c','F32F16']
 for d in sorted((B/'proof/c').iterdir()):
  if d.is_dir():slp+=['-slp',d,d.name]
 try:
  for n in ['f16_kernel','f16_neon_load','f16_public']:
   out=run/n;out.mkdir();cmd=list(map(str,[Path(shutil.which('qcp')).resolve().parent/'StrategyCheck','--arch=64','--endian=little','--no-exec-info','--input-file='+str(H/'c'/(n+'.strategies')),'--coq-output-dir='+str(out),'--coq-logic-path=F32F16',*slp]));log=run/(n+'.log');t=time.monotonic()
   with log.open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*cmd],cwd=out,stdout=f,stderr=f,timeout=300)
   records.append({'command':cmd,'exit_code':r.returncode,'log_sha256':sha(log),'seconds':time.monotonic()-t});assert r.returncode==0,log.read_text()[-2000:];goal=out/(n+'_strategy_goal.v');shutil.copyfile(goal,H/'coq'/goal.name);s['groups'].append({'stem':n,'goal_sha256':sha(goal),'source_sha256':sha(H/'c'/(n+'.strategies')),'generation_directory':str(out)})
  s['generation_passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'kernel-strategy-generation-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s.get('generation_passed')else 1)
if __name__=='__main__':main()
