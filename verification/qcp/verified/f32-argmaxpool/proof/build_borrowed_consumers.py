#!/usr/bin/env python3
"""Ordinary C adapters for original intrinsic calls; each body needs checking.

These are not intrinsic-spec exemptions. Inputs retain all field owners;
fresh returned floats carry structural equality, including every NaN bit.
"""
from pathlib import Path
import json,hashlib
C=Path(__file__).resolve().parents[1]
def bind(p,n,t):return ' '.join(f'({p}{j}:{t})'for j in range(n))
def fields(p,v,n,t,ret=False):return ' * '.join(f'store(&({p}{"."if ret else"->"}s{j}),{t},{v}{j})'for j in range(n))
def contract(w,pre,post):return '/*@ With '+w+' Require '+pre+'\n Ensure '+post+' */'
def consumers():
 result=[]
 for kind in ['rvv_gt32','rvv_merge32','neon_select4']:
  n=4 if kind=='neon_select4'else 32;fp='fp32';maskty='uint32x4_t'if n==4 else'vbool4_t';vty='float32x4_t'if n==4 else'vfloat32m8_t';name='ap_borrow_'+kind
  withs=bind('a',n,fp)+' '+bind('b',n,fp)
  own=fields('pa','a',n,'float')+' * '+fields('pb','b',n,'float')
  params=f'const {vty}*pa,const {vty}*pb';pures=[]
  body=f'{vty} a=*pa;{vty} b=*pb;'
  if kind!='rvv_gt32':
   withs+=' '+bind('m',n,'Z');params+=f',const {maskty}*pm';own+=' * '+fields('pm','m',n,'unsigned int');body+=f'{maskty} m=*pm;'
   pures+=['ap_bool_mask(m'+str(j)+')'if n==4 else'ap_rvv_mask_active('+str(j)+',vl,m'+str(j)+')'for j in range(n)]
  if n==32:params+=',size_t vl';pures=['0<=vl','vl<=32']+pures
  if kind=='rvv_gt32':
   ret='vbool4_t';coqt='Z';ctype='unsigned int';props=[f'apr_int_lane({j},vl,r{j},ap_rvv_gt(a{j},b{j}))'for j in range(n)]+[f'ap_rvv_mask_active({j},vl,r{j})'for j in range(n)]
   body+='return __riscv_vmfgt_vv_f32m8_b4(a,b,vl) /*@ where a=0,b=0 */;'
  elif kind=='rvv_merge32':
   ret=vty;coqt=fp;ctype='float';props=[f'apr_float_lane({j},vl,r{j},ap_rvv_select_f32(m{j},a{j},b{j}))'for j in range(n)]
   body+='return __riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;'
  else:
   ret=vty;coqt=fp;ctype='float';props=[f'ap_same_bits(r{j},ap_select_f32(m{j},a{j},b{j}))'for j in range(n)]
   body+='return vbslq_f32(m,a,b) /*@ where m=0,a=0,b=0 */;'
  pre=(' && '.join(pures)+' && 'if pures else'')+own
  post='exists '+bind('r',n,coqt)+', '+' && '.join(props)+' && '+own+' * '+fields('__return','r',n,ctype,True)
  ann=contract(withs,pre,post);sig=ret+' '+name+'('+params+')'
  result.append(dict(name=name,kind=kind,lanes=n,signature=sig,contract=ann,body='{'+body+'}',input_fields=n*(2 if kind=='rvv_gt32'else 3),original_intrinsic='__riscv_vmfgt_vv_f32m8_b4'if kind=='rvv_gt32'else'__riscv_vmerge_vvm_f32m8'if kind=='rvv_merge32'else'vbslq_f32'))
 return result
def main():
 items=consumers();prefix='''#ifndef ARGMAXPOOL_BORROWED_CONSUMERS_H
#define ARGMAXPOOL_BORROWED_CONSUMERS_H
#include "rvv_specs.h"
#include "neon_specs.h"
/*@ Import Coq Require Import ArgmaxPool.BorrowedKernelModel */
'''
 header=prefix+''.join(x['signature']+'\n'+x['contract']+';\n'for x in items)+'#endif\n'
 source='#include "borrowed_consumers.h"\n'+''.join(x['signature']+'\n'+x['contract']+'\n'+x['body']+'\n'for x in items)
 (C/'shim/borrowed_consumers.h').write_text(header);(C/'shim/borrowed_consumers.c').write_text(source)
 h=lambda t:hashlib.sha256(t.encode()).hexdigest()
 (C/'proof/borrowed-consumers-construction.json').write_text(json.dumps({'scope':'ordinary_C_adapters_not_intrinsic_exemptions','body_checked':False,'intrinsic_specs_unchanged':True,'kernel_frontend_integrated':False,'header_sha256':h(header),'source_sha256':h(source),'functions':items},indent=2)+'\n')
if __name__=='__main__':main()
