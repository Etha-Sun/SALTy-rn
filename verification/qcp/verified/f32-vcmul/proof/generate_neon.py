#!/usr/bin/env python3
"""Generate the original NEON kernel with explicit proof-only annotations."""
import argparse,hashlib,json,re,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--budget',type=int,choices=[300,600,1200],default=300);parser.add_argument('--diagnostics',action='store_true');args=parser.parse_args()
 original=CASE/'impl/testNEON.c';expected='7423e0c197640edfd66522ce2909e9e3e22571ee23c015b7feea32651b661294'
 assert sha(original)==expected and original.read_bytes()==(ROOT/'kernels/source/f32-vcmul.c').read_bytes(),'Unknown original shape'
 run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=CASE/'.build'));records=[]
 public=(CASE/'spec.c').read_text();at=public.index(' test_neon(');begin=public.index('/*@',at);contract=public[begin:public.index('*/',begin)+2]
 text=original.read_text();assert text.count('\n{')==1;text=text.replace('\n{','\n'+contract+'\n{',1)
 n='batch@pre/4';total='batch@pre/2+3'
 pure=f'''fp32_length(A)=={total} && fp32_length(B)=={total} &&
0<batch@pre && batch@pre<=9223372036854775788 && batch@pre%4==0 &&
0<=k && k*4+batch==batch@pre && 0<=batch && batch<=batch@pre && batch%4==0 && k<={n} &&
{n}-k==batch/4 &&
(batch==0 || (batch==4 && batch/4==1) || (batch==8 && batch/4==2) ||
 (batch==12 && batch/4==3) || (16<=batch && 4<=batch/4)) &&
input_a==input_a@pre && input_b==input_b@pre && output==output@pre && params==params@pre &&
input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
ar==input_a@pre+k && ai==input_a@pre+{n}+k &&
br==input_b@pre+k && bi==input_b@pre+{n}+k &&
or==output@pre+k && oi==output@pre+{n}+k &&
ar!=0 && ai!=0 && br!=0 && bi!=0 && or!=0 && oi!=0'''
 heaps=[]
 for base,L in [('input_a','A'),('input_b','B')]:
  heaps.append(f'FloatArray::full({base}@pre,{total},{L})')
 heaps += ['store(&(params->_),char,p)',f'FloatArray::full(output@pre,k,complex_real_prefix(k,{n},A,B))',f'FloatArray::undef_full(or,{n}-k)',f'FloatArray::full(output@pre+{n},k,complex_imag_prefix(k,{n},A,B))',f'FloatArray::undef_full(oi,{n}-k)']
 inv='/*@ Inv Assert exists (k:Z),\n'+pure+' &&\n'+' *\n'.join(heaps)+' */'
 patches=[{'before':'  for (;','text':inv}]
 assert text.count('  for (;')==1;text=text.replace('  for (;',inv+'\n  for (;',1)
 bindings={
 'vld1q_f32(ar)':'base=input_a,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=A',
 'vld1q_f32(ai)':'base=input_a,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=A',
 'vld1q_f32(br)':'base=input_b,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=B',
 'vld1q_f32(bi)':'base=input_b,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=B',
 'vmulq_f32(var, vbr)':'a=&var,b=&vbr','vmulq_f32(var, vbi)':'a=&var,b=&vbi',
 'vmlsq_f32(vaccr, vai, vbi)':'a=&vaccr,b=&vai,c=&vbi','vmlaq_f32(vacci, vai, vbr)':'a=&vacci,b=&vai,c=&vbr',
 'vst1q_f32(or, vaccr)':'a=&vaccr','vst1q_f32(oi, vacci)':'a=&vacci',
 'vget_low_f32(vaccr)':'a=&vaccr','vget_low_f32(vacci)':'a=&vacci','vget_high_f32(vaccr)':'a=&vaccr','vget_high_f32(vacci)':'a=&vacci',
 'vst1_f32(or, vaccr_lo)':'a=&vaccr_lo','vst1_f32(oi, vacci_lo)':'a=&vacci_lo',
 'vst1_lane_f32(or, vaccr_lo, 0)':'a=&vaccr_lo','vst1_lane_f32(oi, vacci_lo, 0)':'a=&vacci_lo'}
 for anchor,binding in bindings.items():
  expected_count=2 if anchor.startswith(('vld1q_f32','vmulq_f32','vmlsq_f32','vmlaq_f32'))else 1
  assert text.count(anchor)==expected_count,'Unknown call shape '+anchor
  annotation='/*@ where '+binding+' */';text=text.replace(anchor,anchor+' '+annotation);patches.append({'after':anchor,'occurrences':expected_count,'text':annotation})
 assert tokens(text)==tokens(original.read_text()),'Executable source changed'
 (HERE/'c/neon.annotations.json').write_text(json.dumps(patches,indent=2)+'\n')
 prefix='#include "'+str(CASE/'shim/neon_frontend.h')+'"\n'
 (run/'neon_unit.c').write_text(prefix+text);(run/'original.c').write_text(prefix+original.read_text())
 status={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'budget_seconds':args.budget,'diagnostics':args.diagnostics,'original_sha256':expected,'public_spec_sha256':sha(CASE/'spec.c')}
 input_files=[CASE/'impl/testNEON.c',CASE/'spec.c',HERE/'coq/Model.v',HERE/'coq/ComplexModel.v',HERE/'c/neon.annotations.json',HERE/'c/neon_vcmul.strategies',Path(__file__)]+[CASE/'shim'/name for name in ['types.h','primitives.h','window_load.h','window_def.h','neon_base.h','neon_frontend.h','model_def.h']]
 status['live_sources_sha256']={str(path.relative_to(CASE)):sha(path) for path in input_files}
 def execute(cmd,label,timeout=300):
  cmd=list(map(str,cmd));start=time.monotonic();log=run/(label+'.log')
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'command':cmd,'label':label,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 try:
  for name in ['neon_unit','original']:execute(['gcc','-E','-P','-CC','-nostdinc',run/(name+'.c'),'-o',run/(name+'_expanded.c')],name+'-cpp')
  assert tokens((run/'neon_unit_expanded.c').read_text())==tokens((run/'original_expanded.c').read_text()),'Frontend CPP executable tokens changed'
  (run/'neon_unit.c').write_bytes((run/'neon_unit_expanded.c').read_bytes())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=VCMul']
  for folder in sorted((BASE/'proof/c').iterdir()):cmd+=['-slp',folder,folder.name]
  cmd+=['-slp',HERE/'c','VCMul']
  if args.diagnostics:
   cmd.remove('--no-exec-info');cmd+=['--Auto-VC-Checking',run/'solver.log']
  execute(cmd,'qcp',args.budget)
  goal=run/'neon_unit_goal.v';names=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
  status.update(generation_passed=True,generated_c_vcs=len(names),goal_sha256=sha(goal),cpp_sha256=sha(run/'neon_unit.c'),original_and_cpp_tokens_identical=True)
 except Exception as error:status['error']=str(error);print(error,flush=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'neon-generation-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if status['generation_passed'] else 1
if __name__=='__main__':raise SystemExit(main())
