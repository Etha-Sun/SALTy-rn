#ifndef QU8_F32_SCALAR_PRIMITIVES_H
#define QU8_F32_SCALAR_PRIMITIVES_H
#include "formal_model.h"
int16_t qcp_cvt_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_seed(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp
 Ensure __return==cvt_seed(z) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_addw(int16_t a,uint8_t b)
/*@ Require -32768<=a && a<=32767 && 0<=b && b<=255 && emp
 Ensure __return==cvt_addw(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sub16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==cvt_sub16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sext8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_cvt_sext16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==x && emp */;
float qcp_cvt_to_f32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure cvt_same(__return,Z_to_fp32(x)) && emp */;
float qcp_cvt_mul(float a,float b)
/*@ Require emp Ensure cvt_same(__return,fp32_mul(a,b)) && emp */;
#endif
