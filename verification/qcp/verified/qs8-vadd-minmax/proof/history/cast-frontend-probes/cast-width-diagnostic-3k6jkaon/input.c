#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vadd-minmax/shim/scalar.h"
int32_t probe_u32_s32(uint32_t x)
/*@ Require 0<=x && x<=4294967295 && emp Ensure __return==qa_s32(x) && emp */
{return (int32_t)x;}
int16_t probe_u16_s16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==qa_s16(x) && emp */
{return (int16_t)x;}
int32_t probe_neg64(int32_t x)
/*@ Require (-2147483647-1)<=x && x<=2147483647 && emp Ensure __return==qa_s32(-x) && emp */
{return(int32_t)(-(int64_t)x);}
