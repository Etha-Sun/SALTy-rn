#include "record_consumers.h"
float32x4_t ap_record_select4_borrow(const float32x4_t*pa,const float32x4_t*pb,const uint32x4_t*pm)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) (M:Recorduint32x4_t)
 Require ap_record_mask4(M) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(pm,M)
 Ensure exists(R:Recordfloat32x4_t),ap_record_same4(R,ap_record_select4(M,A,B)) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(pm,M)*StructPredfloat32x4_t(&__return,R) */
{float32x4_t a=*pa;float32x4_t b=*pb;uint32x4_t m=*pm;
 return vbslq_f32(m,a,b) /*@ where a=0,b=0,m=0 */;}
