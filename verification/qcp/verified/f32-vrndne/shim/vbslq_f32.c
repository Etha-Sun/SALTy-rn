#include "vector_ops.h"
float32x4_t vbslq_f32(uint32x4_t mask,float32x4_t a,float32x4_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(mask.s0),unsigned int,m0) * store(&(mask.s1),unsigned int,m1) * store(&(mask.s2),unsigned int,m2) * store(&(mask.s3),unsigned int,m3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,rndne_select(m0,x0,y0)) * store(&(__return.s1),float,rndne_select(m1,x1,y1)) * store(&(__return.s2),float,rndne_select(m2,x2,y2)) * store(&(__return.s3),float,rndne_select(m3,x3,y3)) */
{
 float32x4_t r;

 r.s0=qcp_rnd_select(mask.s0,a.s0,b.s0);
 r.s1=qcp_rnd_select(mask.s1,a.s1,b.s1);
 r.s2=qcp_rnd_select(mask.s2,a.s2,b.s2);
 r.s3=qcp_rnd_select(mask.s3,a.s3,b.s3);
 return r;
}
