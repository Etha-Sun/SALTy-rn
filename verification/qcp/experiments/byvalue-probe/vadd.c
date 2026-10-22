/*@ Import Coq Require Import Probe.Layout */
struct float32x4_t { float s0; float s1; float s2; float s3; };
typedef struct float32x4_t float32x4_t;
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b)
/*@ With (x0 : fp32) (x1 : fp32) (x2 : fp32) (x3 : fp32) (y0 : fp32) (y1 : fp32) (y2 : fp32) (y3 : fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_add(x0,y0)) * store(&(__return.s1),float,fp32_add(x1,y1)) * store(&(__return.s2),float,fp32_add(x2,y2)) * store(&(__return.s3),float,fp32_add(x3,y3)) */
{
 float32x4_t r;
 r.s0 = a.s0 + b.s0;
 r.s1 = a.s1 + b.s1;
 r.s2 = a.s2 + b.s2;
 r.s3 = a.s3 + b.s3;
 return r;
}
float32x4_t chain(float32x4_t a, float32x4_t b, float32x4_t c)
/*@ With (x0 : fp32) (x1 : fp32) (x2 : fp32) (x3 : fp32) (y0 : fp32) (y1 : fp32) (y2 : fp32) (y3 : fp32) (z0 : fp32) (z1 : fp32) (z2 : fp32) (z3 : fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(c.s0),float,z0) * store(&(c.s1),float,z1) * store(&(c.s2),float,z2) * store(&(c.s3),float,z3)
 Ensure store(&(__return.s0),float,fp32_add(fp32_add(x0,y0),z0)) * store(&(__return.s1),float,fp32_add(fp32_add(x1,y1),z1)) * store(&(__return.s2),float,fp32_add(fp32_add(x2,y2),z2)) * store(&(__return.s3),float,fp32_add(fp32_add(x3,y3),z3)) */
{
 float32x4_t vacc = vaddq_f32(a,b) /*@ where a = &a, b = &b */;
 vacc = vaddq_f32(vacc,c) /*@ where a = &vacc, b = &c */;
 return vacc;
}
