#!/usr/bin/env python3
"""Annotate the locked repaired RVV C without changing any executable token."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd';SHARED=ROOT/'verification/qcp/shared/c-shim/f32'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def function(s,n):
 m=re.search(r'(?m)^\w+\s+'+n+r'\(',s);assert m,n;end=s.index('*/',m.start())+2;br=s.index('{',end);pos=br+1;depth=1
 while depth:depth+=(s[pos]=='{')-(s[pos]=='}');pos+=1
 return s[m.start():pos]
def prototype(s):return s[:s.index('*/')+2]+';\n'
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def prepare():
 rel=lambda p:os.path.relpath(p,CASE/'shim')
 pre='#include "formal_types.h"\n/*@ Import Coq Require Import QcpVadd.VaddBits */\n/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop) */\n'+''.join('#include "'+rel(SHARED/'QcpRvv32'/n)+'"\n'for n in ['rvv_array_def.h','rvv_store_def.h','rvv_loop_def.h'])
 strategies=''.join('/*@ include strategies "'+n+'.strategies" */\n'for n in ['rvv_arrays','rvv_store','rvv_loop','rvv_fmax'])
 sources={p:(SHARED/p).read_text()for p in ['QcpRvv32/rvv_load.c','QcpRvv32/rvv_store.c','ByvalueRvv/shim.c']}
 load=[function(sources['QcpRvv32/rvv_load.c'],n)for n in ['qcp_rvv_read_lane','__riscv_vle32_v_f32m8']]
 load.append(function(sources['ByvalueRvv/shim.c'],'qcp_byvalue_load'))
 store=[function(sources['QcpRvv32/rvv_store.c'],n)for n in ['qcp_rvv_get32','qcp_rvv_store_next','__riscv_vse32_v_f32m8']]
 (CASE/'shim/memory_rvv_load.c').write_text(pre+strategies+'\n\n'.join(load)+'\n')
 (CASE/'shim/memory_rvv_store.c').write_text(pre+strategies+'\n\n'.join(store)+'\n')
 control='''size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
'''
 (CASE/'shim/rvv_control.c').write_text(pre+control)
 # Include the *exact* declarations of actual bodies; no operation declaration
 # copied from the VADD add shim is in this frontend.
 (CASE/'shim/memory_rvv.h').write_text('#ifndef QCP_FMAX_MEMORY_RVV_H\n#define QCP_FMAX_MEMORY_RVV_H\n'+pre+'\n'.join(map(prototype,load+[f for f in store if not f.startswith('void qcp_rvv_store_next(')]))+prototype(control)+'#endif\n')
 (CASE/'shim/rvv_frontend.h').write_text('#include "memory_neon.h"\n#include "memory_rvv.h"\n#include "vector_primitives.h"\n#include "self_compare.h"\n#include "program_model.h"\n'+strategies+'#define __riscv_vle32_v_f32m8 qcp_byvalue_load\n#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))\n')
 origin={'scope':'Existing checked VADD memory bodies/contracts copied unchanged; own formal type header/imports and checked fixed VL control','sources':{str(SHARED/p):sha(SHARED/p)for p in sources},'functions':{'load':['qcp_rvv_read_lane','__riscv_vle32_v_f32m8','qcp_byvalue_load'],'store':['qcp_rvv_get32','qcp_rvv_store_next','__riscv_vse32_v_f32m8']}}
 (HERE/'rvv-memory-provenance.json').write_text(json.dumps(origin,indent=2)+'\n')
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--timeout',type=int,default=1200);parser.add_argument('--prepare-only',action='store_true');parser.add_argument('--strategy-application-limit',type=int,default=1024);parser.add_argument('--trace',action='store_true');args=parser.parse_args();assert args.strategy_application_limit>0;prepare()
 if args.prepare_only:return
 run=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=CASE/'.build'))
 raw=(CASE/'impl/testRVV.c').read_text();assert sha(CASE/'impl/testRVV.c')=='c41a4a25edf0ac21c2c6422f98be7251610ab779ea5e96a85d3745f237d7b373'
 spec=(CASE/'spec.c').read_text();start=spec.index('void test_rvv(');contract=re.search(r'/\*@.*?\*/',spec[start:],re.S).group()
 ann=json.loads((BASE/'proof/annotations/test_rvv.json').read_text());initial,inv,cut=[x['text'].replace('vadd_values','mm_rvv_values')for x in ann[1:4]]
 source=raw.replace('\n{','\n'+contract+'\n{',1).replace('  while (n > 0)',initial+'\n'+inv+'\n  while (n > 0)',1).replace('    vfloat32m8_t va =',cut+'\n    vfloat32m8_t va =',1)
 k='((batch@pre/4)-n)';end='('+k+'+vl)';sl=lambda x:'rvv_slice('+k+','+end+','+x+')';reads=lambda x:[f'rvv_read_value({i},vl,{sl(x)})'for i in range(32)]
 a,b=reads('A'),reads('B');mins=[f'mm_active_max({i},vl,{a[i]},{b[i]})'for i in range(32)];adds=[f'mm_active_add({i},vl,{a[i]},{b[i]})'for i in range(32)];ma=[f'mm_active_ne({i},vl,{a[i]},{a[i]})'for i in range(32)];mb=[f'mm_active_ne({i},vl,{b[i]},{b[i]})'for i in range(32)]
 r1=[f'mm_active_merge({i},vl,{mins[i]},{adds[i]},{ma[i]})'for i in range(32)];r2=[f'mm_active_merge({i},vl,{r1[i]},{adds[i]},{mb[i]})'for i in range(32)]
 binds=lambda pref,x:', '.join(f'{pref}{i} = {v}'for i,v in enumerate(x))
 where={
 '__riscv_vle32_v_f32m8(input_a, vl)':'L = '+sl('A'),
 '__riscv_vle32_v_f32m8(input_b, vl)':'L = '+sl('B'),
 '__riscv_vfmax_vv_f32m8(va, vb, vl)':'a = &va, b = &vb, '+binds('x',a)+', '+binds('y',b),
 '__riscv_vmfne_vv_f32m8_b4(va, va, vl)':binds('x',a),
 '__riscv_vmfne_vv_f32m8_b4(vb, vb, vl)':binds('x',b),
 '__riscv_vfadd_vv_f32m8(va, vb, vl)':'a = &va, b = &vb, '+binds('x',a)+', '+binds('y',b),
 '__riscv_vmerge_vvm_f32m8(vacc, propagated_nan, a_nan, vl)':'a = &vacc, b = &propagated_nan, mask = &a_nan, '+binds('x',mins)+', '+binds('y',adds)+', '+binds('m',ma),
 '__riscv_vmerge_vvm_f32m8(vacc, propagated_nan, b_nan, vl)':'a = &vacc, b = &propagated_nan, mask = &b_nan, '+binds('x',r1)+', '+binds('y',adds)+', '+binds('m',mb),
 '__riscv_vse32_v_f32m8(output, vacc, vl)':'a = &vacc, L = rvv_pack32('+','.join(r2)+'), '+binds('x',r2)}
 for call,bind in where.items():assert source.count(call)==1,call;source=source.replace(call,call+' /*@ where '+bind+' */')
 assert tokens(raw)==tokens(source),'Executable repaired C tokens changed'
 (HERE/'c/rvv.annotations.json').write_text(json.dumps({'initial':initial,'invariant':inv,'cut':cut,'where':where},indent=2)+'\n')
 frontend='#include "'+str(CASE/'shim/rvv_frontend.h')+'"\n';(run/'annotated.c').write_text(frontend+source);(run/'original.c').write_text(frontend+raw)
 for stem,out in [('annotated','rvv_unit'),('original','original.expanded')]:subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(run/(stem+'.c')),'-o',str(run/(out+'.c'))],cwd=run,check=True,timeout=60)
 assert tokens((run/'rvv_unit.c').read_text())==tokens((run/'original.expanded.c').read_text()),'CPP executable tokens changed'
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit',str(args.strategy_application_limit),'--input-file='+str(run/'rvv_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=FMax']
 if args.trace:cmd.remove('--no-exec-info')
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():cmd+=['-slp',str(d),d.name]
 cmd+=['-slp',str(CASE/'shim'),'FMax','-slp',str(HERE/'c'),'FMax'];start=time.monotonic()
 with(run/'qcp.log').open('w')as out:
  try:code=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=args.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'rvv_unit_goal.v';status={'generation_passed':code==0,'kernel_proved':False,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'raw_c_sha256':sha(CASE/'impl/testRVV.c'),'same_frontend_cpp_tokens_identical':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for p in [run/'status.json',HERE/'rvv-generation-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
 history=[]
 for prior in sorted((CASE/'.build').glob('rvv-kernel-*/status.json')):
  item=json.loads(prior.read_text());history.append({k:item[k]for k in ['run_directory','generation_passed','exit_code','seconds','raw_c_sha256','generated_c_vcs']})
 (HERE/'rvv-generation-history.json').write_text(json.dumps(history,indent=2)+'\n')
 print(json.dumps(status,indent=2))
 if code:print((run/'qcp.log').read_text()[-6000:])
 raise SystemExit(code)
if __name__=='__main__':main()
