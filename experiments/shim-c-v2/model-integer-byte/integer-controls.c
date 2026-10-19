#include <stdint.h>
#include <string.h>
/*@ requires \valid_read(p+(0..1)); terminates \true; assigns \nothing;
 ensures \result==(uint8_t)p[0]+256*(uint8_t)p[1]; */
uint16_t pack16(const int8_t *p) { uint16_t r; memcpy(&r,p,2); return r; }
/*@ requires \valid_read(p+(0..3)); terminates \true; assigns \nothing;
 ensures \result==(uint32_t)((uint8_t)p[0]+256*(uint8_t)p[1]+65536*(uint8_t)p[2]+16777216*(uint8_t)p[3]); */
uint32_t pack32(const int8_t *p) { uint32_t r; memcpy(&r,p,4); return r; }
/*@ terminates \true; assigns \nothing; ensures \result==1; */
int integer_positive(void) { return (uint16_t)(int16_t)-1==65535; }
/*@ terminates \true; assigns \nothing; ensures \false; */
void integer_false(void) {}
