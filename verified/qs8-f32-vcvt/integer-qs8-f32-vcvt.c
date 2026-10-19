#include "shim.h"
int16_t wrap16(uint64_t x) { uint16_t u=(uint16_t)x; return u<=INT16_MAX?(int16_t)u:(int16_t)(-1-(int64_t)(UINT16_MAX-u)); }
int8x8_t vld1_s8(const int8_t *p) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
int16x8_t vdupq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
void vst1_f32(float *p, float32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
void vst1_lane_f32(float *p,float32x2_t a,int n) { *p=a.lane[n]; }
float32x4_t vdupq_n_f32(float x) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
void vst1q_f32(float *p, float32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]*b.lane[i]; return r; }
float32x2_t vget_low_f32(float32x4_t a) { float32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
float32x2_t vget_high_f32(float32x4_t a) { float32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i+2]; return r; }
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
int32x4_t vmovl_s16(int16x4_t a) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(float)a.lane[i]; return r; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)(int64_t)a.lane[i]-(uint64_t)(int64_t)b); return r; }
void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(float)a.lane[i]; return r; }
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]*b; return r; }
