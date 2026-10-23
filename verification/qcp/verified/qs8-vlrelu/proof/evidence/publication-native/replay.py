#!/usr/bin/env python3
"""Finite actual scalar-field bodies/kernels/public caller and independent oracle."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import os,json,subprocess,tempfile,time,hashlib,resource,shutil,threading,shlex
resource.setrlimit(resource.RLIMIT_CORE,(0,0))
case=Path('/srv/home/yuechunsun/tools/qcp-simple-integration/verification/qcp/verified/qs8-vlrelu');run=Path(tempfile.mkdtemp(prefix='formal-native-',dir=case/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();harness=case/'shim/native_formal.c';records=[];inputs={};lock=threading.Lock();sources=[case/n for n in json.loads((case/'proof/native-formal-units.json').read_text())['sources']];assert len(sources)==len(set(sources))==31
status={'passed':False,'whole_kernel_verified':False,'scope':'Finite actual scalar-field providers/repaired kernels/real public caller with independent128-bit oracle; not formal proof or ISA execution','run_directory':str(run),'records':records,'parallel_jobs':16,'per_process_memory_GiB':16,'provider_translation_units':31}
def execute(cmd,label,expect=0,limit_as=True):
 cmd=list(map(str,cmd));command=['prlimit','--as=17179869184:17179869184','--',*cmd]if limit_as else cmd;log=run/(label+'.log');work=run/'jobs'/label;work.mkdir(parents=True);start=time.monotonic()
 with log.open('w')as f:r=subprocess.run(command,cwd=work,stdout=f,stderr=f,timeout=1800)
 with lock:records.append({'label':label,'command':command,'cwd':str(work),'exit_code':r.returncode,'expected_exit_code':expect,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
 assert r.returncode==expect,(label,r.returncode,log.read_text()[-2500:]);print(label,r.returncode,flush=True);return log.read_text()
try:
 for i,source in enumerate([harness,*sources]):
  text=execute(['gcc','-DQCP_NATIVE','-MM',source],'dependencies-'+str(i)).replace('\\\n',' ')
  for line in text.splitlines():
   assert ':' in line
   for name in shlex.split(line.split(':',1)[1]):
    p=Path(name).resolve();assert p.is_relative_to(case);inputs[str(p.relative_to(case))]=sha(p)
 for name in ['proof/check_native_formal.py','proof/native-formal-units.json']:inputs[name]=sha(case/name)
 for mode in ['undefined','address']:
  flags=['gcc','-DQCP_NATIVE','-O1','-g','-std=c11','-fsanitize='+mode,'-fno-sanitize-recover=all','-fno-omit-frame-pointer'];objects=[run/(mode+'-'+str(i)+'.o')for i in range(len(sources))]
  with ThreadPoolExecutor(max_workers=16)as pool:list(pool.map(lambda item:execute([*flags,'-c',item[1],'-o',objects[item[0]]],mode+'-compile-'+str(item[0])),enumerate(sources)))
  exe=run/mode;execute([*flags,harness,*objects,'-o',exe],mode+'-link')
  launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184' and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
  if mode=='undefined':text=execute([exe],mode+'-oracle');result=json.loads(text)
  else:
   text=execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,exe],mode+'-oracle',limit_as=False);lines=text.splitlines();status['asan_cgroup']=json.loads(lines[0]);result=json.loads(lines[-1])
  assert result=={'cases':17940,'lanes_per_side':7187700,'scalar_checks':33280,'failures':0,'input_and_params_preserved':True,'canaries_checked':True};status[mode+'_output']=result
  wrong=run/(mode+'-wrong');execute([*flags,'-DQLR_NEGATIVE_CONTROL',harness,*objects,'-o',wrong],mode+'-negative-link')
  if mode=='undefined':text=execute([wrong],mode+'-negative',expect=-6)
  else:text=execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,wrong],mode+'-negative',expect=250,limit_as=False)
  assert 'common-wrong-sides-agree=1' in text
 assert all(sha(case/n)==v for n,v in inputs.items());status.update(passed=True,input_sha256=inputs,source_identity_stable=True,system_headers_not_hashed=True,common_wrong_negative_control_rejected=True)
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in [run/'status.json',Path('/srv/home/yuechunsun/tools/qcp-simple-integration/verification/qcp/verified/qs8-vlrelu/.build/publication-9n09arnh/native-status.json')]:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in ['passed','undefined_output','address_output','run_directory','error']}),flush=True);raise SystemExit(0 if status['passed']else 1)
