#include "fp_primitives.h"

uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i]>b.lane[i]?UINT32_MAX:0;return r; }

uint32x4_t vcltq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i]<b.lane[i]?UINT32_MAX:0;return r; }

uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=(m.lane[i]&a.lane[i])|(~m.lane[i]&b.lane[i]);return a; }

float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b) { uint32x4_t ua,ub;memcpy(&ua,&a,16);memcpy(&ub,&b,16);ua=vbslq_u32(m,ua,ub);memcpy(&a,&ua,16);return a; }

vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl) { for(size_t i=0;i<vl;i++)if(m.lane[i])a.lane[i]=x;return a; }
