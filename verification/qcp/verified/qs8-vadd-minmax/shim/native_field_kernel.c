#include "formal_runtime.h"
extern int printf(const char *, ...);
extern int puts(const char *);


static void *field_copy(void *to,const void *from,size_t n){unsigned char*d=to;const unsigned char*s=from;for(size_t i=0;i<n;i++)d[i]=s[i];return to;}
static int field_compare(const void*a,const void*b,size_t n){const unsigned char*x=a,*y=b;for(size_t i=0;i<n;i++)if(x[i]!=y[i])return 1;return 0;}
static void *field_fill(void*p,int value,size_t n){unsigned char*d=p;for(size_t i=0;i<n;i++)d[i]=(unsigned char)value;return p;}

#define test_neon actual_neon
#include "../impl/testNEON.c"
#undef test_neon
#define test_rvv actual_rvv
#include "../impl/testRVV.c"
#undef test_rvv
#define test_neon actual_neon
#define test_rvv actual_rvv
#define equivalent actual_equivalent
#include "../spec.c"
#undef equivalent
#undef test_neon
#undef test_rvv
/* Independent mathematical oracle: one exact wide dot product, low32 once,
   decoded signed low-byte control, mathematical rounded quotient, then clamps.
   It calls no runtime/instruction helper. */
static int oracle(int a,int b,const struct xnn_qs8_add_minmax_params *p){
 __int128 exact=(__int128)(a-p->scalar.a_zero_point)*p->scalar.a_multiplier+(__int128)(b-p->scalar.b_zero_point)*p->scalar.b_multiplier;
 uint32_t bits=(uint32_t)exact;
 int64_t x=bits<2147483648U?(int64_t)bits:(int64_t)bits-4294967296LL;
 unsigned encoded=(0U-(uint32_t)p->scalar.shift)&255U;
 int direction=encoded<128U?(int)encoded:(int)encoded-256;
 if(direction<=-32||direction>=32)x=0;
 else if(direction>=0){
  uint32_t word=(uint32_t)((__int128)x*((__int128)1<<direction));
  x=word<2147483648U?(int64_t)word:(int64_t)word-4294967296LL;
 }else{
  __int128 divisor=(__int128)1<<(-direction);
  __int128 numerator=(__int128)x+divisor/2;
  __int128 quotient=numerator/divisor;
  if(numerator%divisor<0)quotient--;
  x=(int64_t)quotient;
 }
 if(x<(-32768))x=-32768;if(x>32767)x=32767;
 x+=p->scalar.output_zero_point;
 if(x<(-32768))x=-32768;if(x>32767)x=32767;
 if(x<(-128))x=-128;if(x>127)x=127;
 if(x<p->scalar.output_min)x=p->scalar.output_min;
 if(x>p->scalar.output_max)x=p->scalar.output_max;
 return(int)x;
}
static uint32_t rng=0x8a7c32efU;
static uint32_t word(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static int32_t signedword(uint32_t u){return u<2147483648U?(int32_t)u:(int32_t)((int64_t)u-4294967296LL);}
static unsigned long calls,lanes;
static int run(size_t n,struct xnn_qs8_add_minmax_params p,int identity,unsigned offset){
 int8_t aa[1040],bb[1040],oa[1040],ob[1040],na[1040],nb[1040];
 for(size_t i=0;i<1040;i++){aa[i]=(int8_t)(identity?1:word());bb[i]=(int8_t)(identity?0:word());na[i]=nb[i]=(int8_t)0x5a;}
 field_copy(oa,aa,sizeof aa);field_copy(ob,bb,sizeof bb);
 struct xnn_qs8_add_minmax_params saved;field_copy(&saved,&p,sizeof p);
 actual_neon(n,aa+offset,bb+offset,na+offset,&p);
 actual_rvv(n,aa+offset,bb+offset,nb+offset,&p);
 if(field_compare(oa,aa,sizeof aa)||field_compare(ob,bb,sizeof bb)||field_compare(&saved,&p,sizeof p)){puts("input/frame changed");return 2;}
 for(size_t i=0;i<1040;i++){
  int expected=i>=offset&&i<offset+n?oracle(aa[i],bb[i],&p):0x5a;
  if(na[i]!=expected||nb[i]!=expected){printf("mismatch call=%lu n=%llu i=%llu shift=%d expected=%d neon=%d rvv=%d\n",calls,n,i,p.scalar.shift,expected,na[i],nb[i]);return 3;}
 }
 field_fill(na,0x5a,sizeof na);field_fill(nb,0x5a,sizeof nb);
 if(actual_equivalent(n,aa+offset,bb+offset,na+offset,nb+offset,&p)!=1){puts("public equivalent returned0");return 4;}
 if(field_compare(oa,aa,sizeof aa)||field_compare(ob,bb,sizeof bb)||field_compare(&saved,&p,sizeof p)){puts("public caller input/frame changed");return 5;}
 for(size_t i=0;i<1040;i++){
  int expected=i>=offset&&i<offset+n?oracle(aa[i],bb[i],&p):0x5a;
  if(na[i]!=expected||nb[i]!=expected){printf("public mismatch call=%lu n=%llu i=%llu expected=%d neon=%d rvv=%d\n",calls,n,i,expected,na[i],nb[i]);return 6;}
 }
 calls++;lanes+=n;return 0;
}
int main(void){
 if(sizeof(size_t)!=8 || sizeof(void*)!=8)return 7;
 uint16_t endian_word=1;if(*(unsigned char*)&endian_word!=1)return 8;
 const int32_t shifts[]={-2147483647-1,-2147483647,-65537,-513,-512,-257,-256,-255,-129,-128,-127,-33,-32,-31,-1,0,1,2,15,30,31,32,33,127,128,129,255,256,257,511,512,65536,2147483647};
 const int32_t multipliers[]={-2147483647-1,-2147483647,-65536,-32768,-1,0,1,32767,65536,2147483647};
 const size_t lengths[]={1,2,3,4,5,6,7,8,9,15,16,17,23,24,25,31,32,33,47,48,49,63,64,65,95,96,97,127,128,129,255,256,257,511,512,513,1023};
 struct xnn_qs8_add_minmax_params p;field_fill(&p,0,sizeof p);
 p.scalar.a_multiplier=1;p.scalar.output_min=-128;p.scalar.output_max=127;
 for(int d=-128;d<128;d++)for(unsigned j=0;j<sizeof lengths/sizeof lengths[0];j++){p.scalar.shift=d;int e=run(lengths[j],p,1,j%4+1);if(e)return e;}
 for(unsigned i=0;i<12000;i++){
  p.scalar.a_zero_point=(int8_t)word();p.scalar.b_zero_point=(int8_t)word();p.scalar.bias=signedword(word());
  p.scalar.a_multiplier=i%3?multipliers[i%10]:signedword(word());p.scalar.b_multiplier=i%5?multipliers[(i/7)%10]:signedword(word());
  p.scalar.shift=i%3?shifts[i%(sizeof shifts/sizeof shifts[0])]:signedword(word());
  p.scalar.output_zero_point=(int16_t)word();p.scalar.output_min=(int8_t)word();p.scalar.output_max=(int8_t)word();
  int e=run(lengths[i%(sizeof lengths/sizeof lengths[0])],p,0,i%4+1);if(e)return e;
 }
 printf("passed calls=%lu lanes_per_side=%lu all256_controls=1 unordered_bounds=1 offset_canaries=1 public_wrapper=1 sizeof_size_t=8\n",calls,lanes);return 0;
}
