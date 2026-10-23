#!/usr/bin/env python3
"""Use the existing VADD frontend/array proof shape for the distinct Arm min model."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
BASE=ROOT/'verification/qcp/verified/f32-vadd';SHARED=ROOT/'verification/qcp/shared/c-shim/f32'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def function(s,n):
 m=re.search(r'(?m)^(?:void|int|float32x[24]_t)\s+'+n+r'\(',s);assert m,n
 end=s.index('*/',m.start())+2;br=s.index('{',end);pos=br+1;depth=1
 while depth:depth+=(s[pos]=='{')-(s[pos]=='}');pos+=1
 return s[m.start():pos]
def prototype(s):return s[:s.index('*/')+2]+';\n'
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=600);args=p.parse_args()
 (CASE/'.build').mkdir(exist_ok=True);run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=CASE/'.build'))
 (HERE/'c').mkdir(exist_ok=True)
 source=(SHARED/'ByValue/shim.c').read_text()
 names=['vld1q_f32','qcp_vst1q_f32','qcp_vst1_f32','vget_low_f32','vget_high_f32','qcp_vst1_lane_f32','qcp_assert']
 funcs=[function(source,n)for n in names]
 pre='#include "formal_types.h"\n'
 (CASE/'shim/memory_neon.c').write_text(pre+'\n\n'.join(funcs)+'\n')
 macros='''#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))
#define NULL ((void*)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
'''
 (CASE/'shim/memory_neon.h').write_text('#ifndef QCP_FMIN_MEMORY_NEON_H\n#define QCP_FMIN_MEMORY_NEON_H\n'+pre+'\n'.join(map(prototype,funcs))+macros+'#endif\n')
 rel=lambda p:os.path.relpath(p,CASE/'shim')
 head='#include "memory_neon.h"\n#include "vector_primitives.h"\n#include "program_model.h"\n'
 head+='\n'.join('#include "'+rel(SHARED/p)+'"'for p in ['QcpNeonLoop/invariant_def.h','QcpVadd/float_array_def.h','QcpNeonLoop/tail_def.h'])+'\n'
 head+=''.join('/*@ include strategies "'+n+'" */\n'for n in ['neon_bridge.strategies','neon_tail.strategies','float_array.strategies'])
 (CASE/'shim/neon_frontend.h').write_text(head)
 raw=(CASE/'impl/testNEON.c').read_text()
 spec=(CASE/'spec.c').read_text();start=spec.index('void test_neon(');contract=re.search(r'/\*@.*?\*/',spec[start:],re.S).group()
 patches=json.loads((BASE/'proof/annotations/test_neon.json').read_text());inv=patches[1]['text'].replace('vadd_values','mm_arm_values')
 annotated=raw.replace('\n{','\n'+contract+'\n{',1).replace('  for (;',inv+'\n  for (;',1)
 where={'vminq_f32(va, vb)':'a = &va, b = &vb','vst1q_f32(output, vacc)':'a = &vacc','vget_low_f32(vacc)':'a = &vacc','vget_high_f32(vacc)':'a = &vacc','vst1_f32(output, vacc_lo)':'a = &vacc_lo','vst1_lane_f32(output, vacc_lo, 0)':'a = &vacc_lo'}
 for call,bind in where.items():assert call in annotated;annotated=annotated.replace(call,call+' /*@ where '+bind+' */')
 assert tokens(raw)==tokens(annotated),'Executable kernel tokens changed'
 (HERE/'c/neon.annotations.json').write_text(json.dumps({'invariant':inv,'where':where},indent=2)+'\n')
 (run/'annotated.c').write_text('#include "'+str(CASE/'shim/neon_frontend.h')+'"\n'+annotated)
 command=['gcc','-E','-P','-CC','-nostdinc',str(run/'annotated.c'),'-o',str(run/'neon_unit.c')]
 subprocess.run(command,cwd=run,check=True,timeout=60)
 # Audit executable tokens under the *same* macro/type frontend.
 (run/'original.c').write_text('#include "'+str(CASE/'shim/neon_frontend.h')+'"\n'+raw)
 subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(run/'original.c'),'-o',str(run/'original.expanded.c')],cwd=run,check=True,timeout=60)
 assert tokens((run/'neon_unit.c').read_text())==tokens((run/'original.expanded.c').read_text()),'CPP executable tokens changed'
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=FMin']
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():cmd+=['-slp',str(d),d.name]
 cmd+=['-slp',str(CASE/'shim'),'FMin','-slp',str(HERE/'c'),'FMin']
 start=time.monotonic()
 with(run/'qcp.log').open('w')as out:
  try:code=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=args.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'neon_unit_goal.v';status={'generation_passed':code==0,'kernel_proved':False,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'raw_c_sha256':sha(CASE/'impl/testNEON.c'),'same_frontend_cpp_tokens_identical':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for target in [run/'status.json',HERE/'neon-generation-status.json']:target.write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps(status,indent=2));returncode=code
 if code:print((run/'qcp.log').read_text()[-5000:])
 raise SystemExit(returncode)
if __name__=='__main__':main()
