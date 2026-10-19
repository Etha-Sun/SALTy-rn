#include <stdint.h>
typedef struct { uint32_t lane[4]; } vec;
vec broadcast(uint32_t x) { vec a={{x,x,x,x}};return a; }
/*@ assigns \nothing; ensures \result==x; */
uint32_t use(uint32_t x) { vec a=broadcast(x);vec b=a;return b.lane[0]; }
/*@ assigns \nothing; ensures \result==x; */
uint32_t direct(uint32_t x) { return x; }
/*@ assigns \nothing; ensures \result!=x; */
uint32_t wrong(uint32_t x) { return x; }
