#include "shim.h"
/* C-defined representation transport; assumptions are binary32, little endian. */
uint32_t float_bits(float x) { uint32_t u; memcpy(&u,&x,4); return u; }
float bits_float(uint32_t u) { float x; memcpy(&x,&u,4); return x; }
