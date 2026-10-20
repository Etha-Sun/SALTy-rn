#include "fp_primitives.h"

/*@ requires vl<=8; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],complex_mul32(a.lane[j],b)); */
vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],complex_mul32(\at(a.lane[j],Pre),b)); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }

/*@ requires vl<=8; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],complex_add32(a.lane[j],b.lane[j])); */
vfloat32m2_t __riscv_vfadd_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],complex_add32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }

/*@ requires vl<=8; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],complex_mul32(a.lane[j],b.lane[j])); */
vfloat32m2_t __riscv_vfmul_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],complex_mul32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }

/*@ requires vl<=8; assigns errno; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],shim_fma32(b,c.lane[j],a.lane[j])); */
vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t a,float b,vfloat32m2_t c,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],shim_fma32(b,c.lane[j],\at(a.lane[j],Pre))); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a,errno; loop variant vl-i; */
for(size_t i=0;i<vl;i++) a.lane[i]=fmaf(b,c.lane[i],a.lane[i]); return a; }

/*@ requires vl<=8; assigns errno; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],shim_fma32(b.lane[j],c.lane[j],a.lane[j])); */
vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,vfloat32m2_t c,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],shim_fma32(b.lane[j],c.lane[j],\at(a.lane[j],Pre))); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a,errno; loop variant vl-i; */
for(size_t i=0;i<vl;i++) a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]); return a; }
