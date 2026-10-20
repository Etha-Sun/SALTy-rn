#include <stdint.h>
#include <stddef.h>
/*@ requires 0<n<=SIZE_MAX/16-3; requires \valid_read(a+(0..2*n+2)); assigns \nothing; ensures \result==1; */
int pointer_step(const float *a,size_t n){const float*q=(const float*)((uintptr_t)a+n*sizeof(float));return q==a+n;}
/*@ requires \valid_read(a+(0..4)); assigns \nothing; ensures \result==1; */
int pointer_step_one(const float *a){const float*q=(const float*)((uintptr_t)a+sizeof(float));return q==a+1;}
/*@ requires \valid_read(a); assigns \nothing; ensures \result==1; */
int pointer_roundtrip(const float *a){return (const float*)((uintptr_t)a)==a;}
/*@ requires 0<n<=SIZE_MAX/16-3; requires \valid_read(a+(0..2*n+2)); assigns \nothing; ensures \result==1; */
int direct_step(const float*a,size_t n){return a+n==a+n;}
/*@ assigns \nothing; ensures \false; */
int false_control(void){return 1;}
