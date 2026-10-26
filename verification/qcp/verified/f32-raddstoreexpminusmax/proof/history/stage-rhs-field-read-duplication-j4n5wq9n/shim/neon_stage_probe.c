#include "program_model.h"
float32x4_t em_stage_probe(float x)
/*@ Require emp Ensure exists (A:Recordfloat32x4_t),StructPredfloat32x4_t(&__return,A) */
{float32x4_t a=vmovq_n_f32(x) /*@ where X=x */;/*@ store(&(a.s0),float,a.s0)*store(&(a.s1),float,a.s1)*store(&(a.s2),float,a.s2)*store(&(a.s3),float,a.s3) which implies exists(VA:Recordfloat32x4_t),em_same_record4(VA,em_pack4(a.s0,a.s1,a.s2,a.s3))&&StructPredfloat32x4_t(&a,VA) */
/*@ Given VA */
float32x4_t b=vmovq_n_f32(x) /*@ where X=x */;/*@ store(&(b.s0),float,b.s0)*store(&(b.s1),float,b.s1)*store(&(b.s2),float,b.s2)*store(&(b.s3),float,b.s3) which implies exists(VB:Recordfloat32x4_t),em_same_record4(VB,em_pack4(b.s0,b.s1,b.s2,b.s3))&&StructPredfloat32x4_t(&b,VB) */
/*@ Given VB */
float32x4_t c=vsubq_f32(a,b) /*@ where A=VA,B=VB */;/*@ store(&(a.s0),float,a.s0)*store(&(a.s1),float,a.s1)*store(&(a.s2),float,a.s2)*store(&(a.s3),float,a.s3) which implies UndefStructPredfloat32x4_t(&a) */
/*@ store(&(b.s0),float,b.s0)*store(&(b.s1),float,b.s1)*store(&(b.s2),float,b.s2)*store(&(b.s3),float,b.s3) which implies UndefStructPredfloat32x4_t(&b) */
return c;}
