#include "fp_primitives.h"

/*@ requires vl<=16; requires \valid_read(p+(0..vl-1)); assigns \nothing; ensures \forall integer j; 0<=j<vl ==> (ext_same(\result.lane[j],p[j])); */
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],p[j]));  loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r;
}

/*@ requires vl<=16; requires \valid(p+(0..vl-1)); assigns p[0..vl-1]; ensures \forall integer j; 0<=j<vl ==> (ext_same(p[j],v.lane[j])); */
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t v,size_t vl) {
  /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(p[j],v.lane[j]));  loop assigns i,p[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)p[i]=v.lane[i];
}

/*@ requires vl<=16; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> (ext_same(\result.lane[j],value)); */
vfloat32m4_t __riscv_vfmv_v_f_f32m4(float value,size_t vl) {
  vfloat32m4_t r={{0}}; /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],value));  loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=value; return r;
}

vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t z,size_t vl) { for(size_t i=0;i<vl;i++)z.lane[0]+=a.lane[i];return z; }
