#include "isa_arrays.h"
#include <stdio.h>
#include <float.h>
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32 required");
#define test_neon original_neon
#include "../original/testNEON.c"
#undef test_neon
#define test_rvv original_rvv
#include "../original/testRVV.c"
#undef test_rvv
#define test_rvv frama_repaired_rvv
#include "frama-repaired-rvv.c"
#undef test_rvv
static int one(const char*name,int8_t av,int8_t bv,int8_t az,int8_t bz,uint32_t scale,int16_t oz){
 int8_t a[16]={0},b[16]={0},l[3]={42,42,42},r[3]={42,42,42},f[3]={42,42,42};a[0]=av;b[0]=bv;
 union xnn_qs8_mul_minmax_params p={0};p.scalar.a_zero_point=az;p.scalar.b_zero_point=bz;p.scalar.scale=qm_float(scale);p.scalar.output_zero_point=oz;p.scalar.output_min=-128;p.scalar.output_max=127;
 original_neon(1,a,b,l+1,&p);original_rvv(1,a,b,r+1,&p);frama_repaired_rvv(1,a,b,f+1,&p);
 assert(l[0]==42&&l[2]==42&&r[0]==42&&r[2]==42&&f[0]==42&&f[2]==42);
 printf("%s scale_bits=0x%08x a=%d b=%d az=%d bz=%d oz=%d neon=%d original_rvv=%d frama_rvv=%d\n",name,scale,av,bv,az,bz,oz,l[1],r[1],f[1]);
 if(name[0]=='f')return l[1]!=r[1]&&l[1]==f[1];
 return l[1]==-128&&r[1]!=l[1]&&f[1]==127;
}
int main(void){assert(fesetround(FE_TONEAREST)==0);assert(sizeof(size_t)==8);float scale=0x1.b972e4p+21f;int n=one("finite-magic",8,-57,64,-97,qm_bits(scale),-13783);n+=one("negative-quiet-NaN",1,1,0,0,0xffc00001U,0);n+=one("negative-signalling-NaN",1,1,0,0,0xff800001U,0);printf("counterexamples=%d\n",n);return n==3?0:1;}
