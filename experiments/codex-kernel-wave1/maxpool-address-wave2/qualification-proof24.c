#include <stdint.h>
#include <string.h>
/*@ logic float from_repr32(integer u); */
/*@ ghost
/@ requires (2139095040<u<2147483648) || (4286578688<u<4294967296);
    assigns \nothing;
    ensures (u & 2139095040)==2139095040 && (u & 8388607)!=0; @/
void proof_nan_mask(uint32_t u) {
 /@ assert shift_division: (u>>23)==u/8388608; @/
 if (u<2147483648u) {
  /@ assert quotient_positive: u/8388608==255; @/
  /@ assert high_positive: (u>>23)==255; @/
  /@ assert exponent_positive: (u & 2139095040)==2139095040; @/
  if ((u&8388607u)==0) { /@ assert positive_zero: u==2139095040; @/ }
  /@ assert mantissa_positive: (u & 8388607)!=0; @/
 } else {
  /@ assert quotient_negative: u/8388608==511; @/
  /@ assert high_negative: (u>>23)==511; @/
  /@ assert exponent_negative: (u & 2139095040)==2139095040; @/
  if ((u&8388607u)==0) { /@ assert negative_zero: u==4286578688; @/ }
  /@ assert mantissa_negative: (u & 8388607)!=0; @/
 }
}
/@ requires (u & 2139095040)!=2139095040 || (u & 8388607)==0;
    assigns \nothing;
    ensures u<=2139095040 || (2147483648<=u<=4286578688); @/
void proof_non_nan_mask(uint32_t u) {
 if ((2139095040u<u && u<2147483648u) || (4286578688u<u)) proof_nan_mask(u);
}
/@ assigns \nothing;
    ensures \is_NaN(from_repr32(u)) <==>
      ((2139095040<u<2147483648) || (4286578688<u<4294967296)); @/
void proof_nan32_intervals(uint32_t u) {}
*/
#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \result==w; */
uint32_t bytes_roundtrip(uint32_t w) {
  float a; uint32_t r;
  memcpy(&a,&w,4); memcpy(&r,&a,4); return r;
}
/*@ requires (w & 0x7f800000)!=0x7f800000 || (w & 0x007fffff)==0;
    assigns \nothing; ensures \result==w; */
uint32_t non_nan_value_roundtrip(uint32_t w) {
  float a; memcpy(&a,&w,4);
  /*@ assert copied_input_word: *(uint32_t*)&a==w; */
  //@ ghost proof_non_nan_mask(w);
  //@ ghost proof_nan32_intervals(w);
  /*@ assert decoded_word_nan_equiv: \is_NaN(a) <==>
    ((2139095040<w<2147483648) || (4286578688<w<4294967296)); */
  /*@ assert decoded_input_non_nan: !\is_NaN(a); */
  float b=a;
  /*@ assert encoded_copy_word: *(uint32_t*)&b==w; */
  uint32_t r; memcpy(&r,&b,4); return r;
}
/* Deliberately too strong: the overapproximate typed NaN store can choose a different payload. */
/*@ assigns \nothing; ensures \result==w; */
uint32_t arbitrary_value_roundtrip(uint32_t w) {
  float a; memcpy(&a,&w,4); float b=a;
  uint32_t r; memcpy(&r,&b,4); return r;
}
/*@ requires \is_NaN(x); assigns \nothing;
    ensures \result==1; */
int independent_nan_stores_equal(float x) {
  float a=x,b=x; uint32_t u,v;
  memcpy(&u,&a,4); memcpy(&v,&b,4); return u==v;
}
/*@ assigns \nothing; ensures \false; */
void codec_false(void) {}
/*@ assigns \nothing; ensures \true; */
void codec_true(void) {}
#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \is_infinite(\result) && \sign(\result)==\Positive; */
float decode_plus_infinity(void) {
  uint32_t u=UINT32_C(0x7f800000); float x;
  memcpy(&x,&u,4);
  /*@ assert copied_special_word: *(uint32_t*)&x==u; */
  return x;
}
/*@ assigns \nothing; ensures \is_infinite(\result) && \sign(\result)==\Negative; */
float decode_minus_infinity(void) {
  uint32_t u=UINT32_C(0xff800000); float x;
  memcpy(&x,&u,4);
  /*@ assert copied_special_word: *(uint32_t*)&x==u; */
  return x;
}
/*@ assigns \nothing; ensures \eq_float(\result,0x1p-149f); */
float decode_subnormal(void) {
  uint32_t u=1; float x; memcpy(&x,&u,4);
  /*@ assert copied_special_word: *(uint32_t*)&x==u; */
  return x;
}
/*@ assigns \nothing; ensures \result==u; */
uint32_t nan_payload_byte_roundtrip(uint32_t u) {
  float x; uint32_t v;
  memcpy(&x,&u,4); memcpy(&v,&x,4); return v;
}
/*@ requires \is_NaN(x); assigns \nothing;
    ensures (\result & 0x7f800000)==0x7f800000;
    ensures (\result & 0x007fffff)!=0; */
uint32_t nan_store_is_nan(float x) {
  uint32_t u; memcpy(&u,&x,4);
  /*@ assert copied_nan_word: \is_NaN(from_repr32(u)); */
  //@ ghost proof_nan32_intervals(u);
  /*@ assert copied_nan_interval: (2139095040<u<2147483648) || (4286578688<u<4294967296); */
  //@ ghost proof_nan_mask(u);
  return u;
}
/*@ assigns \nothing; ensures \result==UINT32_C(0xffc01234); */
uint32_t negative_payload_byte_roundtrip(void) {
  uint32_t u=UINT32_C(0xffc01234), v; float x;
  memcpy(&x,&u,4); memcpy(&v,&x,4); return v;
}
/*@ assigns \nothing; ensures \result==UINT32_C(0x7fa00002); */
uint32_t signaling_payload_byte_roundtrip(void) {
  uint32_t u=UINT32_C(0x7fa00002), v; float x;
  memcpy(&x,&u,4); memcpy(&v,&x,4); return v;
}
/*@ requires \is_NaN(x); assigns \nothing;
    ensures \result==1; */
int nan_stores_equal_control(float x) {
  float a=x, b=x; uint32_t u,v;
  memcpy(&u,&a,4); memcpy(&v,&b,4);
  return u==v;
}
/*@ assigns \nothing; ensures \false; */
void byte32_false_control(void) {}
/*@ assigns \nothing; ensures \true; */
void byte32_true_control(void) {}
/*@ \wp::strategy MaskRootSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy MaskRootShift: \tactic("Wp.shift",\ingoal(lsr(U,N)),\children(MaskRootSolve)), MaskRootSolve;
 \wp::proof MaskRootShift:shift_division; */
