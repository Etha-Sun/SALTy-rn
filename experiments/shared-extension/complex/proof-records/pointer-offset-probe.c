#include <stdint.h>
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const float *same_pointer(const float *p){return (const float*)(uintptr_t)p;}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const float *zero_offset(const float *p){return (const float*)((uintptr_t)p+0);}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p+1; */
const float *one_offset(const float *p){return (const float*)((uintptr_t)p+sizeof(float));}
