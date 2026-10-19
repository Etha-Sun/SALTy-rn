#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \true; */
void codec_true_control(void) {}
/*@ assigns \nothing; ensures \false; */
void codec_false_control(void) {}
/*@ assigns \nothing; ensures \is_NaN(\result); */
float codec_nan(void) { uint32_t bits=UINT32_C(0x7fc00000);float r;memcpy(&r,&bits,4);return r; }
/*@ assigns \nothing; ensures \eq_float(\result,1.0f); */
float codec_one(void) { uint32_t bits=UINT32_C(0x3f800000);float r;memcpy(&r,&bits,4);return r; }
/*@ assigns \nothing; ensures \eq_float(\result,0.0f); ensures \sign(\result)==\Negative; */
float codec_minus_zero(void) { uint32_t bits=UINT32_C(0x80000000);float r;memcpy(&r,&bits,4);return r; }
