#!/usr/bin/env python3
"""Generate exact-token repaired RVV loop goals with the public contract."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time
from generate_neon import PARAMS,param_cells,BOUNDS,tokens
C=Path(__file__).resolve().parent.parent;NS='Qs8Add';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def state(entry=False,vl=False):
 n='batch@pre';k='(batch@pre-batch)';v='qa_values('+','.join([k,'Az','Bz','Ma','Mb','RawShift','Oz','Lo','Hi','A','B'])+')';pure=[f'Zlength(A)=={n}+7',f'Zlength(B)=={n}+7','sizeof(int8_t)==1',f'0<{n}',f'{n}<=18446744073709551608','0<=batch',f'batch<={n}',f'0<={k}','params==params@pre','params!=0',BOUNDS]
 if entry:pure+=['batch%sizeof(int8_t)==0','input_a!=0','input_b!=0','output!=0','batch==batch@pre','input_a==input_a@pre','input_b==input_b@pre','output==output@pre']
 else:
  pure+=[f'input_a==input_a@pre+{k}',f'input_b==input_b@pre+{k}',(f'output==output@pre+{k}'if vl else f'((batch>0 && output==output@pre+{k}) || batch==0)')]
  pure +=[f'{cvar}=={ghost}'for cvar,ghost in [('a_zero_point','Az'),('b_zero_point','Bz'),('a_multiplier','Ma'),('b_multiplier','Mb'),('right_shift','qa_ctrl(RawShift)'),('output_zero_point','Oz'),('output_min','Lo'),('output_max','Hi')]]
 if vl:pure+=['0<batch','vl==qa_vl(batch)','0<vl','vl<=32','vl<=batch']
 heap=[f'CharArray::full(input_a@pre,{n}+7,A)',f'CharArray::full(input_b@pre,{n}+7,B)']
 if entry:heap +=['CharArray::undef_full(output,batch)']
 else:heap +=[f'CharArray::full(output@pre,{k},{v})','CharArray::undef_full(output,batch)']
 heap+=param_cells();return ' && '.join(pure)+' && '+' * '.join(heap)
def construct():
 raw=(C/'impl/testRVV.c').read_text();repair=json.loads((C/'proof/repair.json').read_text());assert sha(C/'impl/testRVV.c')==repair['repaired_rvv_sha256'];spec=(C/'spec.c').read_text();contract=re.search(r'/\*@.*?\*/',spec[spec.index('void test_rvv('):],re.S)[0];s=raw.replace('\n{','\n'+contract+'\n{',1);entry='/*@ Assert '+state(entry=True)+' */';inv='/*@ Inv Assert '+state()+' */';cut='/*@ Assert '+state(vl=True)+' */';s=s.replace('  assert(batch != 0);',entry+'\n  assert(batch != 0);',1);assert s.count('  while (batch > 0)')==1;s=s.replace('  while (batch > 0)',inv+'\n  while (batch > 0)',1);anchor='    size_t vl = __riscv_vsetvl_e8m2(batch);';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n'+cut,1)
 bind=[]
 # All vector arguments here are frozen simple variables; real by-value C
 # copies are the ordinary QCP frontend semantics, with exact named bindings.
 patterns={'__riscv_vwsub_vx_i16m4':['a'],'__riscv_vsext_vf2_i32m8':['a'],'__riscv_vmul_vx_i32m8':['a'],'__riscv_vmacc_vx_i32m8':['a',None,'c'],'__riscv_vssra_vx_i32m8':['a'],'__riscv_vsll_vx_i32m8':['a'],'__riscv_vnclip_wx_i16m4':['a'],'__riscv_vsadd_vx_i16m4':['a'],'__riscv_vnclip_wx_i8m2':['a'],'__riscv_vmax_vx_i8m2':['a'],'__riscv_vmin_vx_i8m2':['a']}
 edits=[]
 for m in re.finditer(r'\b('+ '|'.join(patterns)+r'|__riscv_vle8_v_i8m2)\s*\(',s):
  start=m.end();depth=1;i=start
  while depth:depth+=(s[i]=='(')-(s[i]==')');i+=1
  inner=s[start:i-1];args=[];d=0;last=0
  for j,ch in enumerate(inner):
   d+=(ch=='(')-(ch==')')
   if ch==','and d==0:args.append(inner[last:j].strip());last=j+1
  args.append(inner[last:].strip());name=m[1]
  if name=='__riscv_vle8_v_i8m2':
   assert args in [['input_a','vl'],['input_b','vl']];var=args[0];mapping=f'base={var}@pre,count=batch@pre+7,idx=batch@pre-batch,L='+('A'if var=='input_a'else'B')
  else:
   mapping=[]
   for j,key in enumerate(patterns[name]):
    if key is not None:assert re.fullmatch(r'\w+',args[j]);mapping.append(key+'=&'+args[j])
   mapping=','.join(mapping)
  edits.append((i,' /*@ where '+mapping+' */'));bind.append(dict(function=name,arguments=args,where=mapping))
 for pos,text in sorted(edits,reverse=True):s=s[:pos]+text+s[pos:]
 assert tokens(raw)==tokens(s);return raw,s,dict(entry_cut=entry,invariant=inv,after_setvl_cut=cut,where=bind)
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--timeout',type=int,default=1800);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=C/'.build'));raw,ann,record=construct();(C/'proof/c/rvv.annotations.json').write_text(json.dumps(record,indent=2)+'\n');prefix='#include "'+str(C/'shim/rvv_frontend.h')+'"\n'
 for label,text in [('original',raw),('rvv_unit',ann)]:
  src=r/(label+'.input.c');src.write_text(prefix+text);dst=r/(label+'.c');p=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',src,'-o',dst],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=60);(r/(label+'-cpp.log')).write_text(p.stdout);assert not p.returncode,p.stdout
 assert tokens((r/'original.c').read_text())==tokens((r/'rvv_unit.c').read_text());cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/'rvv_unit.c'),'--coq-output-dir='+str(r),'--coq-logic-path='+NS,'-slp',str(C/'shim'),NS,'-slp',str(C/'proof/c'),NS];work=r/'qcp-work';work.mkdir();t=time.monotonic()
 with(r/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=r/'rvv_unit_goal.v';s=dict(generation_passed=code==0,whole_kernel_verified=False,run_directory=str(r),command=cmd,exit_code=code,seconds=time.monotonic()-t,raw_c_sha256=sha(C/'impl/testRVV.c'),same_frontend_cpp_tokens_identical=True,generated_c_vcs=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0)
 for p in [r/'status.json',C/'proof/rvv-generation-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print(json.dumps(s,indent=2),flush=True)
 if code:print((r/'qcp.log').read_text()[-4500:],flush=True)
 return code
if __name__=='__main__':raise SystemExit(main())
