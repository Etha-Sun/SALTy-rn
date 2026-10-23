#include "neon.h"
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_min(x0,y0)) * store(&(__return.s1),float,fp32_neon_min(x1,y1)) * store(&(__return.s2),float,fp32_neon_min(x2,y2)) * store(&(__return.s3),float,fp32_neon_min(x3,y3)) */
{
 float32x4_t r;
 r.s0=qcp_neon_min(a.s0,b.s0);
 r.s1=qcp_neon_min(a.s1,b.s1);
 r.s2=qcp_neon_min(a.s2,b.s2);
 r.s3=qcp_neon_min(a.s3,b.s3);
 return r;
}

float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_max(x0,y0)) * store(&(__return.s1),float,fp32_neon_max(x1,y1)) * store(&(__return.s2),float,fp32_neon_max(x2,y2)) * store(&(__return.s3),float,fp32_neon_max(x3,y3)) */
{
 float32x4_t r;
 r.s0=qcp_neon_max(a.s0,b.s0);
 r.s1=qcp_neon_max(a.s1,b.s1);
 r.s2=qcp_neon_max(a.s2,b.s2);
 r.s3=qcp_neon_max(a.s3,b.s3);
 return r;
}

float32x4_t vdupq_n_f32(float a)
/*@ Require emp
 Ensure store(&(__return.s0),float,a) * store(&(__return.s1),float,a) * store(&(__return.s2),float,a) * store(&(__return.s3),float,a) */
{
 float32x4_t r;
 r.s0=a;
 r.s1=a;
 r.s2=a;
 r.s3=a;
 return r;
}

float32x4_t vdupq_lane_f32(float32x2_t a,int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require 0<=lane && lane<=1 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1)
 Ensure store(&(__return.s0),float,glane(lane,x0,x1)) * store(&(__return.s1),float,glane(lane,x0,x1)) * store(&(__return.s2),float,glane(lane,x0,x1)) * store(&(__return.s3),float,glane(lane,x0,x1)) */
{
 float32x4_t r; float x;
 if(lane==0)x=a.s0;else x=a.s1;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}

float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */
{
 float32x2_t r; r.s0=a.s0; r.s1=a.s1; return r;
}

float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */
{
 float32x2_t r; r.s0=a.s2; r.s1=a.s3; return r;
}

