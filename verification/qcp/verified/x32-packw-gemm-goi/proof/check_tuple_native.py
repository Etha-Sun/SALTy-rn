#!/usr/bin/env python3
"""Finite native checks for the two actual ordinary tuple bodies."""
from pathlib import Path
import hashlib,json,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='tuple-native-',dir=C/'.build'));snapshot=run/'input'
 files=['shim/tuple_first.c','shim/tuple_record.c','shim/tuple_types.h','proof/native/tuple_regression.c','proof/check_tuple_native.py'];pins={p:sha(C/p)for p in files}
 for p in files:
  dst=snapshot/p;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(C/p,dst)
 records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Finite actual ordinary tuple first-reader and full-record-copy C; no SIMD-kernel proof','run_directory':str(run),'input_sha256':pins,'records':records,'configured_jobs':32,'actual_max_parallel_processes':1,'per_process_memory_GiB':16,'timeout_seconds':1800}
 def execute(label,cmd):
  log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:r=subprocess.run(list(map(str,cmd)),cwd=run,stdout=f,stderr=f,timeout=1800)
  records.append({'label':label,'command':list(map(str,cmd)),'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  text=log.read_text();assert r.returncode==0,text;assert not any(x in text for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']);return text
 try:
  for mode in ['undefined','address']:
   exe=run/mode;execute(mode+'-compile',['prlimit','--as=17179869184:17179869184','--','gcc-12','-std=c11','-O1','-g','-fsanitize='+mode,'-fno-sanitize-recover=all',snapshot/'shim/tuple_first.c',snapshot/'shim/tuple_record.c',snapshot/'proof/native/tuple_regression.c','-o',exe])
   if mode=='address':
    observer="import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
    cmd=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',observer,exe]
   else:cmd=['prlimit','--as=17179869184:17179869184','--',exe]
   text=execute(mode+'-run',cmd);stats=json.loads(text.strip().splitlines()[-1]);assert stats['passed']and stats['cases']==65536 and stats['actual_ordinary_bodies_called']==2
   if mode=='address':assert '"actual_memory_max": "17179869184"'in text and '"actual_memory_swap_max": "0"'in text
  assert pins=={p:sha(C/p)for p in files}
  s.update(passed=True,cases_per_sanitizer=65536,actual_ordinary_bodies=2,actual_ASan_memory_max=17179869184,actual_ASan_memory_swap_max=0,LSan_enabled=True)
 except Exception as error:s['error']=str(error)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');target=C/'proof/tuple-native-status.json'
 if target.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);shutil.copy2(target,history/(target.stem+'-'+sha(target)+'.json'))
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in s.items()if k not in ['input_sha256','records']},indent=2));raise SystemExit(not s['passed'])
if __name__=='__main__':main()
