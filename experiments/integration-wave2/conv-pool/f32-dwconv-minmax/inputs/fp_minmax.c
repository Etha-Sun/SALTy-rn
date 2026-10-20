#include "fp_primitives.h"

int fp_nan(float x) { return x != x; }

float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value)); return value;
}

float min_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) || signbit(b) ? -0.0f : 0.0f;
  return a < b ? a : b;
}

float max_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) && signbit(b) ? -0.0f : 0.0f;
  return a > b ? a : b;
}

float neon_min(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return min_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : min_number(a,b);
#endif
}

float neon_max(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return max_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : max_number(a,b);
#endif
}

float32x4_t vminq_f32(float32x4_t a,float32x4_t b) {
  for(size_t i=0;i<4;i++) { a.lane[i]=neon_min(a.lane[i],b.lane[i]); }
  return a;
}

float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {
  for(size_t i=0;i<4;i++) { a.lane[i]=neon_max(a.lane[i],b.lane[i]); }
  return a;
}

float32x2_t vmin_f32(float32x2_t a,float32x2_t b) { for(int i=0;i<2;i++)a.lane[i]=neon_min(a.lane[i],b.lane[i]);return a; }

float32x2_t vmax_f32(float32x2_t a,float32x2_t b) { for(int i=0;i<2;i++)a.lane[i]=neon_max(a.lane[i],b.lane[i]);return a; }
