#!/usr/bin/env python3
"""Generate the ordinary borrowed-adapter C bodies, preserving all evidence."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--first-only',action='store_true');args=parser.parse_args();stem='tuple_first'if args.first_only else'tuple_copy'
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='tuple-copy-generation-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),C/'shim/tuple_copy.c',C/'shim/tuple_types.h']
 inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='ordinary_C_borrowed_consumer_body_goal_generation_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(C/'shim/tuple_copy.c'),'-o',str(run/(stem+'.c'))]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(gen),'--coq-logic-path=X32Packw','-slp',str(C/'shim'),'X32Packw'])]:
   cmd=['prlimit','--as=17179869184:17179869184','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   if label=='cpp'and args.first_only:
    expanded=run/(stem+'.c');text=expanded.read_text();needle='uint32x2x2_t pw_tuple_copy(';assert text.count(needle)==1;expanded.write_text(text.split(needle)[0])
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));assert ec==0,log.read_text()[-2500:]
  goal=gen/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
  assert inputs=={n:sha(C/n)for n in inputs};assert fields
  s.update(passed=True,fields=fields,actual_C_fields=len(fields),goal_sha256=sha(goal));(C/'proof/coq'/goal.name).write_bytes(goal.read_bytes())
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof'/('tuple-first-generation-status.json'if args.first_only else'tuple-copy-generation-status.json')
 if out.exists():(C/'proof/history').mkdir(exist_ok=True);(C/'proof/history'/('tuple-copy-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
