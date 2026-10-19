#include "shim.h"
int16_t wrap16(uint64_t x) { uint16_t u=(uint16_t)x; return u<=INT16_MAX?(int16_t)u:(int16_t)(-1-(int64_t)(UINT16_MAX-u)); }
int32_t wrap32(uint64_t x) { uint32_t u=(uint32_t)x; return u<=INT32_MAX?(int32_t)u:(int32_t)(-1-(int64_t)(UINT32_MAX-u)); }
int8x8_t vld1_s8(const int8_t *p) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
int16x8_t vmovq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
int32x2_t vld1_s32(const int32_t *p) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=p[i]; return r; }
void vst1_s32(int32_t *p, int32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
int32x2_t vadd_s32(int32x2_t a, int32x2_t b) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
int32x4_t vdupq_n_s32(int32_t x) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
int32x4_t vld1q_s32(const int32_t *p) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
void vst1q_s32(int32_t *p, int32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
int32x4_t vaddq_s32(int32x4_t a, int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
int32_t vgetq_lane_s32(int32x4_t a,int n) { return a.lane[n]; }
int32x4_t vextq_s32(int32x4_t a,int32x4_t b,int n) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
int32x2_t vget_low_s32(int32x4_t a) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
int32x4_t vaddw_s16(int32x4_t a,int16x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse32_v_i32m8(int32_t *p,vint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint32m8_t __riscv_vadd_vv_i32m8(vint32m8_t a,vint32m8_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
vint16m4_t __riscv_vwadd_wv_i16m4(vint16m4_t a,vint8m2_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
vint32m8_t __riscv_vwadd_wv_i32m8(vint32m8_t a,vint16m4_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
