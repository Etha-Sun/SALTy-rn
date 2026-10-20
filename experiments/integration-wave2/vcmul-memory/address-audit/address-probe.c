#include <stddef.h>
#include <stdint.h>
/*@ requires \valid_read(p+(0..7)); assigns \nothing; ensures \result==p+1; */
float *address_step(float *p) { return (float*)((uintptr_t)p+sizeof(float)); }
