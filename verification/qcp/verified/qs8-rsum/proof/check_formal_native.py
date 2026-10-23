from pathlib import Path
import os,json,hashlib,subprocess,tempfile,time,resource
resource.setrlimit(resource.RLIMIT_CORE,(0,0))
P=Path(__file__).resolve().parent;c=P.parent;run=Path(tempfile.mkdtemp(prefix='formal-native-',dir=c/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'All current actual scalar-field C helper units, both kernels, public wrapper; native evidence only','run_directory':str(run),'records':records};sources=list(dict.fromkeys([c/'shim'/(u['stem']+'.c')for u in json.loads((P/'vector-status.json').read_text())['units']]+[c/'shim'/(n+'.c')for n in ['scalar_primitives','rvv_scalar','neon_load','rvv_load','vl','control']]));units=[(s,None)for s in sources]+[(c/'impl/testNEON.c',c/'shim/neon_frontend.h'),(c/'impl/testRVV.c',c/'shim/rvv_frontend.h'),(c/'spec.c',None)];harness=c/'shim/formal_native_harness.c';inputs={harness}
def execute(cmd,label,expected_zero=True,limit_as=True,timeout=300):
 t=time.monotonic();log=run/(label+'.log');command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]if limit_as else list(map(str,cmd))
 with log.open('w')as f:r=subprocess.run(command,cwd=run,stdout=f,stderr=f,timeout=timeout)
 records.append({'label':label,'command':command,'exit_code':r.returncode,'expected_zero':expected_zero,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,r.returncode,flush=True)
 if (r.returncode==0)!=expected_zero:raise RuntimeError(log.read_text()[-4000:])
 return log.read_text()
try:
 for src,header in units:
  cmd=['gcc','-MM','-nostdinc']+(['-include',str(header)]if header else[])+[str(src)];dep=subprocess.check_output(cmd,cwd=run,text=True).replace('\\\n',' ').split(':',1)[1].split();inputs.update(Path(x)for x in dep)
 before={str(p.relative_to(c)):sha(p)for p in sorted(inputs)};status['input_sha256_before']=before
 for mode in ['undefined','address']:
  objects=[];flags=['gcc','-O1','-g','-std=c11','-fsanitize='+mode,'-fno-sanitize-recover=all','-fno-omit-frame-pointer']
  for i,(src,header)in enumerate(units):
   obj=run/f'{mode}-{i}.o';execute([*flags,*(['-include',header]if header else[]),'-c',src,'-o',obj],f'{mode}-compile-{i}');objects.append(obj)
  exe=run/mode;execute([*flags,harness,*objects,'-o',exe],mode+'-link')
  if mode=='undefined':out=execute([exe],'ubsan-oracle');status['ubsan_output']=json.loads(out)
  else:
   launch="import pathlib,subprocess,json,sys;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184' and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
   out=execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,exe],'asan-oracle',limit_as=False);lines=out.splitlines();status['asan_cgroup']=json.loads(lines[0]);status['asan_output']=json.loads(lines[-1])
  negative=run/(mode+'-negative');execute([*flags,'-DRSUM_NEGATIVE_CONTROL',harness,*objects,'-o',negative],mode+'-negative-link')
  if mode=='undefined':execute([negative],'ubsan-negative',expected_zero=False)
  else:execute(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch,negative],'asan-negative',expected_zero=False,limit_as=False)
 after={str(p.relative_to(c)):sha(p)for p in sorted(inputs)};assert before==after,'Native source changed during build/run';status.update(passed=True,input_sha256=after,source_identity_stable=True,actual_c_units=len(units),system_headers_not_hashed=True)
except Exception as e:status['error']=str(e);print(str(e),flush=True)
for p in [run/'status.json',P/'formal-native-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_c_units','ubsan_output','asan_output','error']}),flush=True)
raise SystemExit(0 if status['passed']else 1)
