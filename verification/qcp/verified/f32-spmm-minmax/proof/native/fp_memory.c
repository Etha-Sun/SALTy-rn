#include "fp_primitives.h"

float32x4_t vld1q_f32(const float *p) {
  float32x4_t r; for(size_t i=0;i<4;i++)r.lane[i]=p[i]; return r;
}

float32x2_t vld1_f32(const float *p) {
  float32x2_t r; for(size_t i=0;i<2;i++)r.lane[i]=p[i]; return r;
}

float32x4_t vdupq_n_f32(float x) {
  float32x4_t r; for(size_t i=0;i<4;i++)r.lane[i]=x; return r;
}

float32x4_t vld1q_dup_f32(const float *p) { return vdupq_n_f32(*p); }

float32x4_t vdupq_lane_f32(float32x2_t v,int lane) { return vdupq_n_f32(v.lane[lane]); }

void vst1q_f32(float *p,float32x4_t v) { for(size_t i=0;i<4;i++)p[i]=v.lane[i]; }

void vst1_f32(float *p,float32x2_t v) { for(size_t i=0;i<2;i++)p[i]=v.lane[i]; }

void vst1_lane_f32(float *p,float32x2_t v,int lane) { *p=v.lane[lane]; }

float32x2_t vget_low_f32(float32x4_t v) { float32x2_t r={{v.lane[0],v.lane[1]}};return r; }

float32x2_t vget_high_f32(float32x4_t v) { float32x2_t r={{v.lane[2],v.lane[3]}};return r; }

size_t __riscv_vsetvl_e32m4(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }

float32x4_t vmovq_n_f32(float x) { return vdupq_n_f32(x); }

float32x2_t vld1_dup_f32(const float *p) { float32x2_t r={{*p,*p}};return r; }

float32x4x2_t vld2q_dup_f32(const float *p) { float32x4x2_t r={{vdupq_n_f32(p[0]),vdupq_n_f32(p[1])}};return r; }

float32x2x2_t vld2_dup_f32(const float *p) { float32x2x2_t r={{vld1_dup_f32(p),vld1_dup_f32(p+1)}};return r; }

float32x4_t vcombine_f32(float32x2_t a,float32x2_t b) { float32x4_t r={{a.lane[0],a.lane[1],b.lane[0],b.lane[1]}};return r; }

float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int n) { float32x4_t r;for(int i=0;i<4;i++)r.lane[i]=i+n<4?a.lane[i+n]:b.lane[i+n-4];return r; }

float vget_lane_f32(float32x2_t a,int n) { return a.lane[n]; }

float32x4_t vld1q_lane_f32(const float *p,float32x4_t a,int n) { a.lane[n]=*p;return a; }

void vst1q_lane_f32(float *p,float32x4_t a,int n) { *p=a.lane[n]; }

float32x4_t vzip1q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[0],b.lane[0],a.lane[1],b.lane[1]}};return r; }

float32x4_t vzip2q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[2],b.lane[2],a.lane[3],b.lane[3]}};return r; }

size_t __riscv_vsetvlmax_e32m4(void) { return 16; }

size_t __riscv_vsetvl_e32m1(size_t n) { return n<4?n:4; }

size_t __riscv_vsetvlmax_e32m1(void) { return 4; }

size_t __riscv_vsetvl_e32m2(size_t n) { return n<8?n:8; }

size_t __riscv_vsetvlmax_e32m2(void) { return 8; }

size_t __riscv_vsetvl_e32m8(size_t n) {
#ifdef BALANCED_VL
 return n<=32?n:(n<64?(n+1)/2:32);
#else
 return n<32?n:32;
#endif
}

size_t __riscv_vsetvlmax_e32m8(void) { return 32; }

int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i];return r; }

int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i+4];return r; }
