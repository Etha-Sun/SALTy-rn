#include "fp_primitives.h"

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> \result.lane[j]==(\lt_float(b.lane[j],a.lane[j])?UINT32_MAX:0); */
uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(\lt_float(b.lane[j],a.lane[j])?UINT32_MAX:0); loop assigns i,r; loop variant 4-i; */
for(int i=0;i<4;i++)r.lane[i]=a.lane[i]>b.lane[i]?UINT32_MAX:0;return r; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> \result.lane[j]==(\lt_float(a.lane[j],b.lane[j])?UINT32_MAX:0); */
uint32x4_t vcltq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(\lt_float(a.lane[j],b.lane[j])?UINT32_MAX:0); loop assigns i,r; loop variant 4-i; */
for(int i=0;i<4;i++)r.lane[i]=a.lane[i]<b.lane[i]?UINT32_MAX:0;return r; }

/*@ assigns \nothing;
 ensures root40_select: \forall integer j; 0<=j<4 ==> \result.lane[j]==((m.lane[j]&\at(a.lane[j],Pre))|((uint32_t)(~m.lane[j])&b.lane[j])); */
uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b) { /*@ loop invariant root40_select_bounds: 0<=i<=4;
 loop invariant root40_select_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==((m.lane[j]&\at(a.lane[j],Pre))|((uint32_t)(~m.lane[j])&b.lane[j]));
 loop invariant root40_select_suffix: \forall integer j; i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a.lane[0..3]; loop variant 4-i; */
for(int i=0;i<4;i++)a.lane[i]=(m.lane[i]&a.lane[i])|(~m.lane[i]&b.lane[i]);return a; }

float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b) { uint32x4_t ua,ub;memcpy(&ua,&a,16);memcpy(&ub,&b,16);ua=vbslq_u32(m,ua,ub);memcpy(&a,&ua,16);return a; }

vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl) { /*@ loop invariant next_arg_u32_merge_range: 0<=i<=vl;
 loop invariant next_arg_u32_merge_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==(m.lane[j]?x:\at(a.lane[j],Pre));
 loop invariant next_arg_u32_merge_suffix: \forall integer j; i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a.lane[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)if(m.lane[i])a.lane[i]=x;return a; }
