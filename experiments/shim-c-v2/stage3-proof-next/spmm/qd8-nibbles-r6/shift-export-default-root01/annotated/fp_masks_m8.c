#include "fp_primitives.h"

/*@ requires vl<=32;  assigns \nothing; ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(\lt_float(c.lane[j],a.lane[j])?1:0); */
vbool4_t __riscv_vmfgt_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl) { vbool4_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(\lt_float(c.lane[j],a.lane[j])?1:0); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }

/*@ requires vl<=32;  assigns \nothing; ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(!\eq_float(a.lane[j],c.lane[j])?1:0); */
vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl) { vbool4_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(!\eq_float(a.lane[j],c.lane[j])?1:0); loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }

/*@ requires vl<=32;  assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],mask.lane[j]?c.lane[j]:a.lane[j]); */
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t c,vbool4_t mask,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],mask.lane[j]?c.lane[j]:\at(a.lane[j],Pre)); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }

/*@ requires vl<=32;  assigns \nothing; ensures \forall integer j; 0<=j<vl ==> ext_same(\result.lane[j],mask.lane[j]?c:a.lane[j]); */
vfloat32m8_t __riscv_vfmerge_vfm_f32m8(vfloat32m8_t a,float c,vbool4_t mask,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],mask.lane[j]?c:\at(a.lane[j],Pre)); loop invariant \forall integer j; i<=j<vl ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant vl-i; */
for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
