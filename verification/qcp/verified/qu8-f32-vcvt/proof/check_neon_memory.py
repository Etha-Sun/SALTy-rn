#!/usr/bin/env python3
"""Compile all67 actual memory fields with explicit checked core dependencies."""
from pathlib import Path
import argparse,json,shutil,subprocess,tempfile,time,hashlib,re,concurrent.futures
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--calls-run',type=Path,required=True);p.add_argument('--timeout',type=int,default=3600);p.add_argument('--jobs',type=int,default=16);a=p.parse_args();calls=a.calls_run.resolve();assert (calls/'coq/neon_unit_goal.vo').is_file()
 run=Path(tempfile.mkdtemp(prefix='neon-memory-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();old=json.loads((calls/'records.json').read_text());template=next(r['command']for r in old if r['label']=='neon_unit_goal');flags=template[:-1]+['-Q',str(coq),'Qu8Cvt'];records=[]
 s={'passed':False,'whole_kernel_verified':False,'scope':'All67 actual NEON memory fields only; explicit checked core reused, full-case fresh replay remains mandatory.','run_directory':str(run),'calls_run':str(calls),'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'records':records}
 modules=['NeonMemorySupport','NeonStep','NeonLoop','NeonMemoryTactics']+[f'NeonMemoryPart{i:02}'for i in range(16)]+['NeonMemory']
 for n in modules:shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
 def cc(n):
  w=run/'jobs'/n;w.mkdir(parents=True);cmd=flags+[str(coq/(n+'.v'))];log=run/(n+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=w,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  r={'label':n,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)};records.append(r);print(n,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-4000:])
 try:
  cc('NeonMemorySupport');cc('NeonStep');cc('NeonMemoryTactics')
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
   tasks=[pool.submit(cc,'NeonLoop')]+[pool.submit(cc,f'NeonMemoryPart{i:02}')for i in range(16)if i!=2]
   for t in tasks:t.result()
  cc('NeonMemoryPart02');cc('NeonMemory');log=(run/'NeonMemory.log').read_text();prints=len(re.findall(r'^(?:Axioms:|Closed under the global context)',log,re.M));assert prints==67
  for n in modules:assert (coq/(n+'.v')).read_bytes()==(HERE/'coq'/(n+'.v')).read_bytes()
  s.update(passed=True,partial_interface_checked=True,actual_c_fields=67,print_assumptions=prints,input_sha256={str((HERE/'coq'/(n+'.v')).relative_to(CASE)):sha(HERE/'coq'/(n+'.v'))for n in modules})
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  for p in[run/'status.json',HERE/'neon-memory-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
