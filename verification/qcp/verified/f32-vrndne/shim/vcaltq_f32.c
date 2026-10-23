#include "vector_ops.h"
uint32x4_t vcaltq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),unsigned int,rndne_abs_lt(x0,y0)) * store(&(__return.s1),unsigned int,rndne_abs_lt(x1,y1)) * store(&(__return.s2),unsigned int,rndne_abs_lt(x2,y2)) * store(&(__return.s3),unsigned int,rndne_abs_lt(x3,y3)) */
{
 uint32x4_t r;

 r.s0=qcp_rnd_abs_lt(a.s0,b.s0);
 r.s1=qcp_rnd_abs_lt(a.s1,b.s1);
 r.s2=qcp_rnd_abs_lt(a.s2,b.s2);
 r.s3=qcp_rnd_abs_lt(a.s3,b.s3);
 return r;
}
