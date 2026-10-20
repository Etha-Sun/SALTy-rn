#include "fp_primitives.h"

uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]&=b.lane[i];return a; }

uint32x4_t vbicq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]&=~b.lane[i];return a; }

int32x4_t vreinterpretq_s32_f32(float32x4_t a) { int32x4_t r;memcpy(&r,&a,16);return r; }

uint32x4_t vreinterpretq_u32_f32(float32x4_t a) { uint32x4_t r;memcpy(&r,&a,16);return r; }

float32x4_t vreinterpretq_f32_s32(int32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }

float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }

int32x4_t vshlq_n_s32(int32x4_t a,int n) { for(int i=0;i<4;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }

vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(vfloat32m4_t a) { vint32m4_t r;memcpy(&r,&a,sizeof r);return r; }

vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(vint32m4_t a) { vfloat32m4_t r;memcpy(&r,&a,sizeof r);return r; }

vint32m4_t __riscv_vsll_vx_i32m4(vint32m4_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }
