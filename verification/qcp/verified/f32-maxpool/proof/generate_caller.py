#!/usr/bin/env python3
"""Generate the actual ordinary caller for any written output address."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--prepare-only',action='store_true');a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='caller-generation-',dir=C/'.build'));g=r/'generated';g.mkdir();files=['spec.c','proof/generate_caller.py','shim/kernel_contracts.h','shim/compare.h','shim/compare_intrinsic_specs.h','shim/neon_specs.h','shim/formal_model.h','shim/formal_types.h','shim/params.h']+['proof/coq/'+n+'.v'for n in ['Bits','Model','Types','MemoryModel','MemoryViews','PackModel','ProgramModel','ContractModel','KernelState','WindowFacts','WriteFacts','CompareTypes','CompareModel','StateObservation','TraceLookup']];inputs={x:sha(C/x)for x in files};records=[];s=dict(generation_passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records,observation='Any actualwritten address; independent arbitrary initial output states and unchanged unwritten-frame relation are proved by StateObservation/TraceLookup. Actualbody closure is still required.')
 env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def run(label,cmd,timeout):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:cp=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=timeout)
  records.append(dict(label=label,command=cmd,exit_code=cp.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert cp.returncode==0,log.read_text()[-2000:]
 try:
  src=r/'caller.in.c';src.write_text('#include "'+str(C/'shim/compare_intrinsic_specs.h')+'"\n#define restrict\n#include "'+str(C/'spec.c')+'"\n');run('cpp',['gcc','-E','-P','-CC','-nostdinc',src,'-o',r/'caller.c'],120)
  if not a.prepare_only:
   run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'caller.c'),'--coq-output-dir='+str(g),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'],7200);goal=g/'caller_goal.v';text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert fields
   defs=list(re.finditer(r'(?m)^Definition (\w+)\s*:=',text));bad=[]
   for i,m in enumerate(defs):
    b=text[m.end():defs[i+1].start()if i+1<len(defs)else text.index('Module Type VC_Correct')]
    if'|--'in b and len(re.findall(r'\bmp_out\s',b.split('|--',1)[0]))>1:bad.append(m[1])
   assert not bad,('Duplicate output ownership in actualprecondition',bad)
   assert inputs=={x:sha(C/x)for x in inputs};s.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/'caller.c'),duplicate_owner_first_pre_screen=bad)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if s['generation_passed']or a.prepare_only and'error'not in s else 1
if __name__=='__main__':raise SystemExit(main())
