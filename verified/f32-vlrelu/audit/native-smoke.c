#include <fenv.h>
#include <stdio.h>
#include <string.h>
#include "../unit.c"

static float from_bits(uint32_t u) {
  float x; memcpy(&x,&u,sizeof x); return x;
}
int main(void) {
  static const uint32_t edges[] = {
    0,0x80000000u,1,0x80000001u,0x007fffffu,0x807fffffu,
    0x00800000u,0x80800000u,0x3f800000u,0xbf800000u,
    0x7f7fffffu,0xff7fffffu,0x7f800000u,0xff800000u,
    0x7fc12345u,0xffc54321u
  };
  _Alignas(16) float input[132],left[129],right[129];
  uint32_t rng=0x6b13d02au;
  unsigned cases=0;
  if (fesetround(FE_TONEAREST)) return 2;
  for (size_t n=1;n<=129;n++)
    for (size_t slope=0;slope<16;slope++)
      for (unsigned pattern=0;pattern<4;pattern++) {
        for (size_t i=0;i<n+3;i++) {
          rng^=rng<<13; rng^=rng>>17; rng^=rng<<5;
          uint32_t word=pattern==0 ? edges[(i+n)%16] :
            pattern==1 ? rng : pattern==2 ? edges[i%2] : edges[2+i%12];
          input[i]=from_bits(word);
        }
        if (!equivalent(n,input,left,right,from_bits(edges[slope]))) {
          fprintf(stderr,"mismatch n=%zu slope=%zu pattern=%u\n",n,slope,pattern);
          return 1;
        }
        cases++;
      }
  printf("%u cases passed; n=1..129, 16 slopes, 4 input patterns; RNE\n",cases);
  return 0;
}
