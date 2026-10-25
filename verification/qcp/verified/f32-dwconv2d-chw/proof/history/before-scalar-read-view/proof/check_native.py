#!/usr/bin/env python3
"""Finite real-C observer replay; source-reviewed emulator is not ISA proof."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,hashlib,json,os,re,shlex,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 a=argparse.ArgumentParser();a.add_argument('--sanitizer',choices=['undefined','address'],default='undefined');args=a.parse_args();run=Path(tempfile.mkdtemp(prefix='native-'+args.sanitizer+'-',dir=C/'.build'));snapshot=run/'input';snapshot.mkdir()
 inputs=['impl/testNEON.c','impl/testRVV.c','shim/propagating.c','shim/propagating_api.h','proof/native/isa_arrays.h','proof/native/regression.c','proof/check_native.py'];pins={p:sha(C/p)for p in inputs}
 for p in inputs:
  target=snapshot/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(C/p,target)
 records=[]
 def execute(label,command,expected=0,runtime=False):
  cmd=list(map(str,command))
  if runtime and args.sanitizer=='address':
   script="import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
   cmd=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',script,*cmd]
  else:cmd=['prlimit','--as=17179869184:17179869184','--',*cmd]
  t=time.monotonic();log=run/(label+'.log')
  with log.open('w')as f:code=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1800).returncode
  records.append({'label':label,'command':cmd,'exit_code':code,'expected_exit_code':expected,'seconds':time.monotonic()-t,'log_sha256':sha(log)})
  text=log.read_text();assert code==expected,(label,code,text[-2000:]);assert not any(x in text for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer'])
  if runtime and args.sanitizer=='address':assert '"actual_memory_max": "17179869184"'in text and '"actual_memory_swap_max": "0"'in text
  return text
 result={'passed':False,'whole_kernel_verified':False,'scope':'Finite original NEON/repaired RVV C through independently distinct vector emulation and scalar fused oracle; no hardware/ISA/formal credit','sanitizer':args.sanitizer,'run_directory':str(run),'input_sha256':pins,'records':records,'configured_jobs':32,'per_process_memory_GiB':16}
 try:
  dep=execute('dependencies',['gcc-12','-std=c11','-MM',snapshot/'proof/native/regression.c']);depfiles=shlex.split(dep.replace('\\\n',' ').split(':',1)[1]);actual={}
  for f in depfiles:
   p=Path(f).resolve();relative=str(p.relative_to(snapshot));assert relative in pins,relative;assert sha(p)==pins[relative];actual[relative]=sha(p)
  result['actual_recursive_local_input_sha256']=actual;result['actual_recursive_local_input_count']=len(actual)
  flags=['gcc-12','-std=c11','-O1','-g','-frounding-math','-fno-fast-math','-ffp-contract=off','-fsanitize='+args.sanitizer,'-fno-sanitize-recover=all']
  for kind,macro,expected in [('correct',[],0),('wrong-one',['-DWRONG_ONE'],2),('wrong-both',['-DWRONG_BOTH'],2)]:
   exe=run/kind;execute('compile-'+kind,[*flags,*macro,snapshot/'proof/native/regression.c','-lm','-o',exe]);text=execute('run-'+kind,[exe],expected,runtime=True)
   if kind=='correct':
    m=re.search(r'passed cases=(\d+) lanes_per_side=(\d+) aliased_cases=(\d+) vl_modes=3 inactive_modes=2',text);assert m;result.update(cases=int(m[1]),lanes_per_side=int(m[2]),aliased_cases=int(m[3]),vl_modes=3,inactive_modes=2)
   else:
    m=re.search(r'neon=(\w+) rvv=(\w+) oracle=(\w+) compare=(\d)',text);assert m
    if kind=='wrong-both':assert m[1]==m[2]and m[1]!=m[3]and m[4]=='1'
    else:assert m[1]!=m[2]and m[4]=='0'
  assert pins=={p:sha(C/p)for p in inputs};result['passed']=True;result['both_wrong_still_equal_oracle_rejected']=True
  if args.sanitizer=='address':result.update(actual_memory_max=17179869184,actual_memory_swap_max=0,LSan_enabled=True)
 except Exception as error:result['error']=str(error);print(error,flush=True)
 (run/'status.json').write_text(json.dumps(result,indent=2)+'\n');target=C/'proof'/('native-'+args.sanitizer+'-status.json')
 if target.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);shutil.copy2(target,history/(target.stem+'-'+sha(target)+'.json'))
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in result.items()if k not in ['input_sha256','records','actual_recursive_local_input_sha256']},indent=2));raise SystemExit(not result['passed'])
if __name__=='__main__':main()
