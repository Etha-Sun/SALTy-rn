#include "shim.h"
#include "representation.c"
#include "sqrt.c"
#include <math.h>
#include <stdio.h>
int main(void) {
 uint32_t state=1;
 for(unsigned i=0;i<1000000;i++) {
  state=state*UINT32_C(1664525)+UINT32_C(1013904223);
  float x=bits_float(state),a=f32_sqrt(x),b=sqrtf(x);
  if(!(a==b || (isnan(a)&&isnan(b)))){printf("mismatch %08x %a %a\n",state,(double)a,(double)b);return 1;}
 }
 puts("1000000 raw binary32 inputs matched libc sqrtf");return 0;
}
