#!/usr/bin/env python3
"""Generate the original RVV kernel with explicit proof-only annotations."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--budget',type=int,choices=[300,600,1200],default=300);parser.add_argument('--diagnostics',action='store_true');args=parser.parse_args()
 original=CASE/'impl/testRVV.c';expected='cc6c77956d0bbcc16d0ab84f78cc35c195634e25b6c02b9f2fd465b8c3c13486'
 assert sha(original)==expected and original.read_bytes()==(ROOT/'kernels/target/f32-vcmul.c').read_bytes(),'Unknown original shape'
 run=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=CASE/'.build'));records=[]
 public=(CASE/'spec.c').read_text();at=public.index(' test_rvv(');begin=public.index('/*@',at);contract=public[begin:public.index('*/',begin)+2]
 text=original.read_text();assert text.count('\n{')==1;text=text.replace('\n{','\n'+contract+'\n{',1)
 n='batch@pre/4';total='batch@pre/2+3'
 pure=f'''fp32_length(A)=={total} && fp32_length(B)=={total} &&
0<batch@pre && batch@pre<=9223372036854775788 && batch@pre%4==0 &&
batch==batch@pre && 0<=k && 0<=n && n<={n} && k+n=={n} &&
input_a==input_a@pre && input_b==input_b@pre && output==output@pre && params==params@pre &&
input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
ar==input_a@pre+k && ai==input_a@pre+{n}+k &&
br==input_b@pre+k && bi==input_b@pre+{n}+k &&
out_r==output@pre+k && out_i==output@pre+{n}+k &&
ar!=0 && ai!=0 && br!=0 && bi!=0 && out_r!=0 && out_i!=0'''
 heaps=[f'FloatArray::full(input_a@pre,{total},A)',f'FloatArray::full(input_b@pre,{total},B)',
 'store(&(params->_),char,p)',f'FloatArray::full(output@pre,k,complex_real_prefix(k,{n},A,B))',
 'FloatArray::undef_full(out_r,n)',f'FloatArray::full(output@pre+{n},k,complex_imag_prefix(k,{n},A,B))','FloatArray::undef_full(out_i,n)']
 inv='/*@ Inv Assert exists (k:Z),\n'+pure+' &&\n'+' *\n'.join(heaps)+' */'
 patches=[{'before':'  while (n > 0)','text':inv}]
 assert text.count('  while (n > 0)')==1;text=text.replace('  while (n > 0)',inv+'\n  while (n > 0)',1)
 split_heaps=heaps[:4]+['FloatArray::undef_full(out_r,vl)','FloatArray::undef_full(out_r+vl,n-vl)',heaps[5],'FloatArray::undef_full(out_i,vl)','FloatArray::undef_full(out_i+vl,n-vl)']
 split='/*@ Assert exists (k:Z),\n'+pure+' && n>0 && 0<vl && vl<=n && vl<=16 && vl==vcmul_vl16(n) &&\n'+' *\n'.join(split_heaps)+' */'
 anchor='    vfloat32m4_t var =';assert text.count(anchor)==1;text=text.replace(anchor,split+'\n'+anchor,1);patches.append({'before':anchor,'text':split})
 bindings={
 '__riscv_vle32_v_f32m4(ar, vl)':'base=input_a,count=batch/2+3,idx=batch/4-n,L=A',
 '__riscv_vle32_v_f32m4(ai, vl)':'base=input_a,count=batch/2+3,idx=batch/4+batch/4-n,L=A',
 '__riscv_vle32_v_f32m4(br, vl)':'base=input_b,count=batch/2+3,idx=batch/4-n,L=B',
 '__riscv_vle32_v_f32m4(bi, vl)':'base=input_b,count=batch/2+3,idx=batch/4+batch/4-n,L=B',
 '__riscv_vfmul_vv_f32m4(var, vbr, vl)':'a=&var,b=&vbr',
 '__riscv_vfmul_vv_f32m4(var, vbi, vl)':'a=&var,b=&vbi',
 '__riscv_vfmul_vv_f32m4(vai, vbi, vl)':'a=&vai,b=&vbi',
 '__riscv_vfsub_vv_f32m4(vaccr, temp_r, vl)':'a=&vaccr,b=&temp_r',
 '__riscv_vfmul_vv_f32m4(vai, vbr, vl)':'a=&vai,b=&vbr',
 '__riscv_vfadd_vv_f32m4(vacci, temp_i, vl)':'a=&vacci,b=&temp_i',
 '__riscv_vse32_v_f32m4(out_r, vaccr, vl)':'a=&vaccr',
 '__riscv_vse32_v_f32m4(out_i, vacci, vl)':'a=&vacci'}
 for anchor,binding in bindings.items():
  expected_count=1
  assert text.count(anchor)==expected_count,'Unknown call shape '+anchor
  annotation='/*@ where '+binding+' */';text=text.replace(anchor,anchor+' '+annotation);patches.append({'after':anchor,'occurrences':expected_count,'text':annotation})
 assert tokens(text)==tokens(original.read_text()),'Executable source changed'
 (HERE/'c/rvv.annotations.json').write_text(json.dumps(patches,indent=2)+'\n')
 prefix='#include "'+str(CASE/'shim/rvv_frontend.h')+'"\n'
 (run/'rvv_unit.c').write_text(prefix+text);(run/'original.c').write_text(prefix+original.read_text())
 status={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'budget_seconds':args.budget,'diagnostics':args.diagnostics,'original_sha256':expected,'public_spec_sha256':sha(CASE/'spec.c')}
 input_files=[CASE/'impl/testRVV.c',CASE/'spec.c',HERE/'coq/Model.v',HERE/'coq/ComplexModel.v',HERE/'c/rvv.annotations.json',HERE/'c/neon_vcmul.strategies',HERE/'coq/RvvMemoryModel.v',HERE/'coq/RvvStoreModel.v',Path(__file__)]+[CASE/'shim'/name for name in ['types.h','primitives.h','rvv_memory.h','rvv_memory_def.h','rvv_store.h','rvv_store_def.h','rvv_frontend.h','model_def.h']]
 status['live_sources_sha256']={str(path.relative_to(CASE)):sha(path) for path in input_files}
 def execute(cmd,label,timeout=300):
  cmd=[shutil.which('prlimit'),'--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic();log=run/(label+'.log')
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'command':cmd,'label':label,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 try:
  for name in ['rvv_unit','original']:execute(['gcc','-E','-P','-CC','-nostdinc',run/(name+'.c'),'-o',run/(name+'_expanded.c')],name+'-cpp')
  assert tokens((run/'rvv_unit_expanded.c').read_text())==tokens((run/'original_expanded.c').read_text()),'Frontend CPP executable tokens changed'
  (run/'rvv_unit.c').write_bytes((run/'rvv_unit_expanded.c').read_bytes())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'rvv_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=VCMul']
  for folder in sorted((BASE/'proof/c').iterdir()):cmd+=['-slp',folder,folder.name]
  cmd+=['-slp',HERE/'c','VCMul']
  if args.diagnostics:
   cmd.remove('--no-exec-info');cmd+=['--Auto-VC-Checking',run/'solver.log']
  execute(cmd,'qcp',args.budget)
  goal=run/'rvv_unit_goal.v';names=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
  status.update(generation_passed=True,generated_c_vcs=len(names),goal_sha256=sha(goal),cpp_sha256=sha(run/'rvv_unit.c'),original_and_cpp_tokens_identical=True)
 except Exception as error:status['error']=str(error);print(error,flush=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'rvv-generation-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if status['generation_passed'] else 1
if __name__=='__main__':raise SystemExit(main())
