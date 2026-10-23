#include "types.h"
#include "bits.h"
/*@ Extern Coq (bits_of_fp32 : fp32 -> Z) */
int qcp_signed32_lane(float x)
/*@ Require emp Ensure __return == vlrelu_signed32(bits_of_fp32(x)) && emp */
{
 unsigned int u = qcp_float_bits(x);
 if (u < 2147483648u) return (int)u;
 return (int)(u - 2147483648u) - 2147483647 - 1;
}
float qcp_bitselect(unsigned int mask,float a,float b)
/*@ Require emp Ensure fp32_bits_equal(__return,vlrelu_bitselect(mask,a,b)) && emp */
{
 unsigned int ba = qcp_float_bits(a);
 unsigned int bb = qcp_float_bits(b);
 unsigned int bits = (mask & ba) | ((mask ^ 4294967295u) & bb);
 return qcp_float_from_bits(bits);
}
float32x4_t vdupq_n_f32(float value)
/*@ Require emp
 Ensure store(&(__return.s0),float,value) * store(&(__return.s1),float,value) * store(&(__return.s2),float,value) * store(&(__return.s3),float,value) */
{
 float32x4_t r;
 r.s0=value;
 r.s1=value;
 r.s2=value;
 r.s3=value;
 return r;
}
int32x4_t vmovq_n_s32(int value)
/*@ Require emp
 Ensure store(&(__return.s0),int,value) * store(&(__return.s1),int,value) * store(&(__return.s2),int,value) * store(&(__return.s3),int,value) */
{
 int32x4_t r;
 r.s0=value;
 r.s1=value;
 r.s2=value;
 r.s3=value;
 return r;
}
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_mul(x0,y0)) * store(&(__return.s1),float,fp32_mul(x1,y1)) * store(&(__return.s2),float,fp32_mul(x2,y2)) * store(&(__return.s3),float,fp32_mul(x3,y3)) */
{
 float32x4_t r;
 r.s0=a.s0*b.s0;
 r.s1=a.s1*b.s1;
 r.s2=a.s2*b.s2;
 r.s3=a.s3*b.s3;
 return r;
}
int32x4_t vreinterpretq_s32_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),int,vlrelu_signed32(bits_of_fp32(x0))) * store(&(__return.s1),int,vlrelu_signed32(bits_of_fp32(x1))) * store(&(__return.s2),int,vlrelu_signed32(bits_of_fp32(x2))) * store(&(__return.s3),int,vlrelu_signed32(bits_of_fp32(x3))) */
{
 int32x4_t r;
 r.s0=qcp_signed32_lane(a.s0);
 r.s1=qcp_signed32_lane(a.s1);
 r.s2=qcp_signed32_lane(a.s2);
 r.s3=qcp_signed32_lane(a.s3);
 return r;
}
uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),unsigned int,vlrelu_compare_mask(x0,y0)) * store(&(__return.s1),unsigned int,vlrelu_compare_mask(x1,y1)) * store(&(__return.s2),unsigned int,vlrelu_compare_mask(x2,y2)) * store(&(__return.s3),unsigned int,vlrelu_compare_mask(x3,y3)) */
{
 uint32x4_t r;
 r.s0=a.s0<b.s0?4294967295u:0u;
 r.s1=a.s1<b.s1?4294967295u:0u;
 r.s2=a.s2<b.s2?4294967295u:0u;
 r.s3=a.s3<b.s3?4294967295u:0u;
 return r;
}
float32x4_t vbslq_f32(uint32x4_t mask,float32x4_t a,float32x4_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(mask.s0),unsigned int,m0) * store(&(mask.s1),unsigned int,m1) * store(&(mask.s2),unsigned int,m2) * store(&(mask.s3),unsigned int,m3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,vlrelu_bitselect(m0,x0,y0)) * store(&(__return.s1),float,vlrelu_bitselect(m1,x1,y1)) * store(&(__return.s2),float,vlrelu_bitselect(m2,x2,y2)) * store(&(__return.s3),float,vlrelu_bitselect(m3,x3,y3)) */
{
 float32x4_t r;
 r.s0=qcp_bitselect(mask.s0,a.s0,b.s0);
 r.s1=qcp_bitselect(mask.s1,a.s1,b.s1);
 r.s2=qcp_bitselect(mask.s2,a.s2,b.s2);
 r.s3=qcp_bitselect(mask.s3,a.s3,b.s3);
 return r;
}
