#!/usr/bin/env python3
"""Finite repaired actual kernels and independent128-bit scalar oracle."""
from pathlib import Path
import os,json,subprocess,tempfile,time,hashlib,resource,shutil
resource.setrlimit(resource.RLIMIT_CORE,(0,0));case=Path(__file__).resolve().parent.parent;run=Path(tempfile.mkdtemp(prefix='native-oracle-',dir=case/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();harness=case/'shim/native_oracle.c';records=[];inputs={};status={'passed':False,'whole_kernel_verified':False,'scope':'Finite original/repaired whole kernels in array runtime with independent128-bit oracle; not scalar-field proof, not ISA execution','run_directory':str(run),'records':records}
def execute(cmd,label,expect=0,limit_as=True):
 cmd=list(map(str,cmd));command=['prlimit','--as=17179869184:17179869184','--',*cmd]if limit_as else cmd;log=run/(label+'.log');start=time.monotonic()
 with log.open('w')as f:r=subprocess.run(command,cwd=run,stdout=f,stderr=f,timeout=1800)
 records.append({'label':label,'command':command,'exit_code':r.returncode,'expected_exit_code':expect,'seconds':time.monotonic()-start,'log_sha256':sha(log)});assert r.returncode==expect,(label,r.returncode,log.read_text()[-1500:]);print(label,r.returncode,flush=True);return log.read_text()
try:
 dep=subprocess.check_output(['gcc','-MM',str(harness),str(case/'shim/scalar.c')],text=True,cwd=run).replace('\\\n',' ')
 for line in dep.splitlines():
  for name in line.split(':',1)[1].split():
   p=Path(name).resolve();assert p.is_relative_to(case);inputs[str(p.relative_to(case))]=sha(p)
 for mode in ['undefined','address']:
  exe=run/mode;flags=['gcc','-O1','-g','-std=c11','-fsanitize='+mode,'-fno-sanitize-recover=all','-fno-omit-frame-pointer'];execute([*flags,harness,case/'shim/scalar.c','-o',exe],mode+'-compile')
  launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184' and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
  if mode=='undefined':text=execute([exe],mode+'-oracle');result=json.loads(text)
  else:
   text=execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,exe],mode+'-oracle',limit_as=False);lines=text.splitlines();status['asan_cgroup']=json.loads(lines[0]);result=json.loads(lines[-1])
  assert result['failures']==0 and result['scalar_checks']==33280 and result['input_and_params_preserved']and result['canaries_checked'];status[mode+'_output']=result
  wrong=run/(mode+'-wrong');execute([*flags,'-DQLR_NEGATIVE_CONTROL',harness,case/'shim/scalar.c','-o',wrong],mode+'-negative-compile')
  if mode=='undefined':execute([wrong],mode+'-negative',expect=-6)
  else:execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,wrong],mode+'-negative',expect=250,limit_as=False)
 assert all(sha(case/n)==v for n,v in inputs.items());status.update(passed=True,input_sha256=inputs,source_identity_stable=True,system_headers_not_hashed=True)
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in [run/'status.json',case/'proof/native-array-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in ['passed','undefined_output','address_output','run_directory','error']}),flush=True);raise SystemExit(0 if status['passed']else 1)
