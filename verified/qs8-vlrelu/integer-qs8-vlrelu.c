#include "shim.h"
int16_t sat16(int64_t x) { return x>32767?32767:x< -32768?-32768:(int16_t)x; }
int8_t sat8(int64_t x) { return x>127?127:x< -128?-128:(int8_t)x; }
int16_t wrap16(uint64_t x) { uint16_t u=(uint16_t)x; return u<=INT16_MAX?(int16_t)u:(int16_t)(-1-(int64_t)(UINT16_MAX-u)); }
int64_t asr64(int64_t x, unsigned s) { if(!s)return x; if(s>=63)return x<0?-1:0; return x>=0?x/((int64_t)1<<s):-1-((-1-x)/((int64_t)1<<s)); }
int64_t round_shift(int64_t x, unsigned s, int mode) { if(!s)return x; if(s>=63)return 0; int64_t q=asr64(x,s); if(mode==0 && ((uint64_t)x & ((uint64_t)1<<(s-1)))) q++; return q; }
int8x8_t vld1_s8(const int8_t *p) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
void vst1_s8(int8_t *p, int8x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
void vst1_lane_s8(int8_t *p,int8x8_t a,int n) { *p=a.lane[n]; }
int8x8_t vext_s8(int8x8_t a,int8x8_t b,int n) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i+(size_t)n<8?a.lane[i+n]:b.lane[i+n-8]; return r; }
int16x8_t vdupq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x8_t vmovq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
void vst1_lane_u16(void *p,uint16x4_t a,int n) { unsigned char *q=p; uint16_t x=a.lane[n]; for(size_t i=0;i<2;i++)q[i]=(unsigned char)(x>>(8*i)); }
void vst1_lane_u32(void *p,uint32x2_t a,int n) { unsigned char *q=p; uint32_t x=a.lane[n]; for(size_t i=0;i<4;i++)q[i]=(unsigned char)(x>>(8*i)); }
uint16x4_t vreinterpret_u16_s8(int8x8_t a) { uint16x4_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x2_t vreinterpret_u32_s8(int8x8_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
int16x8_t vsubw_s8(int16x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]-b.lane[i])); return r; }
int8x8_t vqmovn_s16(int16x8_t a) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat8(a.lane[i]); return r; }
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b.lane[i]); return r; }
int16x8_t vshlq_n_s16(int16x8_t a,int n) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)(uint16_t)a.lane[i]<<n); return r; }
int16x8_t vqrdmulhq_s16(int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat16(round_shift((int64_t)a.lane[i]*b.lane[i],15,0)); return r; }
uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?65535:0; return r; }
int16x8_t vbslq_s16(uint16x8_t m,int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16(((uint16_t)a.lane[i]&m.lane[i])|((uint16_t)b.lane[i]&~m.lane[i])); return r; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse8_v_i8m2(int8_t *p,vint8m2_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint16m4_t __riscv_vsll_vx_i16m4(vint16m4_t a,unsigned s,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)(uint16_t)a.lane[i]<<(s&15)); return r; }
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b); return r; }
vint16m4_t __riscv_vrsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)((int64_t)b-a.lane[i])); return r; }
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int32_t)a.lane[i]*b.lane[i]; return r; }
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned s,int mode,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat8(round_shift(a.lane[i],s&15,mode)); return r; }
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned s,int mode,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16(round_shift(a.lane[i],s&31,mode)); return r; }
vbool4_t __riscv_vmslt_vx_i16m4_b4(vint16m4_t a,int16_t b,size_t vl) { vbool4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]<b; return r; }
vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t mask,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=mask.lane[i]?b:a.lane[i]; return r; }
