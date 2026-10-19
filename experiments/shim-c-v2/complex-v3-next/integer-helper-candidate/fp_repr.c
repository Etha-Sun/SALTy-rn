#include "fp_primitives.h"

/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> (\result.lane[j]==(uint32_t)(a.lane[j]&b.lane[j])); */
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> (a.lane[j]==(uint32_t)(\at(a.lane[j],Pre)&b.lane[j])); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant 4-i; */ for(int i=0;i<4;i++)a.lane[i]&=b.lane[i];return a; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> (\result.lane[j]==(uint32_t)(a.lane[j]&(uint32_t)(~b.lane[j]))); */
uint32x4_t vbicq_u32(uint32x4_t a,uint32x4_t b) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> (a.lane[j]==(uint32_t)(\at(a.lane[j],Pre)&(uint32_t)(~b.lane[j]))); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant 4-i; */ for(int i=0;i<4;i++)a.lane[i]&=~b.lane[i];return a; }

int32x4_t vreinterpretq_s32_f32(float32x4_t a) { int32x4_t r;memcpy(&r,&a,16);return r; }

uint32x4_t vreinterpretq_u32_f32(float32x4_t a) { uint32x4_t r;memcpy(&r,&a,16);return r; }

float32x4_t vreinterpretq_f32_s32(int32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }

float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }

int32x4_t vshlq_n_s32(int32x4_t a,int n) { for(int i=0;i<4;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }

vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(vfloat32m4_t a) { vint32m4_t r;memcpy(&r,&a,sizeof r);return r; }

vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(vint32m4_t a) { vfloat32m4_t r;memcpy(&r,&a,sizeof r);return r; }

vint32m4_t __riscv_vsll_vx_i32m4(vint32m4_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }
