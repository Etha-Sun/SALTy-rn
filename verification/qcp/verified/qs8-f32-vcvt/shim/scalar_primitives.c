#include "formal_model.h"
int16_t qcp_cvt_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */
{ return (int16_t)x; }
int16_t qcp_cvt_seed(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp
 Ensure __return==cvt_seed(z) && -32768<=__return && __return<=32767 && emp */
{ return (int16_t)(0U-(uint32_t)z); }
int16_t qcp_cvt_addw(int16_t a,int8_t b)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && emp
 Ensure __return==cvt_addw(a,b) && -32768<=__return && __return<=32767 && emp */
{ return qcp_cvt_narrow16((int32_t)a+(int32_t)b); }
int16_t qcp_cvt_sub16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==cvt_sub16(a,b) && -32768<=__return && __return<=32767 && emp */
{ return qcp_cvt_narrow16((int32_t)a-(int32_t)b); }
int16_t qcp_cvt_sext8(int8_t x)
/*@ Require -128<=x && x<=127 && emp Ensure __return==x && -32768<=__return && __return<=32767 && emp */
{ return x; }
int32_t qcp_cvt_sext16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==x && emp */
{ return x; }
float qcp_cvt_to_f32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure cvt_same(__return,Z_to_fp32(x)) && emp */
{ return (float)x; }
float qcp_cvt_mul(float a,float b)
/*@ Require emp Ensure cvt_same(__return,fp32_mul(a,b)) && emp */
{ return a*b; }
