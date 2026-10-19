#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \is_infinite(\result) && \sign(\result)==\Positive; */
float decode_plus_infinity(void) {
  uint32_t u=UINT32_C(0x7f800000); float x;
  memcpy(&x,&u,4); return x;
}
/*@ assigns \nothing; ensures \is_infinite(\result) && \sign(\result)==\Negative; */
float decode_minus_infinity(void) {
  uint32_t u=UINT32_C(0xff800000); float x;
  memcpy(&x,&u,4); return x;
}
/*@ assigns \nothing; ensures \eq_float(\result,0x1p-149f); */
float decode_subnormal(void) {
  uint32_t u=1; float x; memcpy(&x,&u,4); return x;
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
  uint32_t u; memcpy(&u,&x,4); return u;
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
