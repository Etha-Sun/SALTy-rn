#!/usr/bin/env python3
"""Finite native current actual scalar-field C closure + UBSan/ASan; no proof claim."""
from pathlib import Path
import subprocess,hashlib,json,tempfile,shlex,time,os,re
CASE=Path(__file__).resolve().parent.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='formal-native-final-',dir=CASE/'.build'));src=CASE/'shim/formal_native.c';flags=['-std=c11','-O1','-g','-frounding-math','-ffp-contract=off'];records=[];status={'passed':False,'whole_kernel_verified':False,'run_directory':str(r),'scope':'Finite actual28-helper scalar-field C-shim/full modified kernels/public wrapper plus original-vs-compatible RVV bit controls. Not hardware ISA or original-RVV formal proof.','records':records}
 def exe(cmd,label,limit=True,env=None):
  cmd=list(map(str,cmd));cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]if limit else cmd;t=time.monotonic();x=subprocess.run(cmd,cwd=r,capture_output=True,text=True,timeout=1800,env=env);log=r/(label+'.log');log.write_text(x.stdout+x.stderr);records.append({'label':label,'command':cmd,'exit_code':x.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,x.returncode,flush=True)
  if x.returncode:raise RuntimeError(log.read_text()[-4000:])
  return x.stdout
 try:
  deps=exe(['gcc',*flags,'-MM',src],'dependencies');files=set()
  for line in deps.replace('\\\n',' ').splitlines():files.update(shlex.split(line.split(':',1)[1]))
  inventory={str(Path(x).resolve().relative_to(CASE))if Path(x).resolve().is_relative_to(CASE)else os.path.relpath(Path(x).resolve(),CASE):sha(Path(x).resolve())for x in files};assert inventory and all((CASE/k).resolve().is_relative_to(ROOT)for k in inventory)
  ub=r/'native-ubsan';exe(['gcc',*flags,'-fsanitize=undefined','-fno-sanitize-recover=all',src,'-lm','-o',ub],'compile-ubsan');output=exe([ub],'runtime-ubsan',env=dict(os.environ,UBSAN_OPTIONS='halt_on_error=1'));assert 'cases=157086'in output and 'failures=0'in output
  asan=r/'native-asan';exe(['gcc',*flags,'-fsanitize=address','-fno-omit-frame-pointer',src,'-lm','-o',asan],'compile-asan')
  launcher=r/'cgroup-launch.py';launcher.write_text('from pathlib import Path\nimport os,sys\nr=Path("/proc/self/cgroup").read_text().split("0::",1)[1].splitlines()[0]\np=Path("/sys/fs/cgroup")/r.lstrip("/")/"memory.max"\nv=p.read_text().strip()\nprint("actual_memory_max="+v,flush=True)\nassert v=="17179869184"\nos.execv(sys.argv[1],[sys.argv[1]])\n')
  outputa=exe(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','--setenv=ASAN_OPTIONS=detect_leaks=1:halt_on_error=1','/usr/bin/python3',launcher,asan],'runtime-asan-cgroup',False);assert 'actual_memory_max=17179869184'in outputa and 'cases=157086'in outputa and 'failures=0'in outputa
  assert all(sha(CASE/k)==v for k,v in inventory.items());status.update(passed=True,ubsan_output=output,asan_output=outputa,current_sources_sha256=inventory,input_sha256=inventory,recursive_input_count=len(inventory),input_identity_unchanged=True,asan_actual_memory_max=17179869184,per_process_memory_GiB=16)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 for p in[r/'status.json',CASE/'proof/formal-native-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',r,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
