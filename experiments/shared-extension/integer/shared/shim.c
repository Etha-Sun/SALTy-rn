#include "shim.h"
int16_t sat16(int64_t x) { return x>32767?32767:x< -32768?-32768:(int16_t)x; }
int8_t sat8(int64_t x) { return x>127?127:x< -128?-128:(int8_t)x; }
uint8_t satu8(int64_t x) { return x>255?255:x<0?0:(uint8_t)x; }
int32_t sat32(int64_t x) { return x>INT32_MAX?INT32_MAX:x<INT32_MIN?INT32_MIN:(int32_t)x; }
int8_t wrap8(uint64_t x) { uint8_t u=(uint8_t)x; return u<=INT8_MAX?(int8_t)u:(int8_t)(-1-(int64_t)(UINT8_MAX-u)); }
int16_t wrap16(uint64_t x) { uint16_t u=(uint16_t)x; return u<=INT16_MAX?(int16_t)u:(int16_t)(-1-(int64_t)(UINT16_MAX-u)); }
int32_t wrap32(uint64_t x) { uint32_t u=(uint32_t)x; return u<=INT32_MAX?(int32_t)u:(int32_t)(-1-(int64_t)(UINT32_MAX-u)); }
int64_t asr64(int64_t x, unsigned s) { if(!s)return x; if(s>=63)return x<0?-1:0; return x>=0?x/((int64_t)1<<s):-1-((-1-x)/((int64_t)1<<s)); }
int64_t round_shift(int64_t x, unsigned s, int mode) { if(!s)return x; if(s>=63)return 0; int64_t q=asr64(x,s); if(mode==0 && ((uint64_t)x & ((uint64_t)1<<(s-1)))) q++; return q; }
int8x8_t vdup_n_s8(int8_t x) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int8x8_t vld1_s8(const int8_t *p) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
void vst1_s8(int8_t *p, int8x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
int8x8_t vmax_s8(int8x8_t a, int8x8_t b) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
int8x8_t vmin_s8(int8x8_t a, int8x8_t b) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i]; return r; }
void vst1_lane_s8(int8_t *p,int8x8_t a,int n) { *p=a.lane[n]; }
int8x8_t vext_s8(int8x8_t a,int8x8_t b,int n) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i+(size_t)n<8?a.lane[i+n]:b.lane[i+n-8]; return r; }
int8x16_t vdupq_n_s8(int8_t x) { int8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=x; return r; }
void vst1q_s8(int8_t *p, int8x16_t a) { for(size_t i=0;i<16;i++)p[i]=a.lane[i]; }
int8x16_t vmaxq_s8(int8x16_t a, int8x16_t b) { int8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
int8x16_t vminq_s8(int8x16_t a, int8x16_t b) { int8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i]; return r; }
int8x8_t vget_low_s8(int8x16_t a) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]; return r; }
int8x16_t vcombine_s8(int8x8_t a,int8x8_t b) { int8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=i<8?a.lane[i]:b.lane[i-8]; return r; }
uint8x8_t vdup_n_u8(uint8_t x) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
uint8x8_t vld1_u8(const uint8_t *p) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
void vst1_u8(uint8_t *p, uint8x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i]; return r; }
void vst1_lane_u8(uint8_t *p,uint8x8_t a,int n) { *p=a.lane[n]; }
uint8x8_t vext_u8(uint8x8_t a,uint8x8_t b,int n) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i+(size_t)n<8?a.lane[i+n]:b.lane[i+n-8]; return r; }
uint8x16_t vld1q_u8(const uint8_t *p) { uint8x16_t r = {0}; for(size_t i=0;i<16;i++) r.lane[i]=p[i]; return r; }
uint8x8_t vget_low_u8(uint8x16_t a) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]; return r; }
int16x8_t vdupq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x8_t vmovq_n_s16(int16_t x) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i<4?a.lane[i]:b.lane[i-4]; return r; }
void vst1_u16(uint16_t *p, uint16x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
uint16x4_t vadd_u16(uint16x4_t a, uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
void vst1_lane_u16(void *p,uint16x4_t a,int n) { unsigned char *q=p; uint16_t x=a.lane[n]; for(size_t i=0;i<2;i++)q[i]=(unsigned char)(x>>(8*i)); }
uint16x4_t vext_u16(uint16x4_t a,uint16x4_t b,int n) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
uint16x4_t vand_u16(uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
uint16x4_t vorr_u16(uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
uint16x8_t vdupq_n_u16(uint16_t x) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
uint16x8_t vmovq_n_u16(uint16_t x) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
void vst1q_u16(uint16_t *p, uint16x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
uint16x8_t vaddq_u16(uint16x8_t a, uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint16x4_t vget_low_u16(uint16x8_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
uint16x4_t vget_high_u16(uint16x8_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
uint16x8_t vcombine_u16(uint16x4_t a,uint16x4_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i<4?a.lane[i]:b.lane[i-4]; return r; }
uint16x8_t vandq_u16(uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
uint16x8_t vorrq_u16(uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
int32x2_t vld1_s32(const int32_t *p) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=p[i]; return r; }
void vst1_s32(int32_t *p, int32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
int32x2_t vadd_s32(int32x2_t a, int32x2_t b) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
int32x4_t vdupq_n_s32(int32_t x) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
int32x4_t vld1q_s32(const int32_t *p) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
void vst1q_s32(int32_t *p, int32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
int32x4_t vaddq_s32(int32x4_t a, int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
int32x4_t vmulq_s32(int32x4_t a, int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]*(uint64_t)(int64_t)b.lane[i]); return r; }
int32_t vgetq_lane_s32(int32x4_t a,int n) { return a.lane[n]; }
int32x4_t vextq_s32(int32x4_t a,int32x4_t b,int n) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
int32x2_t vget_low_s32(int32x4_t a) { int32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
uint32x2_t vld1_u32(const uint32_t *p) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=p[i]; return r; }
void vst1_u32(uint32_t *p, uint32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
uint32x2_t vadd_u32(uint32x2_t a, uint32x2_t b) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
void vst1_lane_u32(void *p,uint32x2_t a,int n) { unsigned char *q=p; uint32_t x=a.lane[n]; for(size_t i=0;i<4;i++)q[i]=(unsigned char)(x>>(8*i)); }
uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
uint32x4_t vld1q_u32(const uint32_t *p) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
void vst1q_u32(uint32_t *p, uint32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint32x4_t vmaxq_u32(uint32x4_t a, uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
uint32_t vgetq_lane_u32(uint32x4_t a,int n) { return a.lane[n]; }
uint32x4_t vextq_u32(uint32x4_t a,uint32x4_t b,int n) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
uint32x2_t vget_low_u32(uint32x4_t a) { uint32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
void vst1_f32(float *p, float32x2_t a) { for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
void vst1_lane_f32(float *p,float32x2_t a,int n) { *p=a.lane[n]; }
float32x4_t vdupq_n_f32(float x) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
float32x4_t vld1q_f32(const float *p) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
void vst1q_f32(float *p, float32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]*b.lane[i]; return r; }
float32x2_t vget_low_f32(float32x4_t a) { float32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
float32x2_t vget_high_f32(float32x4_t a) { float32x2_t r = {0}; for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i+2]; return r; }
int16x8_t vreinterpretq_s16_u16(uint16x8_t a) { int16x8_t r; memcpy(&r,&a,sizeof r); return r; }
uint16x4_t vreinterpret_u16_s8(int8x8_t a) { uint16x4_t r; memcpy(&r,&a,sizeof r); return r; }
uint16x4_t vreinterpret_u16_u8(uint8x8_t a) { uint16x4_t r; memcpy(&r,&a,sizeof r); return r; }
uint16x8_t vreinterpretq_u16_s16(int16x8_t a) { uint16x8_t r; memcpy(&r,&a,sizeof r); return r; }
int32x4_t vreinterpretq_s32_f32(float32x4_t a) { int32x4_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x2_t vreinterpret_u32_s8(int8x8_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x2_t vreinterpret_u32_u8(uint8x8_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x2_t vreinterpret_u32_u16(uint16x4_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x4_t vreinterpretq_u32_f32(float32x4_t a) { uint32x4_t r; memcpy(&r,&a,sizeof r); return r; }
float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r; memcpy(&r,&a,sizeof r); return r; }
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
int16x8_t vsubw_s8(int16x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]-b.lane[i])); return r; }
int16x8_t vsubl_s8(int8x8_t a,int8x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]-b.lane[i]; return r; }
int32x4_t vmovl_s16(int16x4_t a) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
int32x4_t vaddw_s16(int32x4_t a,int16x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
int32x4_t vmull_s16(int16x4_t a,int16x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(int64_t)a.lane[i]*b.lane[i]; return r; }
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]+b.lane[i]; return r; }
uint16x8_t vsubl_u8(uint8x8_t a,uint8x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]-b.lane[i]; return r; }
uint32x4_t vaddw_u16(uint32x4_t a,uint16x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(int64_t)a.lane[i]+b.lane[i]; return r; }
int8x8_t vqmovn_s16(int16x8_t a) { int8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat8(a.lane[i]); return r; }
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b.lane[i]); return r; }
int16x4_t vqmovn_s32(int32x4_t a) { int16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=sat16(a.lane[i]); return r; }
int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=sat32((int64_t)a.lane[i]-b.lane[i]); return r; }
uint8x8_t vqmovun_s16(int16x8_t a) { uint8x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=satu8(a.lane[i]); return r; }
int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i<4?a.lane[i]:sat16(b.lane[i-4]); return r; }
int16x8_t vshlq_n_s16(int16x8_t a,int n) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16((uint64_t)(uint16_t)a.lane[i]<<n); return r; }
int16x8_t vqrdmulhq_s16(int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=sat16(round_shift((int64_t)a.lane[i]*b.lane[i],15,0)); return r; }
uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?65535:0; return r; }
int16x8_t vbslq_s16(uint16x8_t m,int16x8_t a,int16x8_t b) { int16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=wrap16(((uint16_t)a.lane[i]&m.lane[i])|((uint16_t)b.lane[i]&~m.lane[i])); return r; }
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]*(uint64_t)(int64_t)c.lane[i]); return r; }
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b) { int32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(int8_t)b.lane[i]>=0?((int8_t)b.lane[i]>=32?0:wrap32((uint64_t)(uint32_t)a.lane[i]<<(int8_t)b.lane[i])):wrap32((uint64_t)round_shift(a.lane[i],-(int8_t)b.lane[i],0)); return r; }
float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(float)a.lane[i]; return r; }
float32x4_t vabsq_f32(float32x4_t a) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=fabsf(a.lane[i]); return r; }
uint32x4_t vcgtq_u32(uint32x4_t a,uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]>b.lane[i]?UINT32_MAX:0; return r; }
uint16x4_t vmovn_u32(uint32x4_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(uint16_t)a.lane[i]; return r; }
uint16x4_t vshrn_n_u32(uint32x4_t a,int n) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(uint16_t)(a.lane[i]>>n); return r; }
uint16x4_t vbsl_u16(uint16x4_t m,uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(a.lane[i]&m.lane[i])|(b.lane[i]&~m.lane[i]); return r; }
uint16x8_t vbslq_u16(uint16x8_t m,uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(a.lane[i]&m.lane[i])|(b.lane[i]&~m.lane[i]); return r; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse8_v_i8m2(int8_t *p,vint8m2_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]<b?a.lane[i]:b; return r; }
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse8_v_u8m2(uint8_t *p,vuint8m2_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint8m2_t __riscv_vmaxu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vuint8m2_t __riscv_vminu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]<b?a.lane[i]:b; return r; }
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)(int64_t)a.lane[i]-(uint64_t)(int64_t)b); return r; }
vint16m4_t __riscv_vmax_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vint16m4_t __riscv_vsll_vx_i16m4(vint16m4_t a,unsigned s,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)(uint16_t)a.lane[i]<<(s&15)); return r; }
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16((int64_t)a.lane[i]+b); return r; }
vint16m4_t __riscv_vrsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)((int64_t)b-a.lane[i])); return r; }
void __riscv_vse16_v_u16m4(uint16_t *p,vuint16m4_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint16m4_t __riscv_vmv_v_x_u16m4(uint16_t x,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vuint16m4_t __riscv_vadd_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b; return r; }
vuint16m4_t __riscv_vadd_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint16m4_t __riscv_vand_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]&b; return r; }
vuint16m4_t __riscv_vor_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse32_v_i32m8(int32_t *p,vint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vint32m8_t __riscv_vadd_vx_i32m8(vint32m8_t a,int32_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b); return r; }
vint32m8_t __riscv_vadd_vv_i32m8(vint32m8_t a,vint32m8_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b.lane[i]); return r; }
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]*(uint64_t)(int64_t)b); return r; }
vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,unsigned s,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(uint32_t)a.lane[i]<<(s&31)); return r; }
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=x; return r; }
vuint32m8_t __riscv_vadd_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b; return r; }
vuint32m8_t __riscv_vadd_vv_u32m8(vuint32m8_t a,vuint32m8_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint32m8_t __riscv_vand_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]&b; return r; }
vuint32m8_t __riscv_vmaxu_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vint16m4_t __riscv_vwadd_wv_i16m4(vint16m4_t a,vint8m2_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap16((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
vint16m4_t __riscv_vwsub_vx_i16m4(vint8m2_t a,int8_t b,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int64_t)a.lane[i]-b; return r; }
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vint32m8_t __riscv_vwadd_wv_i32m8(vint32m8_t a,vint16m4_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)((int64_t)a.lane[i]+b.lane[i])); return r; }
vuint16m4_t __riscv_vzext_vf2_u16m4(vuint8m2_t a,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
vuint16m4_t __riscv_vwaddu_wv_u16m4(vuint16m4_t a,vuint8m2_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint16m4_t __riscv_vwsubu_vx_u16m4(vuint8m2_t a,uint8_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int64_t)a.lane[i]-b; return r; }
vuint32m8_t __riscv_vwaddu_wv_u32m8(vuint32m8_t a,vuint16m4_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vint32m8_t __riscv_vwmul_vx_i32m8(vint16m4_t a,int16_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int32_t)a.lane[i]*b; return r; }
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(int32_t)a.lane[i]*b.lane[i]; return r; }
vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)(int64_t)a.lane[i]+(uint64_t)(int64_t)b*(uint64_t)(int64_t)c.lane[i]); return r; }
vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,unsigned s,int mode,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=wrap32((uint64_t)round_shift(a.lane[i],s&31,mode)); return r; }
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned s,int mode,size_t vl) { vint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat8(round_shift(a.lane[i],s&15,mode)); return r; }
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned s,int mode,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=sat16(round_shift(a.lane[i],s&31,mode)); return r; }
vuint8m2_t __riscv_vnclipu_wx_u8m2(vuint16m4_t a,unsigned s,int mode,size_t vl) { vuint8m2_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=satu8(round_shift(a.lane[i],s&15,mode)); return r; }
vbool4_t __riscv_vmslt_vx_i16m4_b4(vint16m4_t a,int16_t b,size_t vl) { vbool4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]<b; return r; }
vbool4_t __riscv_vmsgtu_vx_u32m8_b4(vuint32m8_t a,uint32_t b,size_t vl) { vbool4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b; return r; }
vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t mask,size_t vl) { vint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=mask.lane[i]?b:a.lane[i]; return r; }
vuint16m4_t __riscv_vmerge_vxm_u16m4(vuint16m4_t a,uint16_t b,vbool4_t mask,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=mask.lane[i]?b:a.lane[i]; return r; }
vuint16m4_t __riscv_vnsrl_wx_u16m4(vuint32m8_t a,unsigned s,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(uint16_t)(a.lane[i]>>(s&31)); return r; }
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(float)a.lane[i]; return r; }
int32_t rvv_f32_i32(float x) { if(isnan(x))return INT32_MAX; if(x>=2147483648.0f)return INT32_MAX; if(x< -2147483648.0f)return INT32_MIN; return (int32_t)nearbyintf(x); }
vint32m8_t __riscv_vfcvt_x_f_v_i32m8(vfloat32m8_t a,size_t vl) { vint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=rvv_f32_i32(a.lane[i]); return r; }
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]*b; return r; }
vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=fabsf(a.lane[i]); return r; }
vint16m4_t __riscv_vreinterpret_v_u16m4_i16m4(vuint16m4_t a) { vint16m4_t r; memcpy(&r,&a,sizeof r); return r; }
vuint16m4_t __riscv_vreinterpret_v_i16m4_u16m4(vint16m4_t a) { vuint16m4_t r; memcpy(&r,&a,sizeof r); return r; }
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a) { vuint32m8_t r; memcpy(&r,&a,sizeof r); return r; }
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a) { vfloat32m8_t r; memcpy(&r,&a,sizeof r); return r; }
vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r={0}; for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]+b; return r; }
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a) { vint32m8_t r; memcpy(&r,&a,sizeof r); return r; }
vint32m8_t __riscv_vssub_vx_i32m8(vint32m8_t a,int32_t b,size_t vl) { vint32m8_t r={0}; for(size_t i=0;i<vl;i++)r.lane[i]=sat32((int64_t)a.lane[i]-b); return r; }
