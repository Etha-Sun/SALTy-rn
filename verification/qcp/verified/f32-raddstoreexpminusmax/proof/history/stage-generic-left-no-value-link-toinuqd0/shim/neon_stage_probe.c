#include "program_model.h"
float32x4_t em_stage_probe(float x)
/*@ With(X:fp32) Require em_same(x,X)&&emp Ensure exists(A:Recordfloat32x4_t),StructPredfloat32x4_t(&__return,A) */
{
 float32x4_t a=vmovq_n_f32(x) /*@ where X=X */;
 /*@ store(&(a.s0),float,a.s0)*store(&(a.s1),float,a.s1)*store(&(a.s2),float,a.s2)*store(&(a.s3),float,a.s3) which implies exists(VA:Recordfloat32x4_t),em_same_record4(VA,em_neon_dup(X))&&StructPredfloat32x4_t(&a,VA) */
 /*@ Given VA */
 float32x4_t b=vmovq_n_f32(x) /*@ where X=X */;
 /*@ store(&(b.s0),float,b.s0)*store(&(b.s1),float,b.s1)*store(&(b.s2),float,b.s2)*store(&(b.s3),float,b.s3) which implies exists(VB:Recordfloat32x4_t),em_same_record4(VB,em_neon_dup(X))&&StructPredfloat32x4_t(&b,VB) */
 /*@ Given VB */
 float32x4_t c=vsubq_f32(a,b) /*@ where A=VA,B=VB */;
 return c;
}
