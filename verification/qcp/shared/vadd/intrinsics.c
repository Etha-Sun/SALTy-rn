#include "types.h"

float f32_add(float a, float b)
/*@     Require emp
    Ensure fp32_bits_equal(__return,fp32_add(a,b)) */
{
  return a+b;
}

void vld1q_f32(struct float32x4_t *r, const float *p)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
    Ensure store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * store(&(r->s0),float,x0) * store(&(r->s1),float,x1) * store(&(r->s2),float,x2) * store(&(r->s3),float,x3) */
{
  r->s0=p[0];
  r->s1=p[1];
  r->s2=p[2];
  r->s3=p[3];
}

void vst1q_f32(float *p, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */
{
  p[0]=a->s0;
  p[1]=a->s1;
  p[2]=a->s2;
  p[3]=a->s3;
}

void vst1_f32(float *p, const struct float32x2_t *a)
/*@ With (x0: fp32) (x1: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */
{
  p[0]=a->s0;
  p[1]=a->s1;
}

void vaddq_f32(struct float32x4_t *r, const struct float32x4_t *a, const struct float32x4_t *b)
/*@ With (x0: fp32) (y0: fp32) (x1: fp32) (y1: fp32) (x2: fp32) (y2: fp32) (x3: fp32) (y3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * store(&(r->s0),float,fp32_add(x0,y0)) * store(&(r->s1),float,fp32_add(x1,y1)) * store(&(r->s2),float,fp32_add(x2,y2)) * store(&(r->s3),float,fp32_add(x3,y3)) */
{
  r->s0=f32_add(a->s0,b->s0);
  r->s1=f32_add(a->s1,b->s1);
  r->s2=f32_add(a->s2,b->s2);
  r->s3=f32_add(a->s3,b->s3);
}

void vget_low_f32(struct float32x2_t *r, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(r->s0),float,x0) * store(&(r->s1),float,x1) */
{
  r->s0=a->s0;
  r->s1=a->s1;
}

void vget_high_f32(struct float32x2_t *r, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(r->s0),float,x2) * store(&(r->s1),float,x3) */
{
  r->s0=a->s2;
  r->s1=a->s3;
}

void vst1_lane_f32(float *p, const struct float32x2_t *a, int lane)
/*@ With (x0: fp32) (x1: fp32) (z: fp32)
    Require ((lane == 0 && fp32_bits_equal(z,x0)) || (lane == 1 && fp32_bits_equal(z,x1))) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,z) */
{
  if (lane == 0) *p=a->s0;
  if (lane == 1) *p=a->s1;
}

void qcp_vadd_block4(struct float32x4_t *va, struct float32x4_t *vb, struct float32x4_t *vc, const float *a, const float *b, float *out)
/*@ With (x0: fp32) (y0: fp32) (x1: fp32) (y1: fp32) (x2: fp32) (y2: fp32) (x3: fp32) (y3: fp32)
    Require store(pointer_offset(a,0,float),float,x0) * store(pointer_offset(a,1,float),float,x1) * store(pointer_offset(a,2,float),float,x2) * store(pointer_offset(a,3,float),float,x3) * store(pointer_offset(b,0,float),float,y0) * store(pointer_offset(b,1,float),float,y1) * store(pointer_offset(b,2,float),float,y2) * store(pointer_offset(b,3,float),float,y3) * undef_data_at(pointer_offset(out,0,float),float) * undef_data_at(pointer_offset(out,1,float),float) * undef_data_at(pointer_offset(out,2,float),float) * undef_data_at(pointer_offset(out,3,float),float) * undef_data_at(&(va->s0),float) * undef_data_at(&(va->s1),float) * undef_data_at(&(va->s2),float) * undef_data_at(&(va->s3),float) * undef_data_at(&(vb->s0),float) * undef_data_at(&(vb->s1),float) * undef_data_at(&(vb->s2),float) * undef_data_at(&(vb->s3),float) * undef_data_at(&(vc->s0),float) * undef_data_at(&(vc->s1),float) * undef_data_at(&(vc->s2),float) * undef_data_at(&(vc->s3),float)
    Ensure store(pointer_offset(a,0,float),float,x0) * store(pointer_offset(a,1,float),float,x1) * store(pointer_offset(a,2,float),float,x2) * store(pointer_offset(a,3,float),float,x3) * store(pointer_offset(b,0,float),float,y0) * store(pointer_offset(b,1,float),float,y1) * store(pointer_offset(b,2,float),float,y2) * store(pointer_offset(b,3,float),float,y3) * store(pointer_offset(out,0,float),float,fp32_add(x0,y0)) * store(pointer_offset(out,1,float),float,fp32_add(x1,y1)) * store(pointer_offset(out,2,float),float,fp32_add(x2,y2)) * store(pointer_offset(out,3,float),float,fp32_add(x3,y3)) * store(&(va->s0),float,x0) * store(&(va->s1),float,x1) * store(&(va->s2),float,x2) * store(&(va->s3),float,x3) * store(&(vb->s0),float,y0) * store(&(vb->s1),float,y1) * store(&(vb->s2),float,y2) * store(&(vb->s3),float,y3) * store(&(vc->s0),float,fp32_add(x0,y0)) * store(&(vc->s1),float,fp32_add(x1,y1)) * store(&(vc->s2),float,fp32_add(x2,y2)) * store(&(vc->s3),float,fp32_add(x3,y3)) */
{
  vld1q_f32(va,a);
  vld1q_f32(vb,b);
  vaddq_f32(vc,va,vb);
  vst1q_f32(out,vc);
}

unsigned long long __riscv_vsetvl_e32m8(unsigned long long n)
/*@     Require emp
    Ensure __return == vadd_vl(n) && emp */
{
  if (n < 32) return n;
  return 32;
}

float qcp_rvv_add_lane32(float a, float b, unsigned long long i, unsigned long long vl)
/*@     Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
    Ensure fp32_bits_equal(__return,vadd_active_add(i,vl,a,b)) && emp */
{
  if (i < vl) return f32_add(a,b);
  return 0.0f;
}

void qcp_assert(int condition)
/*@     Require condition != 0 && emp
    Ensure emp */
{
  return;
}
