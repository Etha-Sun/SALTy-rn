#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,hashlib,subprocess,os,tempfile,re,time,argparse,threading
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();a=argparse.ArgumentParser();a.add_argument('--jobs',type=int,default=32);a.add_argument('--live',type=int,default=2);a.add_argument('--unit',action='append');a.add_argument('--timeout',type=int,default=21600);o=a.parse_args();run=Path(tempfile.mkdtemp(prefix='adapter-goals-',dir=C/'.build'));units=json.loads((P/'adapter-unit-inventory.json').read_text())['units']+[{'stem':'control','source':'shim/control.c'}];units=[u for u in units if not o.unit or u['stem']in o.unit];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};lock=threading.Lock();rows=[];state={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'configured_parallel_jobs':o.jobs,'actual_live_cap':o.live,'per_process_memory_GiB':16,'units':rows}
def one(u):
 wd=run/u['stem'];wd.mkdir();cpp=wd/(u['stem']+'.c');src=C/u['source'];cp=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(src),'-o',str(cpp)],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(wd/'cpp.log').write_text(cp.stdout);assert cp.returncode==0,cp.stdout;cmd=['prlimit','--as=17179869184:17179869184','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(wd),'--coq-logic-path=Qs8Mul','-slp',str(C/'shim'),'Qs8Mul','-slp',str(P/'c'),'Qs8Mul'];work=wd/'qcp-work';work.mkdir();t=time.monotonic()
 with(wd/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=work,env=env,stdout=f,stderr=f,timeout=o.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=wd/(u['stem']+'_goal.v');row={**u,'generation_passed':code==0,'exit_code':code,'seconds':time.monotonic()-t,'run_directory':str(wd),'command':cmd,'source_sha256':sha(src),'cpp_sha256':sha(cpp),'goal':str(goal),'goal_sha256':sha(goal)if goal.exists()else None,'actual_C_fields':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 with lock:rows.append(row);(run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 print(u['stem'],code,row['actual_C_fields'],flush=True);return row
with ThreadPoolExecutor(max_workers=o.live)as pool:list(pool.map(one,units))
state['generation_passed']=all(u['generation_passed']for u in rows);(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');(P/('adapter-generation-'+('-'.join(o.unit)if o.unit else'all')+'-status.json')).write_text(json.dumps(state,indent=2)+'\n');print(json.dumps({k:state[k]for k in ['generation_passed','run_directory']}),flush=True)
