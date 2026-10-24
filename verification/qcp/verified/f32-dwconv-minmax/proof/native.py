"""Finite dual-sanitizer loop-compatible-NEON/repaired-RVV replay, not proof credit."""
from pathlib import Path
import json,subprocess,tempfile,hashlib,time,shlex,os,re,concurrent.futures,threading
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='native-',dir=C/'.build'));records=[];lock=threading.Lock();s=dict(passed=False,whole_kernel_verified=False,scope='finite_native_only',configured_jobs=32,max_live_compile_processes=1,run_directory=str(run),records=records);snap=run/'input-source-snapshot';snap.mkdir()
 def execute(label,cmd,expected=0,bounded=True):
  cmd=list(map(str,cmd));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if bounded else cmd;log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as out:r=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=1800)
  with lock:records.append(dict(label=label,command=cmd,exit_code=r.returncode,expected_exit_code=expected,seconds=time.monotonic()-start,log_sha256=sha(log)))
  assert r.returncode==expected,(label,log.read_text()[-2500:]);print(label,r.returncode,flush=True);return log.read_text()
 try:
  s['compiler_version']=execute('compiler-version',['gcc-12','--version']).splitlines()[0];sources=[];wrong=[]
  for isa,fn in [('neon','testNEON.c'),('rvv','testRVV.c')]:
   prefix='#include "'+str(C/'shim/runtime/host.h')+'"\n';raw=(C/'impl'/fn).read_text();p=run/(isa+'.c');p.write_text(prefix+raw);sources.append(p);p=run/(isa+'-wrong.c');name='test_'+isa;p.write_text(prefix+'#define '+name+' real_'+name+'\n'+raw+'\n#undef '+name+'\nvoid '+name+'(size_t n,size_t p,const float**i,const float*w,float*o,intptr_t s,size_t oi,size_t off,size_t ps,const float*z,const struct xnn_f32_minmax_params*mm){real_'+name+'(n,p,i,w,o,s,oi,off,ps,z,mm);uint32_t u;memcpy(&u,o,4);u^=1;memcpy(o,&u,4);}\n');wrong.append(p)
  harness=C/'shim/runtime/harness.c';inventory={}
  for i,p in enumerate([*sources,harness]):
   out=execute('dependencies-'+str(i),['gcc-12','-std=c11','-MM',p]).replace('\\\n',' ')
   for n in shlex.split(out.split(':',1)[1]):
    q=Path(n).resolve();assert q.is_relative_to(R)
    if not q.is_relative_to(run):inventory[os.path.relpath(q,C)]=sha(q)
  for p in [C/'impl/testNEON.c',C/'impl/testRVV.c',H/'repair.json',H/'repair.patch',H/'originals.json',Path(__file__)]:inventory[os.path.relpath(p,C)]=sha(p)
  for relative in inventory:
   p=C/relative;q=snap/relative;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(p.read_bytes())
  s['input_sha256']=inventory;s['system_headers_in_inventory']=False
  launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
  for mode in ['undefined','address']:
   flags=['gcc-12','-std=c11','-O1','-g','-frounding-math','-fno-fast-math','-ffp-contract=off','-fsanitize='+mode,'-fno-sanitize-recover=all','-Wall','-Wextra','-Wno-unused-parameter','-Werror'];all_sources=[*sources,harness,*wrong];objs=[run/(mode+'-'+str(i)+'.o')for i in range(len(all_sources))]
   with concurrent.futures.ThreadPoolExecutor(max_workers=1)as pool:list(pool.map(lambda i:execute(mode+'-compile-'+str(i),[*flags,'-c',all_sources[i],'-o',objs[i]]),range(len(all_sources))))
   positive=run/(mode+'-positive');negative=run/(mode+'-common-wrong');execute(mode+'-link',[*flags,*objs[:3],'-lm','-o',positive]);execute(mode+'-negative-link',[*flags,objs[2],*objs[3:],'-lm','-o',negative])
   def call(p):return[p]if mode=='undefined'else['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,p]
   out=execute(mode+'-run',call(positive),bounded=mode=='undefined');m=re.search(r'(\d+) cases, (\d+) lanes per side, independent packed4 acc2 scalar oracle passed',out);assert m;s[mode+'_finite_counts']=dict(cases=int(m[1]),lanes_per_side=int(m[2]))
   out=execute(mode+'-common-wrong',call(negative),expected=1,bounded=mode=='undefined');assert all(x not in out for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']);m=re.search(r'oracle mismatch .*neon=(\w+) rvv=(\w+) oracle=(\w+)',out);assert m and m[1]==m[2]and m[1]!=m[3];s[mode+'_negative_control']=dict(both_wrong=m[1],oracle=m[3],exit_code=1)
  assert all(sha(C/n)==d for n,d in inventory.items());s.update(passed=True,per_process_memory_GiB=16,common_wrong_negative_control_rejected=True,independent_oracle='scalar packed4 indexing, fmaf/tap0 then separate mul/tap1 then fmaf/tap2 then add; independent bit-class NaN handling and libc fminf/fmaxf; numeric-or-bothNaN observation',covered_shapes='channels1..65,width1..4; signed/zero/overlapping pointer-table stride; repeated/zero pointers; offsets and per-pixel advance; output gaps and repeated output addresses; all-FP32 special/random inputs and unordered/NaN bounds')
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'native-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
