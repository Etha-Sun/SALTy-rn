#include <stdint.h>
#include <stddef.h>
/*@ assigns \nothing; ensures \result==p; */
int *roundtrip(int *p) { return (int *)(uintptr_t)p; }
/*@ requires \valid_read(p+(0..i)); requires i<=SIZE_MAX/sizeof(int);
    assigns \nothing; ensures \result==p+i; */
int *byte_step(int *p,size_t i) { return (int *)((uintptr_t)p+i*sizeof(int)); }
/*@ requires \valid_read(p+(0..i)); requires i<=SIZE_MAX/sizeof(int);
    assigns \nothing; ensures \result==p+i; */
int *typed_step(int *p,size_t i) { return p+i; }
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p+1; */
int *wrong_roundtrip(int *p) { return (int *)(uintptr_t)p; }
