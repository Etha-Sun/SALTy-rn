#include "rvv-api.h"
float qcp_qd8_identity(float x)
/*@ Require emp Ensure qd8_bit_same(__return,x) && emp */
{ return x; }
int qcp_qd8_isnan(float x)
/*@ Require emp Ensure __return==qd8_nan_flag(x) && emp */
{ float copy=qcp_qd8_identity(x); return x!=copy; }
int bounds_probe(float lo,float hi)
/*@ Require emp Ensure __return==qd8_bounds_flag(lo,hi) && emp */
{ return qcp_qd8_isnan(lo) || qcp_qd8_isnan(hi); }
