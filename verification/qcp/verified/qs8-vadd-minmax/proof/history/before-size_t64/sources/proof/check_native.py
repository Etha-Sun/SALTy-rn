#!/usr/bin/env python3
"""Finite raw repaired-C regression against an independent integer oracle."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time,shutil
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='native-',dir=C/'.build'));records=[];files=['shim/native_runtime.h','shim/native_kernel.c','impl/testNEON.c','impl/testRVV.c','proof/semantics.json','proof/coq/Model.v','proof/coq/ShiftFacts.v','proof/check_native.py','proof/repair.patch'];inputs={n:sha(C/n)for n in files};s=dict(passed=False,whole_kernel_verified=False,scope='finite raw repaired C with array-valued instruction runtime; formal scalar-field frontend still required',run_directory=str(r),input_sha256=inputs,records=records)
 def run(label,cmd,expected=0):
  log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=r,stdout=f,stderr=f,timeout=600)
  records.append(dict(label=label,command=list(map(str,cmd)),exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)))
  assert (p.returncode==0)if expected==0 else(p.returncode!=0),label+':'+log.read_text()[-1500:]
  return log.read_text()
 try:
  for variant in ['correct','shared-wrap-bug']:
   work=r/variant;work.mkdir();(work/'impl').mkdir();(work/'shim').mkdir()
   for n in ['testNEON.c','testRVV.c']:shutil.copyfile(C/'impl'/n,work/'impl'/n)
   shutil.copyfile(C/'shim/native_kernel.c',work/'shim/native_kernel.c');text=(C/'shim/native_runtime.h').read_text()
   if variant!='correct':
    target='static int32_t nr_wrap32(int64_t x){';assert text.count(target)==1;text=text.replace(target,target+'return 0;')
   (work/'shim/native_runtime.h').write_text(text);exe=work/'test'
   run(variant+'-compile',['gcc','-std=c11','-O1','-g','-fsanitize=undefined','-fno-sanitize-recover=all',work/'shim/native_kernel.c','-o',exe]);output=run(variant+'-run',[exe],0 if variant=='correct' else 1)
   if variant=='correct':
    m=re.search(r'passed calls=(\d+) lanes_per_side=(\d+)',output);assert m;s.update(cases=int(m[1]),lanes_per_side=int(m[2]),all256_controls=True,offset_canaries=True,unordered_bounds_sampled=True)
   else:
    m=re.search(r'expected=(-?\d+) neon=(-?\d+) rvv=(-?\d+)',output);assert m and m[2]==m[3] and m[1]!=m[2];s['shared_wrong_wrap_rejected']=True
  assert inputs=={n:sha(C/n)for n in files};s['passed']=True
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/native-status.json'
 if dest.exists():(C/'proof/history'/('native-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','cases','lanes_per_side','shared_wrong_wrap_rejected','run_directory','error']},indent=2));return0=0 if s['passed'] else 1;return return0
if __name__=='__main__':raise SystemExit(main())
