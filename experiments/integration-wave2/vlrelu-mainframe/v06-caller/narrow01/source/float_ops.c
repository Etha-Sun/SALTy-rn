#include "shim.h"
/*@ \wp::strategy VmemSMT: \prover("cvc5",30),\prover("z3",30);
 \wp::strategy VmemAddress:
 \tactic("Wp.unfold",\ingoal(shift_float32(P,I)),\children(VmemAddress)),
 \tactic("Wp.unfold",\incontext(shift_float32(P,I)),\children(VmemAddress)),VmemSMT;
 \wp::strategy VmemFrame:
 \tactic("Wp.unfold",\incontext(separated(P,N,Q,K)),\children(VmemAddress)),VmemAddress;
 \wp::strategy VmemIncluded:
 \tactic("Wp.valid",\ingoal(included(P,N,Q,K)),\children(VmemAddress)),VmemFrame;
 \wp::strategy VmemPoint:
 \tactic("Wp.cut",\ingoal(P_same_float(R,A[J])),\ingoal(repr_encode32(A[I])),\param("case","CASES"),\param("clause",J==I),\children(VmemIncluded)),VmemIncluded;
 \wp::strategy VmemExitRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(memcpy(M,P,U,P,4*I)),\incontext(E:I==V),\select(E),\children(VmemPoint)),VmemPoint;
 \wp::strategy VmemStore:
 \tactic("Wp.cut",\ingoal(memcpy(M,P,U,P,4*I)),\incontext(I<=V),\incontext(V<=I),\param("clause",I==V),\children(VmemExitRewrite)),VmemPoint;
 \wp::proof VmemStore:vst1q_f32,vst1_f32,__riscv_vse32_v_f32m8,vst1_lane_f32;
 \wp::proof VmemIncluded:equivalent;
 \wp::proof VmemIncluded:"@requires";
*/

float f32_add(float a, float b) { return a + b; }

float32x4_t vld1q_f32(const float *p) {
  float32x4_t r;
  /*@ loop invariant 0 <= i <= 4;
      loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],p[j]);
      loop assigns i, r.lane[0..3];
      loop variant 4-i; */
  for (size_t i = 0; i < 4; ++i) r.lane[i] = p[i];
  return r;
}

float32x4_t vaddq_f32(float32x4_t a, float32x4_t b) {
  float32x4_t r;
  /*@ loop invariant 0 <= i <= 4;
      loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_add32(a.lane[j],b.lane[j]));
      loop assigns i, r.lane[0..3];
      loop variant 4-i; */
  for (size_t i = 0; i < 4; ++i) r.lane[i] = f32_add(a.lane[i], b.lane[i]);
  return r;
}

void vst1q_f32(float *p, float32x4_t a) {
  /*@ loop invariant 0 <= i <= 4;
      loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
      loop assigns i, p[0..(i<4?i:4)-1];
      loop variant 4-i; */
  for (size_t i = 0; i < 4; ++i) p[i] = a.lane[i];
}

float32x2_t vget_low_f32(float32x4_t a) {
  float32x2_t r;
  /*@ loop invariant 0 <= i <= 2;
      loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],a.lane[j]);
      loop assigns i, r.lane[0..1];
      loop variant 2-i; */
  for (size_t i = 0; i < 2; ++i) r.lane[i] = a.lane[i];
  return r;
}

float32x2_t vget_high_f32(float32x4_t a) {
  float32x2_t r;
  /*@ loop invariant 0 <= i <= 2;
      loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],a.lane[j+2]);
      loop assigns i, r.lane[0..1];
      loop variant 2-i; */
  for (size_t i = 0; i < 2; ++i) r.lane[i] = a.lane[i+2];
  return r;
}

void vst1_f32(float *p, float32x2_t a) {
  /*@ loop invariant 0 <= i <= 2;
      loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
      loop assigns i, p[0..(i<2?i:2)-1];
      loop variant 2-i; */
  for (size_t i = 0; i < 2; ++i) p[i] = a.lane[i];
}

void vst1_lane_f32(float *p, float32x2_t a, int lane) { *p = a.lane[lane]; }

vfloat32m8_t __riscv_vle32_v_f32m8(const float *p, size_t vl) {
  vfloat32m8_t r = {{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],p[j]);
      loop assigns i, r.lane[0..32-1];
      loop variant vl-i; */
  for (size_t i = 0; i < vl; ++i) r.lane[i] = p[i];
  return r;
}

vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl) {
  vfloat32m8_t r = {{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_add32(a.lane[j],b.lane[j]));
      loop assigns i, r.lane[0..32-1];
      loop variant vl-i; */
  for (size_t i = 0; i < vl; ++i) r.lane[i] = f32_add(a.lane[i], b.lane[i]);
  return r;
}

void __riscv_vse32_v_f32m8(float *p, vfloat32m8_t a, size_t vl) {
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
      loop assigns i, p[0..(i<vl?i:vl)-1];
      loop variant vl-i; */
  for (size_t i = 0; i < vl; ++i) p[i] = a.lane[i];
}
