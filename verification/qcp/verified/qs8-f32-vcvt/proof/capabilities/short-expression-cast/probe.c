#include "../../../shim/formal_model.h"
int16_t cast_expression(int16_t a,int8_t b)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && emp Ensure __return==cvt_s16(a+b) && emp */
{ return (int16_t)((int32_t)a+(int32_t)b); }
int16_t cast_temporary(int16_t a,int8_t b)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && emp Ensure __return==cvt_s16(a+b) && emp */
{ int32_t sum=(int32_t)a+(int32_t)b; return (int16_t)sum; }
