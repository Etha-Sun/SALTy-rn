#!/usr/bin/env python3
"""Finite original-kernel replay of reviewed sqrt contracts with independent sqrtl RNE oracle."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,hashlib,subprocess,tempfile,time,os,shlex,threading,re
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='native-',dir=C/'.build'));records=[];lock=threading.Lock();s={'passed':False,'whole_kernel_verified':False,'scope':'finite_native_only','run_directory':str(run),'records':records};providers=[C/'spec.c',C/'shim/assert.c',C/'shim/store_adapters.c',C/'shim/rvv_store.c',C/'shim/runtime/intrinsics.c',C/'shim/array_read.c',C/'shim/bridge.c',C/'shim/comparator.c'];kernels=[];wrong=[]
 def execute(label,cmd,expected=0,bounded=True):
  cmd=list(map(str,cmd));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if bounded else cmd;w=run/'jobs'/label;w.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=w,stdout=f,stderr=f,timeout=1800)
  with lock:records.append({'label':label,'command':cmd,'exit_code':r.returncode,'expected_exit_code':expected,'seconds':time.monotonic()-t,'log_sha256':sha(log)})
  assert r.returncode==expected,(label,r.returncode,log.read_text()[-3000:]);print(label,r.returncode,flush=True);return log.read_text()
 try:
  s['compiler_version']=execute('compiler-version',['gcc-12','--version']).splitlines()[0]
  for isa,name in [('neon','testNEON.c'),('rvv','testRVV.c')]:
   prefix='#include "'+str(C/'shim/intrinsics.h')+'"\n';raw=(C/'impl'/name).read_text();p=run/(isa+'.c');p.write_text(prefix+raw);kernels.append(p)
   p=run/(isa+'-wrong.c');fn='test_'+isa;p.write_text(prefix+'#define '+fn+' real_'+fn+'\n'+raw+'\n#undef '+fn+'\nvoid '+fn+'(size_t n,const float* a,float* b,const struct xnn_f32_default_params*p){real_'+fn+'(n,a,b,p);unsigned u;__builtin_memcpy(&u,b,4);u^=1;__builtin_memcpy(b,&u,4);}\n');wrong.append(p)
  inventory={};harness=C/'shim/runtime/harness.c'
  for i,p in enumerate([*providers,harness,*kernels]):
   out=execute('dependencies-'+str(i),['gcc-12','-std=c11','-DQCP_SQRT_NATIVE','-MM','-I',C/'shim',p]).replace('\\\n',' ')
   for line in out.splitlines():
    for n in shlex.split(line.split(':',1)[1]):
     q=Path(n).resolve();assert q.is_relative_to(R)
     if not q.is_relative_to(run):inventory[os.path.relpath(q,C)]=sha(q)
  for p in [C/'impl/testNEON.c',C/'impl/testRVV.c',H/'intrinsic-ledger.json',H/'coq/Model.v',H/'coq/Observation.v',Path(__file__)]:inventory[os.path.relpath(p,C)]=sha(p)
  s['input_sha256']=inventory;s['system_headers_in_inventory']=False
  launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
  for mode in ['undefined','address']:
   flags=['gcc-12','-std=c11','-O1','-g','-Wall','-Wextra','-Wno-unused-parameter','-Wno-misleading-indentation','-Werror','-DQCP_SQRT_NATIVE','-frounding-math','-fno-fast-math','-ffp-contract=off','-fsanitize='+mode,'-fno-sanitize-recover=all','-I',C/'shim'];sources=[*providers,harness,*kernels,*wrong];objects=[run/(mode+'-'+str(i)+'.o')for i in range(len(sources))]
   with ThreadPoolExecutor(max_workers=32)as pool:list(pool.map(lambda i:execute(mode+'-compile-'+str(i),[*flags,'-c',sources[i],'-o',objects[i]]),range(len(sources))))
   positive=run/(mode+'-native');negative=run/(mode+'-common-wrong');execute(mode+'-link',[*flags,*objects[:-2],'-lm','-o',positive]);execute(mode+'-negative-link',[*flags,*objects[:len(providers)+1],*objects[-2:],'-lm','-o',negative])
   def call(exe):return [exe]if mode=='undefined'else ['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,exe]
   out=execute(mode+'-run',call(positive),bounded=mode=='undefined');m=re.search(r'(\d+) cases, (\d+) lanes per side, independent sqrtl oracle passed',out);assert m;s[mode+'_finite_counts']={'cases':int(m[1]),'lanes_per_side':int(m[2])}
   out=execute(mode+'-common-wrong',call(negative),expected=1,bounded=mode=='undefined');assert 'ERROR: AddressSanitizer'not in out and 'ERROR: LeakSanitizer'not in out
   m=re.search(r'oracle mismatch n=(\d+) i=(\d+) x=(\w+) neon=(\w+) rvv=(\w+) oracle=(\w+)',out);assert m and m[4]==m[5]and m[4]!=m[6];s[mode+'_negative_control']={'both_wrong':m[4],'oracle':m[6],'exit_code':1}
  assert all(sha(C/n)==h for n,h in inventory.items());s.update(passed=True,per_process_memory_GiB=16,common_wrong_negative_control_rejected=True,independent_oracle='long double sqrtl then binary32 RNE; input-bit classification handles NaN/negative; ARM quiet payload and RVV canonical checked separately; finite evidence only',generated_source_sha256={p.name:sha(p)for p in kernels+wrong})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'native-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
