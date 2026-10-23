#!/usr/bin/env python3
from pathlib import Path
import argparse,json,tempfile,shutil,subprocess,time,hashlib,re
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--calls-run',type=Path,required=True);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();calls=a.calls_run.resolve();assert(calls/'coq/rvv_unit_goal.vo').is_file();r=Path(tempfile.mkdtemp(prefix='rvv-memory-',dir=CASE/'.build'));coq=r/'coq';coq.mkdir();records=[];flags=next(x['command']for x in json.loads((calls/'records.json').read_text())if x['label']=='KernelBounds')[:-1]+['-Q',str(coq),'Qu8Cvt'];s={'passed':False,'whole_kernel_verified':False,'run_directory':str(r),'calls_run':str(calls),'records':records,'scope':'Five fully qualified actual RVV memory-field proofs with explicit core reuse; full fresh case gate still mandatory.'}
 try:
  for n in['UnsignedProgramFacts','RvvResult','RvvMemory']:
   p=coq/(n+'.v');shutil.copyfile(HERE/'coq'/p.name,p);w=r/n;w.mkdir();cmd=flags+[str(p)];log=r/(n+'.log');t=time.monotonic()
   with log.open('w')as f:
    try:code=subprocess.run(cmd,cwd=w,stdout=f,stderr=f,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:code=124
   records.append({'label':n,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'source_sha256':sha(p),'log_sha256':sha(log)});print(n,code,flush=True)
   if code:raise RuntimeError(log.read_text()[-5000:])
  assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(r/'RvvMemory.log').read_text(),re.M))==5
  s.update(passed=True,partial_interface_checked=True,actual_c_fields=5,print_assumptions=5,input_sha256={str((HERE/'coq'/(n+'.v')).relative_to(CASE)):sha(HERE/'coq'/(n+'.v'))for n in['UnsignedProgramFacts','RvvResult','RvvMemory']})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 for p in[r/'status.json',HERE/'rvv-memory-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',r,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
