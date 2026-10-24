#include "../../shim/bits.h"
unsigned int hi(void) /*@ Require emp Ensure __return == 2004877312 && emp */ { return qcp_float_bits(0x1.0p+112f); }
unsigned int lo(void) /*@ Require emp Ensure __return == 142606336 && emp */ { return qcp_float_bits(0x1.0p-110f); }
