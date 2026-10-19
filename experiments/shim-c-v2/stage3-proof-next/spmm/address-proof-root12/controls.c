#include <stdint.h>
#include <stddef.h>
/*@ assigns \nothing;
    ensures \result == (x + bytes) % 18446744073709551616;
    ensures x <= UINTPTR_MAX-bytes ==> \result == x+bytes;
    ensures x > UINTPTR_MAX-bytes ==> \result == x-(UINTPTR_MAX-bytes)-1;
*/
static uintptr_t checked_step_bits(uintptr_t x, uintptr_t bytes) { return x + bytes; }
/*@ assigns \nothing; ensures \result==1; */
int positive_integer_wrap(void) { uintptr_t x=UINTPTR_MAX-3; uintptr_t y=checked_step_bits(x,4); return y==0; }
/*@ assigns \nothing; ensures \result==1; */
int negative_integer_no_wrap(void) { uintptr_t x=UINTPTR_MAX-3; uintptr_t y=checked_step_bits(x,4); return y>x; }
/*@ requires \valid(p); assigns \nothing; ensures \result==1; */
int positive_pointer_roundtrip(float *p) { uintptr_t x=(uintptr_t)p; return (float*)x==p; }
/*@ requires \valid(p); assigns \nothing; ensures \result==1; */
int positive_zero_step(float *p) { uintptr_t x=(uintptr_t)p; uintptr_t y=checked_step_bits(x,0); return (float*)y==p; }
/*@ requires 0<count<=SIZE_MAX/sizeof(float); requires step<count;
    requires \valid(p+(0..count-1)); assigns \nothing; ensures \result==1; */
int positive_typed_step(float *p,size_t count,size_t step) { float *q=p+step; return q==p+step; }
/*@ requires 0<count<=SIZE_MAX/sizeof(float); requires step<count;
    requires \valid(p+(0..count-1)); assigns \nothing; ensures \result==1; */
int target_uintptr_step(float *p,size_t count,size_t step) {
 uintptr_t bytes=step*sizeof(float); uintptr_t bits=checked_step_bits((uintptr_t)p,bytes);
 /*@ assert stride_bytes_exact: bytes==step*sizeof(float); */
 /*@ assert address_roundtrip: (float*)((uintptr_t)p)==p; */
 return (float*)bits==p+step;
}
/*@ requires \valid(p+(0..2)); assigns \nothing; ensures \result==1; */
int negative_wrong_step(float *p) { uintptr_t bits=checked_step_bits((uintptr_t)p,sizeof(float)); return (float*)bits==p+2; }
