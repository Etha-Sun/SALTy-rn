#include "fp_primitives.h"
#ifdef BOTH_WRONG
#define fmaf(a,b,c) (0.0f)
#endif

float32x4_t vfmaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  for(size_t i=0;i<4;i++) { a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]); }
  return a;
}

float32x4_t vfmaq_lane_f32(float32x4_t a,float32x4_t b,float32x2_t c,int n) { for(int i=0;i<4;i++)a.lane[i]=fmaf(b.lane[i],c.lane[n],a.lane[i]);return a; }

float32x4_t vfmaq_laneq_f32(float32x4_t a,float32x4_t b,float32x4_t c,int n) { for(int i=0;i<4;i++)a.lane[i]=fmaf(b.lane[i],c.lane[n],a.lane[i]);return a; }

float32x2_t vfma_f32(float32x2_t a,float32x2_t b,float32x2_t c) { for(int i=0;i<2;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }

float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }

float32x4_t vaddq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }

float32x4_t vsubq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]-b.lane[i];return a; }

float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) { for(int i=0;i<4;i++){float p=b.lane[i]*c.lane[i];a.lane[i]=a.lane[i]+p;}return a; }

float vaddv_f32(float32x2_t a) { return a.lane[0]+a.lane[1]; }

float vaddvq_f32(float32x4_t a) { return (a.lane[0]+a.lane[1])+(a.lane[2]+a.lane[3]); }
