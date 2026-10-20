#include "fp_primitives.h"

/*@ assigns \nothing; ensures \result==(\is_NaN(x)?1:0); */
int fp_nan(float x) { return x != x; }

/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value)); return value;
}

/*@ assigns \nothing; ensures ext_same(\result,ext_num_min32(a,b)); */
float min_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) || signbit(b) ? -0.0f : 0.0f;
  return a < b ? a : b;
}

/*@ assigns \nothing; ensures ext_same(\result,ext_num_max32(a,b)); */
float max_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) && signbit(b) ? -0.0f : 0.0f;
  return a > b ? a : b;
}

/*@ assigns \nothing; ensures ext_same(\result,ext_neon_min32(a,b)); */
float neon_min(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return min_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : min_number(a,b);
#endif
}

/*@ assigns \nothing; ensures ext_same(\result,ext_neon_max32(a,b)); */
float neon_max(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return max_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : max_number(a,b);
#endif
}

/*@ assigns \nothing; ensures \forall integer j; 0<=j<4 ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b.lane[j])); */
float32x4_t vminq_f32(float32x4_t a,float32x4_t b) {
  /*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_neon_min32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<4 ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant 4-i; */
for(size_t i=0;i<4;i++) { a.lane[i]=neon_min(a.lane[i],b.lane[i]); }
  return a;
}

/*@ assigns \nothing; ensures \forall integer j; 0<=j<4 ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b.lane[j])); */
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {
  /*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_neon_max32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<4 ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant 4-i; */
for(size_t i=0;i<4;i++) { a.lane[i]=neon_max(a.lane[i],b.lane[i]); }
  return a;
}

/*@ assigns \nothing; ensures \forall integer j; 0<=j<2 ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b.lane[j])); */
float32x2_t vmin_f32(float32x2_t a,float32x2_t b) { /*@ loop invariant 0<=i<=2; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_neon_min32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<2 ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant 2-i; */
for(int i=0;i<2;i++)a.lane[i]=neon_min(a.lane[i],b.lane[i]);return a; }

/*@ assigns \nothing; ensures \forall integer j; 0<=j<2 ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b.lane[j])); */
float32x2_t vmax_f32(float32x2_t a,float32x2_t b) { /*@ loop invariant 0<=i<=2; loop invariant \forall integer j; 0<=j<i ==> ext_same(a.lane[j],ext_neon_max32(\at(a.lane[j],Pre),b.lane[j])); loop invariant \forall integer j; i<=j<2 ==> ext_same(a.lane[j],\at(a.lane[j],Pre)); loop assigns i,a; loop variant 2-i; */
for(int i=0;i<2;i++)a.lane[i]=neon_max(a.lane[i],b.lane[i]);return a; }
