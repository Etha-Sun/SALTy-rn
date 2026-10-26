#include "neon_record_compare.h"
uint32x4_t ap_record_neon_gt4(const float32x4_t*pa,const float32x4_t*pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)
 Ensure exists(R:Recorduint32x4_t),ap_record_same_u4(R,ap_record_gt4(A,B)) && ap_record_mask4(R) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(&__return,R) */
{float32x4_t a=*pa;float32x4_t b=*pb;
 return vcgtq_f32(a,b) /*@ where a=0,b=0 */;}
