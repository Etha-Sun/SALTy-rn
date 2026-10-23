#!/usr/bin/env python3
"""Finite current repaired integer reduction with array-runtime shims; no proof claim."""
from pathlib import Path
import subprocess,hashlib,json,tempfile,shlex,time,os,re
CASE=Path(__file__).resolve().parent.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='native-final-',dir=CASE/'.build'));inputs=[CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',CASE/'shim/native_harness.c'];flags=['-std=c11','-O1','-g','-DRSUM_SIGNED','-include',str(CASE/'shim/runtime.h')];records=[];status={'passed':False,'whole_kernel_verified':False,'run_directory':str(r),'scope':'Finite current repaired signed reduction kernels using array-runtime shims, independent modulo32 scalar oracle and guards. Not scalar-field provider execution, public-caller check, formal proof or ISA refinement.','records':records}
 def exe(cmd,label,limit=True,env=None):
  cmd=list(map(str,cmd));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if limit else cmd;t=time.monotonic();x=subprocess.run(cmd,cwd=r,capture_output=True,text=True,timeout=1800,env=env);log=r/(label+'.log');log.write_text(x.stdout+x.stderr);records.append({'label':label,'command':cmd,'exit_code':x.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,x.returncode,flush=True)
  if x.returncode:raise RuntimeError(log.read_text()[-4000:])
  return x.stdout
 try:
  deps=exe(['gcc',*flags,'-MM',*inputs],'dependencies');files=set()
  for line in deps.replace('\\\n',' ').splitlines():files.update(shlex.split(line.split(':',1)[1]))
  inventory={str(Path(x).resolve().relative_to(CASE))if Path(x).resolve().is_relative_to(CASE)else os.path.relpath(Path(x).resolve(),CASE):sha(Path(x).resolve())for x in files};assert inventory and all((CASE/k).resolve().is_relative_to(ROOT)for k in inventory)
  ub=r/'native-ubsan';exe(['gcc',*flags,'-fsanitize=undefined','-fno-sanitize-recover=all',*inputs,'-o',ub],'compile-ubsan');output=exe([ub],'runtime-ubsan',env=dict(os.environ,UBSAN_OPTIONS='halt_on_error=1'));assert json.loads(output)['cases']==990 and json.loads(output)['lanes_per_side']==1075860 and json.loads(output)['failures']==0
  asan=r/'native-asan';exe(['gcc',*flags,'-fsanitize=address','-fno-omit-frame-pointer',*inputs,'-o',asan],'compile-asan')
  launcher=r/'cgroup-launch.py';launcher.write_text('from pathlib import Path\nimport os,sys\nr=Path("/proc/self/cgroup").read_text().split("0::",1)[1].splitlines()[0]\np=Path("/sys/fs/cgroup")/r.lstrip("/")/"memory.max"\nv=p.read_text().strip()\nprint("actual_memory_max="+v,flush=True)\nassert v=="17179869184"\nos.execv(sys.argv[1],[sys.argv[1]])\n')
  outputa=exe(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','--setenv=ASAN_OPTIONS=detect_leaks=1:halt_on_error=1','/usr/bin/python3',launcher,asan],'runtime-asan-cgroup',False);assert 'actual_memory_max=17179869184'in outputa and json.loads(outputa.splitlines()[-1])['cases']==990 and json.loads(outputa.splitlines()[-1])['lanes_per_side']==1075860 and json.loads(outputa.splitlines()[-1])['failures']==0
  assert all(sha(CASE/k)==v for k,v in inventory.items());status.update(passed=True,ubsan_output=output,asan_output=outputa,current_sources_sha256=inventory,input_sha256=inventory,recursive_input_count=len(inventory),input_identity_unchanged=True,asan_actual_memory_max=17179869184,per_process_memory_GiB=16)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 for p in[r/'status.json',CASE/'proof/native-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',r,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
