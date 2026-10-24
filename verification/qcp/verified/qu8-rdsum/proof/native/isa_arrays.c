#include "shim.h"
uint8x8_t vld1_u8(const uint8_t *p) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
uint8x16_t vld1q_u8(const uint8_t *p) { uint8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=p[i]; return r; }
uint8x8_t vget_low_u8(uint8x16_t a) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]; return r; }
uint16x8_t vmovq_n_u16(uint16_t x) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
uint16x4_t vget_low_u16(uint16x8_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
uint16x4_t vget_high_u16(uint16x8_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
uint32x2_t vld1_u32(const uint32_t *p) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=p[i]; return r; }
void vst1_u32(uint32_t *p, uint32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
uint32x2_t vadd_u32(uint32x2_t a, uint32x2_t b) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
uint32x4_t vld1q_u32(const uint32_t *p) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
void vst1q_u32(uint32_t *p, uint32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint32_t vgetq_lane_u32(uint32x4_t a,int n) { return a.lane[n]; }
uint32x4_t vextq_u32(uint32x4_t a,uint32x4_t b,int n) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
uint32x2_t vget_low_u32(uint32x4_t a) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]+b.lane[i]; return r; }
uint32x4_t vaddw_u16(uint32x4_t a,uint16x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(int64_t)a.lane[i]+b.lane[i]; return r; }
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
vuint16m4_t __riscv_vmv_v_x_u16m4(uint16_t x,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vuint32m8_t __riscv_vadd_vv_u32m8(vuint32m8_t a,vuint32m8_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint16m4_t __riscv_vwaddu_wv_u16m4(vuint16m4_t a,vuint8m2_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint32m8_t __riscv_vwaddu_wv_u32m8(vuint32m8_t a,vuint16m4_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
