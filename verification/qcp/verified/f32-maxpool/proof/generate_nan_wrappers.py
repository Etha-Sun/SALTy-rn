#!/usr/bin/env python3
"""Independent actual four-wrapper unit, ordinary propagation callee pending.

No classification-body or whole-kernel credit is granted by this generation.
The original five-body generation and its immutable inputs are untouched.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
from full_inputs import CASE as C,annotated_propagate,sha,tokens
from coverage import _mask_comments
def wrapper_source():
 source=annotated_propagate();masked=_mask_comments(source);parts=[]
 for name in ['mp_max_vv','mp_min_vv','mp_max_vf','mp_min_vf']:
  matches=list(re.finditer(r'(?m)^vfloat32m8_t\s+'+name+r'\(',masked));assert len(matches)==1
  start=matches[0].start();body=masked.index('{',matches[0].end());end=body+1;depth=1
  while depth:
   depth+=(masked[end]=='{')-(masked[end]=='}');end+=1
  parts.append(source[start:end])
 return '#include "shim/rvv_arithmetic_specs.h"\n#include "shim/propagate_specs.h"\n'+'\n'.join(parts)+'\n'
def main():
 p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='nan-wrappers-generation-',dir=C/'.build'));g=r/'generated';g.mkdir();records=[]
 files=['proof/generate_nan_wrappers.py','proof/full_inputs.py','proof/coverage.py','proof/generate_kernel.py','proof/generate_rvv.py','shim/propagate.c','shim/propagate_specs.h','shim/rvv_arithmetic_specs.h','shim/formal_types.h','shim/formal_model.h']+['proof/coq/'+n+'.v'for n in ['Bits','Model','Types','VectorModel']];inputs={n:sha(C/n)for n in files};s=dict(generation_passed=False,whole_kernel_verified=False,ordinary_propagate_body_pending=True,run_directory=str(r),records=records,input_sha256=inputs)
 env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def run(label,cmd,mem):
  cmd=['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,memory_GiB=mem,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert code==0,log.read_text()[-2500:]
 try:
  p=r/'nan_wrappers.in.c';p.write_text(wrapper_source());run('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C,'-I',C/'shim',p,'-o',r/'nan_wrappers.c'],16)
  run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/'nan_wrappers.c'),'--coq-output-dir='+str(g),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'],32)
  goal=g/'nan_wrappers_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;assert inputs=={n:sha(C/n)for n in inputs};s.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/'nan_wrappers.c'))
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/nan-wrappers-generation-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if s['generation_passed']else 1
if __name__=='__main__':raise SystemExit(main())
