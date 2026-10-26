#include "rvv_specs.h"
/*@ Import Coq Require Import ExpMinusMax.RvvStageProbeModel */
/*@ Extern Coq (em_rvv_sub_self_p:fp32->Z->Recordvfloat32m4_t->Prop) */
vfloat32m4_t em_rvv_stage_probe(float x,size_t vl)
/*@ With(X:fp32) Require 0<=vl&&vl<=16&&em_same(x,X)&&emp
 Ensure exists(B:Recordvfloat32m4_t),em_rvv_sub_self_p(X,vl,B)&&StructPredvfloat32m4_t(&__return,B) */
{
 vfloat32m4_t a=__riscv_vfmv_v_f_f32m4(x,vl) /*@ where X=X @mark dup */;
 /*@ Given A from R */
 vfloat32m4_t b=__riscv_vfsub_vf_f32m4(a,x,vl) /*@ where A=A,X=X @mark sub */;
 /*@ Given B from R */
 return b;
}
