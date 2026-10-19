#include <stdint.h>
#include <string.h>
/*@ terminates \true; assigns \nothing; ensures \result==0; */
int float_codec_must_be_rejected(uint32_t bits) {
  float x;
  memcpy(&x,&bits,4);
  return x==0.0f;
}
