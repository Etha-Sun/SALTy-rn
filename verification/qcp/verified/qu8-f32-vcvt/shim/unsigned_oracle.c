#include "scalar_primitives.c"
#include "unsigned_scalar.c"
#include <stdio.h>
static unsigned long checks;
static int test(unsigned a,unsigned b){
 unsigned u=(a+b)%65536U;int signed_u=u>=32768U?(int)u-65536:(int)u;
 uint16_t got=qcp_cvt_add_u16((uint16_t)a,(uint16_t)b);
#ifdef QU8_WRONG_WRAP
 if(a==65535U&&b==1U)got=1;
#endif
 int16_t sa=a>=32768U?(int16_t)((int)a-65536):(int16_t)a;
 if(got!=u||qcp_cvt_as_s16(got)!=signed_u||qcp_cvt_as_u16(sa)!=a||qcp_cvt_addw(sa,(uint8_t)b)!=signed_u)return 1;
 checks++;return 0;
}
int main(void){
 if(test(65535,1))return 1;
 for(unsigned a=0;a<65536;a++)for(unsigned b=0;b<256;b++)if(test(a,b))return 2;
 for(unsigned u=0;u<65536;u++){
  int z=(-2147483647-1)+(int)u;long long expect=-(long long)z;expect%=65536;if(expect<0)expect+=65536;
  if(qcp_cvt_seed_u16(z)!=(unsigned)expect)return 3;
  checks++;
 }
 printf("unsigned actual scalar exhaustive checks=%lu failures=0; all65536 input residues/all256 unsigned byte operands/allINT_MIN residues; negative wrap control separate\n",checks);return 0;
}
