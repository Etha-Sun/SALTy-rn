#include "fp_primitives.h"

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],ext_num_max32(a.lane[j],b)); */
vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_num_max32(\at(a.lane[j],Pre),b)); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],ext_num_min32(a.lane[j],b)); */
vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_num_min32(\at(a.lane[j],Pre),b)); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],ext_num_max32(a.lane[j],b.lane[j])); */
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_num_max32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b.lane[i]);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],ext_num_min32(a.lane[j],b.lane[j])); */
vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_num_min32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b.lane[i]);return a; }
