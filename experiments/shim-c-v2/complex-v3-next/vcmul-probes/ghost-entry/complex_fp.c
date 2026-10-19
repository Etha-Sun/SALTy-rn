#include "complex_fp.h"
/*@ assigns \nothing; ensures cx_same_float(\result,complex_add32(a,b)); */
float complex_add(float a,float b) { return a+b; }
/*@ assigns \nothing; ensures cx_same_float(\result,complex_sub32(a,b)); */
float complex_sub(float a,float b) { return a-b; }
/*@ assigns \nothing; ensures cx_same_float(\result,complex_mul32(a,b)); */
float complex_mul(float a,float b) { return a*b; }
/*@ requires \valid_read(p+(0..4-1)); assigns \nothing; ensures \forall integer j;0<=j<4 ==> cx_same_float(\result.lane[j],p[j]); */
float32x4_t vld1q_f32(const float *p) {
  float32x4_t r; /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> cx_same_float(r.lane[j],p[j]); loop assigns i,r; loop variant 4-i; */
  for(size_t i=0;i<4;i++)r.lane[i]=p[i]; return r;
}
/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> cx_same_float(\result.lane[j],complex_mul32(a.lane[j],b.lane[j])); */
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) {
  /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_mul32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j;i<=j<4 ==> cx_same_float(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant 4-i; */
  for(size_t i=0;i<4;i++)a.lane[i]=complex_mul(a.lane[i],b.lane[i]); return a;
}
/* NEON VMLA/VMLS are non-fused: round the multiply, then round add/sub. */
/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> cx_same_float(\result.lane[j],complex_add32(a.lane[j],complex_mul32(b.lane[j],c.lane[j]))); */
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  /*@ ghost float32x4_t initial_a = a; */
  /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_add32(initial_a.lane[j],complex_mul32(b.lane[j],c.lane[j]))); loop invariant \forall integer j;i<=j<4 ==> cx_same_float(a.lane[j],initial_a.lane[j]); loop assigns i,a; loop variant 4-i; */
  for(size_t i=0;i<4;i++)a.lane[i]=complex_add(a.lane[i],complex_mul(b.lane[i],c.lane[i])); return a;
}
/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> cx_same_float(\result.lane[j],complex_sub32(a.lane[j],complex_mul32(b.lane[j],c.lane[j]))); */
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  /*@ ghost float32x4_t initial_a = a; */
  /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_sub32(initial_a.lane[j],complex_mul32(b.lane[j],c.lane[j]))); loop invariant \forall integer j;i<=j<4 ==> cx_same_float(a.lane[j],initial_a.lane[j]); loop assigns i,a; loop variant 4-i; */
  for(size_t i=0;i<4;i++)a.lane[i]=complex_sub(a.lane[i],complex_mul(b.lane[i],c.lane[i])); return a;
}
/*@ requires \valid(p+(0..4-1)); assigns p[0..4-1]; ensures \forall integer j;0<=j<4 ==> cx_same_float(p[j],a.lane[j]); */
void vst1q_f32(float *p,float32x4_t a) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> cx_same_float(p[j],a.lane[j]); loop assigns i,p[0..4-1]; loop variant 4-i; */
  for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
/*@ assigns \nothing; ensures \forall integer j;0<=j<2 ==> cx_same_float(\result.lane[j],a.lane[j+0]); */
float32x2_t vget_low_f32(float32x4_t a) { float32x2_t r={{a.lane[0],a.lane[1]}}; return r; }
/*@ assigns \nothing; ensures \forall integer j;0<=j<2 ==> cx_same_float(\result.lane[j],a.lane[j+2]); */
float32x2_t vget_high_f32(float32x4_t a) { float32x2_t r={{a.lane[2],a.lane[3]}}; return r; }
/*@ requires \valid(p+(0..2-1)); assigns p[0..2-1]; ensures \forall integer j;0<=j<2 ==> cx_same_float(p[j],a.lane[j]); */
void vst1_f32(float *p,float32x2_t a) { p[0]=a.lane[0]; p[1]=a.lane[1]; }
/*@ requires 0<=lane<2; requires \valid(p); assigns *p; ensures cx_same_float(*p,a.lane[lane]); */
void vst1_lane_f32(float *p,float32x2_t a,int lane) { *p=a.lane[lane]; }
/*@ assigns \nothing; ensures \result==(n<16?n:16); */
size_t __riscv_vsetvl_e32m4(size_t n) { return n<16 ? n : 16; }
/*@ requires vl<=16; requires \valid_read(p+(0..vl-1)); assigns \nothing; ensures \forall integer j;0<=j<vl ==> cx_same_float(\result.lane[j],p[j]); */
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> cx_same_float(r.lane[j],p[j]); loop assigns i,r; loop variant vl-i; */
  for(size_t i=0;i<vl;i++)r.lane[i]=p[i]; return r;
}
/*@ requires vl<=16; assigns \nothing; ensures \forall integer j;0<=j<vl ==> cx_same_float(\result.lane[j],complex_mul32(a.lane[j],b.lane[j])); */
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_mul32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j;i<=j<vl ==> cx_same_float(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_mul(a.lane[i],b.lane[i]); return a;
}
/*@ requires vl<=16; assigns \nothing; ensures \forall integer j;0<=j<vl ==> cx_same_float(\result.lane[j],complex_add32(a.lane[j],b.lane[j])); */
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_add32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j;i<=j<vl ==> cx_same_float(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_add(a.lane[i],b.lane[i]); return a;
}
/*@ requires vl<=16; assigns \nothing; ensures \forall integer j;0<=j<vl ==> cx_same_float(\result.lane[j],complex_sub32(a.lane[j],b.lane[j])); */
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> cx_same_float(a.lane[j],complex_sub32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j;i<=j<vl ==> cx_same_float(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_sub(a.lane[i],b.lane[i]); return a;
}
/*@ requires vl<=16; requires \valid(p+(0..vl-1)); assigns p[0..vl-1]; ensures \forall integer j;0<=j<vl ==> cx_same_float(p[j],a.lane[j]); */
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t a,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> cx_same_float(p[j],a.lane[j]); loop assigns i,p[0..vl-1]; loop variant vl-i; */
  for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
