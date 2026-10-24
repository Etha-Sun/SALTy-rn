#include <stdint.h>
#include <string.h>
#include <stdio.h>
static uint32_t bits(float x) { uint32_t u;memcpy(&u,&x,4);return u; }
int main(void) {
 float original_hi=0x1.0p+112f, compatible_hi=5192296858534827628530496329220096.0f;
 float original_lo=0x1.0p-110f, compatible_lo=0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625f;
 uint32_t a=bits(original_hi),b=bits(compatible_hi),c=bits(original_lo),d=bits(compatible_lo);
 if(a!=0x77800000u ||b!=a||c!=0x08800000u||d!=c) return 1;
 printf("hi=%08x lo=%08x; both exact decimal literal spellings agree with originals\n",a,c);return 0;
}
