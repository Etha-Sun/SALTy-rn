#include "shim.h"
/* memcpy is C-defined bit transport, not pointer type punning. */
float32x4_t vdupq_n_f32(float x) { float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=x;return r; }
int32x4_t vmovq_n_s32(int32_t x) { int32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=x;return r; }
uint32x4_t vmovq_n_u32(uint32_t x) { uint32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=x;return r; }
int32x4_t vreinterpretq_s32_f32(float32x4_t a) { int32x4_t r;for(size_t i=0;i<4;i++)memcpy(&r.lane[i],&a.lane[i],4);return r; }
float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=bits_float(a.lane[i]);return r; }
uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b) { uint32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=a.lane[i]<b.lane[i]?UINT32_MAX:0;return r; }
uint32x4_t vorrq_u32(uint32x4_t a,uint32x4_t b) { uint32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=a.lane[i]|b.lane[i];return r; }
float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b) { float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=bits_float((m.lane[i]&float_bits(a.lane[i]))|(~m.lane[i]&float_bits(b.lane[i])));return r; }
float32x4_t vabsq_f32(float32x4_t a) { float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=bits_float(float_bits(a.lane[i])&UINT32_C(0x7fffffff));return r; }
uint32x4_t vcaltq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=bits_float(float_bits(a.lane[i])&UINT32_C(0x7fffffff))<bits_float(float_bits(b.lane[i])&UINT32_C(0x7fffffff))?UINT32_MAX:0;return r; }
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a) { vint32m8_t r;for(size_t i=0;i<RVV_CAP;i++)memcpy(&r.lane[i],&a.lane[i],4);return r; }
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a) { vuint32m8_t r;for(size_t i=0;i<RVV_CAP;i++)r.lane[i]=float_bits(a.lane[i]);return r; }
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a) { vfloat32m8_t r;for(size_t i=0;i<RVV_CAP;i++)r.lane[i]=bits_float(a.lane[i]);return r; }
vbool4_t __riscv_vmslt_vx_i32m8_b4(vint32m8_t a,int32_t b,size_t vl) { vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b;return r; }
vbool4_t __riscv_vmfgt_vf_f32m8_b4(vfloat32m8_t a,float b,size_t vl) { vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>b;return r; }
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=bits_float(float_bits(a.lane[i])&UINT32_C(0x7fffffff));return r; }
vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=f32_add(a.lane[i],b);return r; }
vfloat32m8_t __riscv_vfsub_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=f32_sub(a.lane[i],b);return r; }
vfloat32m8_t __riscv_vfsgnj_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=bits_float((float_bits(a.lane[i])&UINT32_C(0x7fffffff))|(float_bits(b.lane[i])&UINT32_C(0x80000000)));return r; }
vuint32m8_t __riscv_vor_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]|b;return r; }
