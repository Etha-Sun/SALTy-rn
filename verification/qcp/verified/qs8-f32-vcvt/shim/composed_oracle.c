#include "scalar_primitives.c"
#include "neon_vget_low_s16.c"
#include "neon_vget_high_s16.c"
#include "neon_vmovl_s16.c"
#include "neon_qcp_cvt_movlow.c"
#include "neon_qcp_cvt_movhigh.c"
extern int printf(const char *,...);
static unsigned evaluations;
static int16x8_t value;
static int16x8_t once(void){evaluations++;return value;}
static int same(int32x4_t x,int32x4_t y){return x.s0==y.s0 && x.s1==y.s1 && x.s2==y.s2 && x.s3==y.s3;}
static int32x4_t direct_low(int16x8_t a){return vmovl_s16(vget_low_s16(a));}
static int32x4_t direct_high(int16x8_t a){return vmovl_s16(vget_high_s16(a));}
/* Use the exact selected frontend macros, including nested token-shape adapter. */
#include "neon_frontend.h"
int main(void){
 unsigned checks=0;
 for(int z=-32768;z<=32767;z++){
  value=(int16x8_t){(short)z,(short)(z+1),(short)(z+2),(short)(z+3),(short)(z+4),(short)(z+5),(short)(z+6),(short)(z+7)};
  evaluations=0;int32x4_t lo=vmovl_s16(vget_low_s16(once()));
  if(evaluations!=1 || !same(lo,direct_low(value)))return 1;
  evaluations=0;int32x4_t hi=vmovl_s16(vget_high_s16(once()));
  if(evaluations!=1 || !same(hi,direct_high(value)))return 2;
  checks+=2;
 }
 printf("actual selected nested macros passed checks=%u failures=0; all65536 short residues, all8 lanes, argument evaluation exactly once\n",checks);return 0;
}
