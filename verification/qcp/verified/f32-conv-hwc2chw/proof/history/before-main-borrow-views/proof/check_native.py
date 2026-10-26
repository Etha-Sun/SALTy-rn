#!/usr/bin/env python3
from pathlib import Path
import argparse,json,hashlib,subprocess,tempfile,shutil,os,re,shlex,time
C=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--sanitizer',choices=['undefined','address'],default='undefined');ap.add_argument('--original',action='store_true');ap.add_argument('--quick',action='store_true');a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='native-'+('original-'if a.original else'current-')+a.sanitizer+'-',dir=C/'.build'));work=run/'case';work.mkdir();files=['proof/check_native.py','proof/native/harness.c','proof/native/runtime.h','proof/native/extra.h','shim/support.c','shim/copy_float.c','shim/copy_float.h','shim/nan_helpers.c','shim/nan_helpers.h','shim/neon3_helpers.c','shim/neon3_helpers.h','impl/testNEON.c','impl/testRVV.c','proof/original/testRVV.c'];inputs={f:sha(C/f)for f in files}
 for f in files:p=work/f;p.parent.mkdir(exist_ok=True,parents=True);shutil.copyfile(C/f,p)
 records=[];state={'passed':False,'whole_kernel_verified':False,'scope':'Finite independent scalar source-order oracle against both actual C kernels in separately defined Arm/RVV instruction emulation; no physical ISA execution or formal proof credit','run_directory':str(run),'input_sha256':inputs,'sanitizer':a.sanitizer,'original_rvv':a.original,'quick':a.quick,'configured_jobs':32,'max_live_processes':1,'per_process_memory_GiB':16,'records':records}
 env={**os.environ};env.pop('HWC_NEGATIVE',None);env.pop('HWC_QUICK',None)
 if a.quick:env['HWC_QUICK']='1'
 cgroup=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',"import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"]
 def execute(label,cmd,runenv,runtime=False):
  cmd=list(map(str,cmd));cmd=['env',*[k+'='+runenv[k]for k in ['HWC_NEGATIVE','HWC_QUICK']if k in runenv],*cmd]if runtime else cmd;cmd=[*cgroup,*cmd]if runtime and a.sanitizer=='address'else['prlimit','--as=17179869184:17179869184','--',*cmd];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=work,env=runenv,stdout=f,stderr=f,timeout=3600)
  rec={'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)};records.append(rec);print(label,r.returncode,flush=True);return r.returncode,log.read_text()
 try:
  flags=['-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fno-strict-aliasing','-fno-omit-frame-pointer','-fno-sanitize-recover=all','-fsanitize='+('address,undefined'if a.sanitizer=='address'else'undefined')]+(['-DHWC_ORIGINAL_RVV']if a.original else[])
  depcmd=['gcc',*flags,'-MM',str(work/'proof/native/harness.c')];dep=subprocess.run(depcmd,cwd=work,env=env,capture_output=True,text=True,timeout=60);assert dep.returncode==0,dep.stderr;(run/'dependencies.mk').write_text(dep.stdout);local={}
  for f in shlex.split(dep.stdout.replace('\\\n',' '))[1:]:
   p=Path(f).resolve();assert p.is_relative_to(work),str(p);rel=str(p.relative_to(work));assert rel in files,rel;local[rel]=sha(p)
  state.update(actual_recursive_local_input_sha256=local,actual_recursive_local_input_count=len(local),dependency_command=depcmd)
  code,out=execute('compile',['gcc',*flags,work/'proof/native/harness.c','-lm','-o',work/'test'],env);assert code==0,out[-2000:];state['executable_sha256']=sha(work/'test')
  code,out=execute('correct',[work/'test'],env,True)
  if a.original:
   assert code==2 and'mismatch'in out,out[-3000:];state.update(passed=True,original_counterexample=True,counterexample_log=str(run/'correct.log'),counterexample=out[-3000:])
  else:
   assert code==0,out[-3000:];m=re.findall(r'^\{.*"failures":0\}$',out,re.M);assert len(m)==1;state.update(json.loads(m[0]))
   if a.sanitizer=='address':assert '"actual_memory_max": "17179869184"'in out and'"actual_memory_swap_max": "0"'in out;state.update(actual_memory_max=17179869184,actual_memory_swap_max=0,LSan_enabled=True)
   neg=[]
   for n in [1,2]:
    ne={**env,'HWC_NEGATIVE':str(n),'HWC_QUICK':'1'};code,out=execute('wrong-'+str(n),[work/'test'],ne,True);assert code==2 and 'mismatch'in out,out[-3000:];assert not any(x in out for x in ['AddressSanitizer','LeakSanitizer','runtime error:']),out[-3000:]
    mm=re.search(r'N=([0-9a-f]+) R=([0-9a-f]+) O=([0-9a-f]+)',out);assert mm
    if n==2:assert mm[1]==mm[2] and mm[1]!=mm[3],mm.groups()
    neg.append({'kind':'wrong-both-same'if n==2 else'wrong-one','exit_code':code,'oracle_rejected':True,'log_sha256':sha(run/('wrong-'+str(n)+'.log'))})
   state.update(passed=True,negative_controls=neg)
  assert inputs=={f:sha(C/f)for f in files},'current inputs changed during replay'
 except Exception as e:state['error']=str(e)
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');name='original-native-counterexample-status.json'if a.original else'native-'+a.sanitizer+'-status.json';dest=C/'proof'/name
 if dest.exists():hist=C/'proof/history/native';hist.mkdir(exist_ok=True,parents=True);shutil.copyfile(dest,hist/(sha(dest)+'-'+name))
 dest.write_bytes((run/'status.json').read_bytes());print(run);raise SystemExit(0 if state['passed']else 1)
if __name__=='__main__':main()
