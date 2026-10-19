#include "shim.h"
#include "base.c"
#include "clamp.c"
#include "neon.c"
#include "rvv.c"
#include "harness.c"
#include <stdlib.h>
#include <stdio.h>
int main(void) {
  uint8_t input[4120],left[4100],right[4100]; size_t cases=0;
  for (size_t n=1;n<=4097;n++) {
    for(size_t i=0;i<n+7;i++) input[i]=(uint8_t)(i*37+n);
    unsigned lo=(unsigned)(n%256),hi=lo+(unsigned)((255-lo)/2);
    if(!equivalent(n,input,left,right,lo,hi)) return 1;
    for(size_t i=0;i<n;i++) { unsigned x=input[i]; unsigned want=x<lo?lo:x>hi?hi:x; if(left[i]!=want || right[i]!=want)return 2; }
    cases++;
  }
  printf("%zu cases passed\n",cases); return 0;
}
