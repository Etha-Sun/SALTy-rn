#!/usr/bin/env python3
"""Construct faithful 32-lane record views and ordinary readonly consumers.

Inactive fields remain unconstrained. This adds a representation boundary,
not a new ISA operation, VL policy, floating-point model, or public domain.
"""
from pathlib import Path
C=Path(__file__).resolve().parents[1]
def main():
 model='From Coq Require Import ZArith Strings.String.\nFrom ArgmaxPool Require Export RvvKernelModel.\nImport Snaive_C_Rules64.\nLocal Open Scope string_scope. Local Open Scope sac.\n'
 for ty,ct,st in [('vfloat32m8_t','fp32','Float'),('vbool4_t','Z','UInt')]:
  model+='\nRecord Record'+ty+' : Type := make_record_'+ty+' {\n '+';\n '.join(ty+'_s'+str(j)+':'+ct for j in range(32))+'\n}.\n'
  for undef in [False,True]:
   name=('UndefStructPred'if undef else'StructPred')+ty
   model+='Definition '+name+'(p:Z)'+(''if undef else'(v:Record'+ty+')')+':Assertion :=\n '+' **\n '.join('(&(p # "'+ty+'" ->ₛ "s'+str(j)+'")) # '+st+(' |->_'if undef else' |-> v.('+ty+'_s'+str(j)+')')for j in range(32))+'.\n'
 f=lambda v,ty,j:v+'.('+ty+'_s'+str(j)+')'
 conjunction=lambda xs:' /\\\n '.join(xs)
 model+='\nDefinition ap_record_mask32(m:Recordvbool4_t)(vl:Z):Prop :=\n '+conjunction('ap_rvv_mask_active '+str(j)+' vl '+f('m','vbool4_t',j)for j in range(32))+'.\n'
 model+='Definition ap_record_gt32(r:Recordvbool4_t)(a b:Recordvfloat32m8_t)(vl:Z):Prop :=\n '+conjunction('apr_int_lane '+str(j)+' vl '+f('r','vbool4_t',j)+' (ap_rvv_gt '+f('a','vfloat32m8_t',j)+' '+f('b','vfloat32m8_t',j)+')'for j in range(32))+'.\n'
 model+='Definition ap_record_merge32(r:Recordvfloat32m8_t)(m:Recordvbool4_t)(a b:Recordvfloat32m8_t)(vl:Z):Prop :=\n '+conjunction('apr_float_lane '+str(j)+' vl '+f('r','vfloat32m8_t',j)+' (ap_rvv_select_f32 '+f('m','vbool4_t',j)+' '+f('a','vfloat32m8_t',j)+' '+f('b','vfloat32m8_t',j)+')'for j in range(32))+'.\n'
 model+='Lemma ap_record_gt32_mask:forall r a b vl,ap_record_gt32 r a b vl->ap_record_mask32 r vl.\nProof. unfold ap_record_gt32,ap_record_mask32;intros;repeat match goal with H:_ /\\ _ |- _=>destruct H end;repeat split;eapply apr_gt_mask_active;eassumption. Qed.\nPrint Assumptions ap_record_gt32_mask.\n'
 (C/'proof/coq/RvvVectorRecords.v').write_text(model)
 prefix='''#ifndef ARGMAXPOOL_RVV_RECORD_CONSUMERS_H
#define ARGMAXPOOL_RVV_RECORD_CONSUMERS_H
#include "rvv_specs.h"
/*@ Import Coq Require Import ArgmaxPool.RvvVectorRecords */
/*@ Extern Coq (Recordvfloat32m8_t :: *) (Recordvbool4_t :: *) */
/*@ Extern Coq (StructPredvfloat32m8_t:Z->Recordvfloat32m8_t->Assertion)
 (StructPredvbool4_t:Z->Recordvbool4_t->Assertion)
 (ap_record_mask32:Recordvbool4_t->Z->Prop)
 (ap_record_gt32:Recordvbool4_t->Recordvfloat32m8_t->Recordvfloat32m8_t->Z->Prop)
 (ap_record_merge32:Recordvfloat32m8_t->Recordvbool4_t->Recordvfloat32m8_t->Recordvfloat32m8_t->Z->Prop) */
'''
 items=[]
 for kind in ['gt','merge']:
  ret='vbool4_t'if kind=='gt'else'vfloat32m8_t';record='Record'+ret
  params='const vfloat32m8_t*pa,const vfloat32m8_t*pb'+(',const vbool4_t*pm'if kind=='merge'else'')+',size_t vl'
  sig=ret+' ap_record_rvv_'+kind+'32('+params+')'
  w='(A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t)'+(' (M:Recordvbool4_t)'if kind=='merge'else'')
  own='StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)'+('*StructPredvbool4_t(pm,M)'if kind=='merge'else'')
  pre='0<=vl && vl<=32 && '+('ap_record_mask32(M,vl) && 'if kind=='merge'else'')+own
  prop='ap_record_gt32(R,A,B,vl) && ap_record_mask32(R,vl)'if kind=='gt'else'ap_record_merge32(R,M,A,B,vl)'
  ann='/*@ With '+w+' Require '+pre+'\n Ensure exists(R:'+record+'),'+prop+' && '+own+'*StructPred'+ret+'(&__return,R) */'
  body='{vfloat32m8_t a=*pa;vfloat32m8_t b=*pb;'+('vbool4_t m=*pm;'if kind=='merge'else'')+'return '+('__riscv_vmfgt_vv_f32m8_b4(a,b,vl) /*@ where a=0,b=0 */;'if kind=='gt'else'__riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;')+'}'
  items.append((sig,ann,body))
 (C/'shim/rvv_record_consumers.h').write_text(prefix+''.join(sig+'\n'+ann+';\n'for sig,ann,body in items)+'#endif\n')
 (C/'shim/rvv_record_consumers.c').write_text('#include "rvv_record_consumers.h"\n'+''.join(sig+'\n'+ann+'\n'+body+'\n'for sig,ann,body in items))
 (C/'proof/coq/rvv_record_consumers_def.v').write_text('(* Reject the emitter R/Int definition; use the exact shared fp32/Float record model. *)\nFrom ArgmaxPool Require Export RvvVectorRecords.\n')
if __name__=='__main__':main()
