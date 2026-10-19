#include <stdint.h>
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *same_pointer(const uint32_t *p){return (const uint32_t*)(uintptr_t)p;}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *zero_offset(const uint32_t *p){return (const uint32_t*)((uintptr_t)p+0);}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p+1; */
const uint32_t *one_offset(const uint32_t *p){return (const uint32_t*)((uintptr_t)p+sizeof(uint32_t));}

/*@ terminates \true; assigns \nothing; ensures \false; */
void pointer_probe_false(void) {}

/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *saved_roundtrip(const uint32_t *p) {
 uintptr_t x = (uintptr_t)p;
 return (const uint32_t*)x;
}

/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *zero_with_local_equalities(const uint32_t *p) {
 uintptr_t x = (uintptr_t)p;
 /*@ assert integer_zero: x + 0 == x; */
 /*@ assert pointer_roundtrip: (const uint32_t*)x == p; */
 return (const uint32_t*)(x+0);
}

/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p+1; */
const uint32_t *pointer_arithmetic_control(const uint32_t *p) { return p+1; }
