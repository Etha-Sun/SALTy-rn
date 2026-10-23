#include "unsigned_scalar.h"
uint16_t qcp_cvt_u16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */
{ return (uint16_t)x; }
uint16_t qcp_cvt_add_u16(uint16_t a,uint16_t b)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=65535 && emp Ensure __return==cvt_add_u16(a,b) && 0<=__return && __return<=65535 && emp */
{ return qcp_cvt_u16((int32_t)a+(int32_t)b); }
int16_t qcp_cvt_as_s16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */
{ return qcp_cvt_narrow16((int32_t)x); }
uint16_t qcp_cvt_as_u16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */
{ return qcp_cvt_u16((int32_t)x); }
uint16_t qcp_cvt_seed_u16(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp Ensure __return==cvt_seed_u16(z) && 0<=__return && __return<=65535 && emp */
{ return (uint16_t)(0U-(uint32_t)z); }
uint16_t qcp_cvt_zext_u8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && 0<=__return && __return<=65535 && emp */
{ return x; }
