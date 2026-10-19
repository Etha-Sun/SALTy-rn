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
  float a; memcpy(&a,&w,4); float b=a;
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
