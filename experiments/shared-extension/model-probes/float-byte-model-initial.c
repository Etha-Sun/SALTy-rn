#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; terminates \true; */
uint32_t float_bits(float x) {uint32_t u;memcpy(&u,&x,sizeof u);return u;}
/*@ assigns \nothing; terminates \true; */
float bits_float(uint32_t u) {float x;memcpy(&x,&u,sizeof x);return x;}
