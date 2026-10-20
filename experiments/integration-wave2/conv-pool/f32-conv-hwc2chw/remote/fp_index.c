/*@ ghost
 /@ assigns \nothing;
    ensures next_index_successor_relation: i<n ==> (size_t)(i+1)<=n; @/
 static void next_index_successor(size_t i,size_t n) {}
*/
#include "fp_primitives.h"

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==j);
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==0; */
vuint32m1_t __riscv_vid_v_u32m1(size_t vl) { vuint32m1_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (r.lane[j]==j); loop invariant stage3_zero_suffix: \forall integer j;i<=j<4 ==> r.lane[j]==0; loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=i;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==(uint32_t)(a.lane[j]+x));
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==a.lane[j]; */
vuint32m1_t __riscv_vadd_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (a.lane[j]==(uint32_t)(\at(a.lane[j],Pre)+x)); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]+=x;return a; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==(uint32_t)(a.lane[j]*x));
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==a.lane[j]; */
vuint32m1_t __riscv_vmul_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (a.lane[j]==(uint32_t)(\at(a.lane[j],Pre)*x)); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]*=x;return a; }

vint32m1_t __riscv_vreinterpret_v_u32m1_i32m1(vuint32m1_t a) { vint32m1_t r;memcpy(&r,&a,sizeof r);return r; }

vint32m1_t __riscv_vadd_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { /*@ loop invariant next_signed_add_index: 0<=i<=vl; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++){ /*@ ghost next_index_successor(i,vl); */ uint32_t u;memcpy(&u,&a.lane[i],4);u+=(uint32_t)x;memcpy(&a.lane[i],&u,4);}return a; }

vint32m1_t __riscv_vsub_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { /*@ loop invariant next_signed_sub_index: 0<=i<=vl; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u-=(uint32_t)x;memcpy(&a.lane[i],&u,4);}return a; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==(a.lane[j]>=x?1:0));
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==0; */
vbool32_t __riscv_vmsge_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (r.lane[j]==(a.lane[j]>=x?1:0)); loop invariant stage3_zero_suffix: \forall integer j;i<=j<4 ==> r.lane[j]==0; loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>=x;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==(a.lane[j]<x?1:0));
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==0; */
vbool32_t __riscv_vmslt_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (r.lane[j]==(a.lane[j]<x?1:0)); loop invariant stage3_zero_suffix: \forall integer j;i<=j<4 ==> r.lane[j]==0; loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<x;return r; }

/*@ requires vl<=4; assigns \nothing; ensures \forall integer j;0<=j<vl ==> (\result.lane[j]==(a.lane[j]!=0 && b.lane[j]!=0?1:0));
 ensures stage3_inactive: \forall integer j;vl<=j<4 ==> \result.lane[j]==a.lane[j]; */
vbool32_t __riscv_vmand_mm_b32(vbool32_t a,vbool32_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> (a.lane[j]==(\at(a.lane[j],Pre)!=0 && b.lane[j]!=0?1:0)); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]&&b.lane[i];return a; }

vfloat32m1_t __riscv_vlse32_v_f32m1(const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=*(const float*)((const char*)p+i*stride);return r; }

vfloat32m1_t __riscv_vlse32_v_f32m1_m(vbool32_t mask,const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{0}};for(size_t i=0;i<vl;i++)if(mask.lane[i])r.lane[i]=*(const float*)((const char*)p+i*stride);return r; }
