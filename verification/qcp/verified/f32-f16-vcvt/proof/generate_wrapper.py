#!/usr/bin/env python3
"""Fresh full public read/observation/comparator/caller TU from live spec.c."""
from pathlib import Path
import importlib.util,json,re,hashlib,subprocess,tempfile,time
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def wrapper_text():
 spec=(C/'spec.c').read_text();needle=' test_neon(n*sizeof(float),input,left,params);'
 first='/*@ Assert sizeof(float) == 4 && n == (n*sizeof(float))/4 && (n*sizeof(float))%4 == 0 &&\n 0 < n*sizeof(float) && n*sizeof(float) <= 18446744073709551615 &&\n n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&\n 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&\n FloatArray::full(input,n+3,A) * UShortArray::undef_full(left,n) * UShortArray::undef_full(right,n) */'
 assert spec.count(needle)==1;out=spec.replace(needle,first+'\n'+needle);out='#include \"'+str(C/'shim/program_model.h')+'\"\n/*@ include strategies \"rvv_arrays.strategies\" */\n/*@ include strategies \"f16_memory.strategies\" */\n/*@ include strategies \"f16_public.strategies\" */\n'+out
 return spec,out,{'equivalent':[{'before':needle,'text':first}]}
def main():
 run=Path(tempfile.mkdtemp(prefix='wrapper-',dir=C/'.build'));raw,text,patches=wrapper_text();(H/'c/wrapper.annotations.json').write_text(json.dumps(patches,indent=2)+'\n');records=[];s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'public_spec_sha256':sha(C/'spec.c'),'records':records}
 def execute(cmd,label,budget=1800):
  cmd=list(map(str,cmd));log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=run,stdout=f,stderr=f,timeout=budget)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'command':cmd,'label':label,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 try:
  for n,body in [('raw',raw),('wrapper_unit',text)]:
   p=run/(n+'.raw.c');p.write_text(body);assert execute(['gcc','-E','-P','-CC','-nostdinc','-I',C,p,'-o',run/(n+'.c')],n+'-cpp',60)==0
  def tokens(t):return re.findall(r'\w+|[^\w\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
  assert tokens((run/'raw.c').read_text())==tokens((run/'wrapper_unit.c').read_text())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'wrapper_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=F32F16','-slp',str(C/'shim'),'F32F16','-slp',str(H/'c'),'F32F16']
  for d in sorted((B/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',str(d),d.name]
  assert execute(cmd,'qcp')==0,'actual public C QCP failed';p=run/'wrapper_unit_goal.v';fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',p.read_text(),re.M);assert fs;s.update(generation_passed=True,actual_c_fields=len(fs),fields=fs,goal_sha256=sha(p),cpp_sha256=sha(run/'wrapper_unit.c'),same_frontend_cpp_tokens_preserved=True);__import__('shutil').copyfile(p,H/'coq/wrapper_unit_goal.v')
 except Exception as e:s['error']=str(e)
 (run/'generation-status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'wrapper-generation-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['generation_passed'] else 1)
if __name__=='__main__':main()
