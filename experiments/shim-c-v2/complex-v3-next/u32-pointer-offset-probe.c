#include <stdint.h>
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *same_pointer(const uint32_t *p){return (const uint32_t*)(uintptr_t)p;}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p; */
const uint32_t *zero_offset(const uint32_t *p){return (const uint32_t*)((uintptr_t)p+0);}
/*@ requires \valid_read(p+(0..1)); assigns \nothing; ensures \result==p+1; */
const uint32_t *one_offset(const uint32_t *p){return (const uint32_t*)((uintptr_t)p+sizeof(uint32_t));}

/*@ terminates \true; assigns \nothing; ensures \false; */
void pointer_probe_false(void) {}
