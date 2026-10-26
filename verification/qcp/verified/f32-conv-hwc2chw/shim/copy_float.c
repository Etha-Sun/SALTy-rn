#include "copy_float.h"
float hc_copy_float(float x)
/*@ Require emp Ensure hc_same_bits(__return,x) && emp */
{ return x; }
