#include "shim.h"
/* C-defined representation transport; assumptions are binary32, little endian. */
uint32_t float_bits(float x) { uint32_t u; memcpy(&u,&x,4); /*@ assert bits_copied: u == *(uint32_t*)&x; */
/*@ assert copied_value: same_float(from_repr32(u),x); */
//@ ghost proof_repr_reencode(u,x);
return u; }
float bits_float(uint32_t u) { float x; memcpy(&x,&u,4); /*@ assert word_copied: *(uint32_t*)&x == u; */ return x; }
