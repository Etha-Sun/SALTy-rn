#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \false; */
float forced_codec_false(void) {
  uint32_t bits=UINT32_C(0x3f800000);float r;
  memcpy(&r,&bits,4);return r;
}
/*@ assigns \nothing; ensures \true; */
float forced_codec_true(void) {
  uint32_t bits=UINT32_C(0x3f800000);float r;
  memcpy(&r,&bits,4);return r;
}
