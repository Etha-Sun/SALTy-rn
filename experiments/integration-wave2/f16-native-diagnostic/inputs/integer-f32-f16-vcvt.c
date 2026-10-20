#include "shim.h"
void vst1_u16(uint16_t *p, uint16x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
uint16x4_t vadd_u16(uint16x4_t a, uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
void vst1_lane_u16(void *p,uint16x4_t a,int n) { unsigned char *q=p; uint16_t x=a.lane[n]; for(size_t i=0;i<2;i++)q[i]=(unsigned char)(x>>(8*i)); }
uint16x4_t vext_u16(uint16x4_t a,uint16x4_t b,int n) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=i+(size_t)n<4?a.lane[i+n]:b.lane[i+n-4]; return r; }
uint16x4_t vand_u16(uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
uint16x4_t vorr_u16(uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
uint16x8_t vdupq_n_u16(uint16_t x) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
void vst1q_u16(uint16_t *p, uint16x8_t a) { for(size_t i=0;i<8;i++)p[i]=a.lane[i]; }
uint16x8_t vaddq_u16(uint16x8_t a, uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint16x4_t vget_low_u16(uint16x8_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
uint16x8_t vcombine_u16(uint16x4_t a,uint16x4_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=i<4?a.lane[i]:b.lane[i-4]; return r; }
uint16x8_t vandq_u16(uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
uint16x8_t vorrq_u16(uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
void vst1_lane_u32(void *p,uint32x2_t a,int n) { unsigned char *q=p; uint32_t x=a.lane[n]; for(size_t i=0;i<4;i++)q[i]=(unsigned char)(x>>(8*i)); }
uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
uint32x4_t vmaxq_u32(uint32x4_t a, uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i]; return r; }
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]&b.lane[i]; return r; }
float32x4_t vdupq_n_f32(float x) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
float32x4_t vld1q_f32(const float *p) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=p[i]; return r; }
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]*b.lane[i]; return r; }
uint32x2_t vreinterpret_u32_u16(uint16x4_t a) { uint32x2_t r; memcpy(&r,&a,sizeof r); return r; }
uint32x4_t vreinterpretq_u32_f32(float32x4_t a) { uint32x4_t r; memcpy(&r,&a,sizeof r); return r; }
float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r; memcpy(&r,&a,sizeof r); return r; }
float32x4_t vabsq_f32(float32x4_t a) { float32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=fabsf(a.lane[i]); return r; }
uint32x4_t vcgtq_u32(uint32x4_t a,uint32x4_t b) { uint32x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]>b.lane[i]?UINT32_MAX:0; return r; }
uint16x4_t vmovn_u32(uint32x4_t a) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(uint16_t)a.lane[i]; return r; }
uint16x4_t vshrn_n_u32(uint32x4_t a,int n) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(uint16_t)(a.lane[i]>>n); return r; }
uint16x4_t vbsl_u16(uint16x4_t m,uint16x4_t a,uint16x4_t b) { uint16x4_t r = {0}; for(size_t i=0;i<4;i++) r.lane[i]=(a.lane[i]&m.lane[i])|(b.lane[i]&~m.lane[i]); return r; }
uint16x8_t vbslq_u16(uint16x8_t m,uint16x8_t a,uint16x8_t b) { uint16x8_t r = {0}; for(size_t i=0;i<8;i++) r.lane[i]=(a.lane[i]&m.lane[i])|(b.lane[i]&~m.lane[i]); return r; }
void __riscv_vse16_v_u16m4(uint16_t *p,vuint16m4_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
vuint16m4_t __riscv_vadd_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vuint16m4_t __riscv_vand_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]&b; return r; }
vuint16m4_t __riscv_vor_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]|b.lane[i]; return r; }
size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }
vuint32m8_t __riscv_vadd_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b; return r; }
vuint32m8_t __riscv_vand_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]&b; return r; }
vuint32m8_t __riscv_vmaxu_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl) { vuint32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b?a.lane[i]:b; return r; }
vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
vbool4_t __riscv_vmsgtu_vx_u32m8_b4(vuint32m8_t a,uint32_t b,size_t vl) { vbool4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]>b; return r; }
vuint16m4_t __riscv_vmerge_vxm_u16m4(vuint16m4_t a,uint16_t b,vbool4_t mask,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=mask.lane[i]?b:a.lane[i]; return r; }
vuint16m4_t __riscv_vnsrl_wx_u16m4(vuint32m8_t a,unsigned s,size_t vl) { vuint16m4_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=(uint16_t)(a.lane[i]>>(s&31)); return r; }
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]*b; return r; }
vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b.lane[i]; return r; }
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl) { vfloat32m8_t r = {0}; for(size_t i=0;i<vl;i++) r.lane[i]=fabsf(a.lane[i]); return r; }
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a) { vuint32m8_t r; memcpy(&r,&a,sizeof r); return r; }
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a) { vfloat32m8_t r; memcpy(&r,&a,sizeof r); return r; }
