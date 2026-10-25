#include "neon_frontend.h"
void dw_test_store4_call(float *out,const float32x4_t *v)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require undef_data_at(out+0,float) * undef_data_at(out+1,float) * undef_data_at(out+2,float) * undef_data_at(out+3,float) * store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) Ensure store(out+0,float,a0) * store(out+1,float,a1) * store(out+2,float,a2) * store(out+3,float,a3) * store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) */
{ float32x4_t a=*v; vst1q_f32(out,a) /*@ where a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3 */; }
