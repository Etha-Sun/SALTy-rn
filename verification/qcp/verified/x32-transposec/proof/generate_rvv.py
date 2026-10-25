#!/usr/bin/env python3
"""Regenerate the actual repaired RVV kernel with token-preserving annotations.
Generation is not a proof receipt. All ordinary callees remain actual-C units.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def kernel_text():
 raw=(C/'impl/testRVV.c').read_text();spec=json.loads((C/'proof/c/kernel-contract.json').read_text());contract='/*@ '+spec['with']+' Require '+spec['require']+' Ensure '+spec['ensure']+' */';text=raw.replace('\n{','\n'+contract+'\n{',1);cuts=[]
 fixed='xt_valid(F,W,G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8'
 k='(xt_total(G)-bw)';row='(block_height-bh)';heap='xt_data(F) * xt_output(W,R)'
 outer=fixed+' && 0<=bw && bw<=xt_total(G) && input==xt_current_input(G,'+k+',0) && output==xt_current_output(G,'+k+',0) && xt_progress(F,G,old,R,'+k+',0,0) && '+heap
 inner=fixed+' && 0<bw && bw<=xt_total(G) && xt_legal_vl(bw,vl) && 0<vl && vl<=32 && vl<=bw && 0<=bh && bh<=block_height && input==xt_current_input(G,'+k+',0) && output==xt_current_output(G,'+k+',0) && i==xt_current_input(G,'+k+','+row+') && o==xt_current_output(G,'+k+','+row+') && xt_progress(F,G,old,R,'+k+',vl,'+row+') && '+heap
 def cut(anchor,body,kind='Assert',after=False):
  nonlocal text
  assert text.count(anchor)==1,(anchor,text.count(anchor));ann='/*@ '+kind+' '+body+' */';text=text.replace(anchor,anchor+'\n'+ann if after else ann+'\n'+anchor);cuts.append({'anchor':anchor,'annotation':ann,'after':after})
 cut('  assert(block_width == 1 || output_stride >= block_height * sizeof(uint32_t));',spec['require']+' && sizeof(uint32_t)==4 && sizeof(size_t)==8 && sizeof(uintptr_t)==8 && (block_width==1 || output_stride>=unsigned_last_nbits(block_height*4,64)) && (block_height==1 || input_stride>=unsigned_last_nbits(block_width*4,64))')
 cut('  while (bw > 0) {','exists(R:XTOutput), '+outer,'Inv Assert')
 cut('    size_t vl = __riscv_vsetvl_e32m8(bw);','exists(R:XTOutput), '+outer+' && 0<bw && xt_legal_vl(bw,vl) && 0<vl && vl<=32 && vl<=bw',after=True)
 cut('    while (bh > 0) {','exists(R:XTOutput), '+inner,'Inv Assert')
 text=text.replace('__riscv_vle32_v_u32m8(i, vl)','__riscv_vle32_v_u32m8(i, vl) /*@ where F=F */').replace('xt_store_strided(o, output_stride, &v, vl)','xt_store_strided(o, output_stride, &v, vl) /*@ where W=W */')
 assert tokens(raw)==tokens(text)
 return raw,text,{'contract':contract,'cuts':cuts,'source_tokens_preserved':True}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--timeout',type=int,default=21600);args=ap.parse_args();r=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=C/'.build'));raw,text,ann=kernel_text();stem='rvv_unit';records=[];inputs={str(p.relative_to(C)):sha(p)for p in [Path(__file__),C/'impl/testRVV.c',C/'proof/c/kernel-contract.json',*sorted((C/'shim').glob('*.h')),*[C/'proof/coq'/(n+'.v')for n in ['WordModel', 'InputMemory', 'OutputMemory', 'Geometry', 'Types', 'VectorModel', 'ProgressModel', 'StrideModel', 'ProgramModel', 'ArithmeticModel', 'NeonProgramModel']]]};s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(r),'input_sha256':inputs,'records':records};env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def run(label,cmd,mem,timeout):
  cmd=['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--',*map(str,cmd)];t=time.monotonic();log=r/(label+'.log')
  with log.open('w')as f:cp=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=timeout)
  records.append({'label':label,'command':cmd,'exit_code':cp.returncode,'seconds':time.monotonic()-t,'memory_GiB':mem,'timeout_seconds':timeout,'log_sha256':sha(log)});(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert cp.returncode==0,log.read_text()[-4000:]
 try:
  prefix='#include "'+str(C/'shim/program_model.h')+'"\n#include "'+str(C/'shim/rvv_load_specs.h')+'"\n'
  for label,body in [('raw',raw),(stem,text)]:
   src=r/(label+'.in.c');src.write_text(prefix+body);run(label+'-cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C/'impl',src,'-o',r/(label+'.c')],16,180)
  assert tokens((r/'raw.c').read_text())==tokens((r/(stem+'.c')).read_text());(r/'annotations.json').write_text(json.dumps(ann,indent=2)+'\n');s['source_tokens_preserved']=True
  if not args.prepare_only:
   gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/(stem+'.c')),'--coq-output-dir='+str(gen),'--coq-logic-path=X32Transpose','-slp',C/'shim','X32Transpose'],32,args.timeout);goal=gen/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;s.update(generation_passed=True,goal_sha256=sha(goal),cpp_sha256=sha(r/(stem+'.c')),fields=fields,generated_c_vcs=len(fields));assert all(sha(C/p)==h for p,h in inputs.items())
 except Exception as e:s.update(generation_passed=False,error=str(e)or'input guard failed; see preserved input map')
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if s['generation_passed']or args.prepare_only and'error'not in s else 1
if __name__=='__main__':raise SystemExit(main())
