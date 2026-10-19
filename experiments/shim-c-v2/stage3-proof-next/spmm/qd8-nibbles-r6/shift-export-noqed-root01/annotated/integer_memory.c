#include "fp_primitives.h"

uint32x4_t vld1q_u32(const uint32_t *p) { uint32x4_t r;memcpy(r.lane,p,16);return r; }

uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r={{x,x,x,x}};return r; }

void vst1q_u32(uint32_t *p,uint32x4_t a) { memcpy(p,a.lane,16); }

uint32x2_t vget_low_u32(uint32x4_t a) { uint32x2_t r={{a.lane[0],a.lane[1]}};return r; }

uint32x2_t vget_high_u32(uint32x4_t a) { uint32x2_t r={{a.lane[2],a.lane[3]}};return r; }

void vst1_u32(uint32_t *p,uint32x2_t a) { memcpy(p,a.lane,8); }

void vst1_lane_u32(uint32_t *p,uint32x2_t a,int n) { *p=a.lane[n]; }

int8x8_t vld1_s8(const void *p) { int8x8_t r;memcpy(&r,p,8);return r; }

int32x4_t vld1q_s32(const void *p) { int32x4_t r;memcpy(&r,p,16);return r; }

int32x4_t vld1q_dup_s32(const int32_t *p) { int32x4_t r;for(int i=0;i<4;i++)r.lane[i]=*p;return r; }
