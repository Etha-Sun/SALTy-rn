#include "shim.h"
int16_t sat16(int64_t x) { return x>32767?32767:x< -32768?-32768:(int16_t)x; }
uint8_t satu8(int64_t x) { return x>255?255:x<0?0:(uint8_t)x; }
int32_t wrap32(uint64_t x) { uint32_t u=(uint32_t)x; return u<=INT32_MAX?(int32_t)u:(int32_t)(-1-(int64_t)(UINT32_MAX-u)); }
int64_t asr64(int64_t x, unsigned s) { if(!s)return x; if(s>=63)return x<0?-1:0; return x>=0?x/((int64_t)1<<s):-1-((-1-x)/((int64_t)1<<s)); }
int64_t round_shift(int64_t x, unsigned s, int mode) { if(!s)return x; if(s>=63)return 0; int64_t q=asr64(x,s); if(mode==0 && ((uint64_t)x & ((uint64_t)1<<(s-1)))) q++; return q; }
uint8x8_t vdup_n_u8(uint8_t x) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
uint8x8_t vld1_u8(const uint8_t *p) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
void vst1_u8(uint8_t *p, uint8x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i]; return r; }
void vst1_lane_u8(uint8_t *p,uint8x8_t a,int n) { *p=a.lane[n]; }
uint8x8_t vext_u8(uint8x8_t a,uint8x8_t b,int n) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i+(size_t)n<8?a.lane[i+n]:b.lane[i+n-8]; return r; }
int16x8_t vdupq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i<4?a.lane[i]:b.lane[i-4]; return r; }
void vst1_lane_u16(void *p,uint16x4_t a,int n) { unsigned char *q=p; uint16_t x=a.lane[n]; for(size_t i=0;i<2;i++)q[i]=(unsigned char)(x>>(8*i)); }
int32x4_t vdupq_n_s32(int32_t x) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
int32x4_t vmulq_s32(int32x4_t a, int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]*(uint64_t)(int64_t)b.lane[i]); return r; }
void vst1_lane_u32(void *p,uint32x2_t a,int n) { unsigned char *q=p; uint32_t x=a.lane[n]; for(size_t i=0;i<4;i++)q[i]=(unsigned char)(x>>(8*i)); }
int16x8_t vreinterpretq_s16_u16(uint16x8_t a) { int16x8_t r; memcpy(&r,&a,sizeof r); return r; }
uint16x4_t vreinterpret_u16_u8(uint8x8_t a) { uint16x4_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x2_t vreinterpret_u32_u8(uint8x8_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
int32x4_t vmovl_s16(int16x4_t a) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
uint16x8_t vsubl_u8(uint8x8_t a,uint8x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]-b.lane[i]; return r; }
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b.lane[i]); return r; }
int16x4_t vqmovn_s32(int32x4_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=sat16(a.lane[i]); return r; }
uint8x8_t vqmovun_s16(int16x8_t a) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=satu8(a.lane[i]); return r; }
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]*(uint64_t)(int64_t)c.lane[i]); return r; }
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(int8_t)b.lane[i]>=0?((int8_t)b.lane[i]>=32?0:wrap32((uint64_t)(uint32_t)a.lane[i]<<(int8_t)b.lane[i])):wrap32((uint64_t)round_shift(a.lane[i],-(int8_t)b.lane[i],0)); return r; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse8_v_u8m2(uint8_t *p,vuint8m2_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint8m2_t __riscv_vmaxu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vuint8m2_t __riscv_vminu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]<b?a.lane[i]:b; return r; }
vint16m4_t __riscv_vmax_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b); return r; }
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]*(uint64_t)(int64_t)b); return r; }
vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,unsigned s,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(uint32_t)a.lane[i]<<(s&31)); return r; }
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vuint16m4_t __riscv_vwsubu_vx_u16m4(vuint8m2_t a,uint8_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int64_t)a.lane[i]-b; return r; }
vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b*(uint64_t)(int64_t)c.lane[i]); return r; }
vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,unsigned s,int mode,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)round_shift(a.lane[i],s&31,mode)); return r; }
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned s,int mode,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16(round_shift(a.lane[i],s&31,mode)); return r; }
vuint8m2_t __riscv_vnclipu_wx_u8m2(vuint16m4_t a,unsigned s,int mode,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=satu8(round_shift(a.lane[i],s&15,mode)); return r; }
vint16m4_t __riscv_vreinterpret_v_u16m4_i16m4(vuint16m4_t a) { vint16m4_t r; memcpy(&r,&a,sizeof r); return r; }
vuint16m4_t __riscv_vreinterpret_v_i16m4_u16m4(vint16m4_t a) { vuint16m4_t r; memcpy(&r,&a,sizeof r); return r; }
