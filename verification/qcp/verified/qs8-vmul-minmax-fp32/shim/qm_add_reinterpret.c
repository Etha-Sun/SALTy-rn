#include "adapters.h"
int32x4_t qm_add_reinterpret(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),int,qm_signed_bits(bits_of_fp32(qm_arm_add(a0,b0)))) * store(&(__return.s1),int,qm_signed_bits(bits_of_fp32(qm_arm_add(a1,b1)))) * store(&(__return.s2),int,qm_signed_bits(bits_of_fp32(qm_arm_add(a2,b2)))) * store(&(__return.s3),int,qm_signed_bits(bits_of_fp32(qm_arm_add(a3,b3)))) */
{
float32x4_t s=vaddq_f32(a,b) /*@ where a=&a,b=&b,a0=a0,a1=a1,a2=a2,a3=a3,b0=b0,b1=b1,b2=b2,b3=b3 */;
int32x4_t r=vreinterpretq_s32_f32(s) /*@ where a=&s,a0=qm_arm_add(a0,b0),a1=qm_arm_add(a1,b1),a2=qm_arm_add(a2,b2),a3=qm_arm_add(a3,b3) */;
return r;
}
