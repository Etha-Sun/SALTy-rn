#include <stdint.h>
#include <string.h>
/*@ terminates \true; assigns \nothing; */
uint32_t float_bits(float x) {uint32_t u;memcpy(&u,&x,sizeof u);return u;}
/*@ terminates \true; assigns \nothing; */
float bits_float(uint32_t u) {float x;memcpy(&x,&u,sizeof x);return x;}
