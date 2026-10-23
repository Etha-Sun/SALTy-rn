#include "scalar_primitives.c"
#include "vector_primitives.c"
#include "neon_vdupq_n_f32.c"
#include "neon_vaddw_s8.c"
#include "neon_vget_low_s16.c"
#include "neon_vget_high_s16.c"
#include "neon_vmovl_s16.c"
#include "neon_vcvtq_f32_s32.c"
#include "neon_vmulq_f32.c"
#include "neon_vget_low_f32.c"
#include "neon_vget_high_f32.c"
#include "neon_qcp_cvt_movlow.c"
#include "neon_qcp_cvt_movhigh.c"
#include "rvv_active.c"
#include "rvv___riscv_vsext_vf2_i16m4.c"
#include "rvv___riscv_vsub_vx_i16m4.c"
#include "rvv___riscv_vsext_vf2_i32m8.c"
#include "rvv___riscv_vfcvt_f_x_v_f32m8.c"
#include "rvv___riscv_vfmul_vf_f32m8.c"
#include "memory_i8.c"
#include "memory_rvv_i8.c"
#include "memory_float.c"
#include "memory_rvv_f32.c"
#include "neon_frontend.h"
#include "../impl/testNEON.c"
#include "rvv_frontend.h"
#include "../impl/testRVV.c"
#define QCP_FORMAL
#include "../spec.c"
extern int printf(const char*,...);
typedef union {uint32_t u;float f;} word;
static float cvt_f(uint32_t u){word w;w.u=u;return w.f;}
static uint32_t cvt_u(float f){word w;w.f=f;return w.u;}
static int relation(float a,float b){return a==b ||(a!=a && b!=b);}
static uint32_t rng=0x853c49e6U;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static unsigned long checks,lanes;
static int check(size_t n,int32_t z,uint32_t s){
 int8_t input[264],before[264];float left[259],right[259];
 for(unsigned i=0;i<n+7;i++)input[i]=before[i]=(int8_t)next();
 for(unsigned i=0;i<n+2;i++)left[i]=right[i]=cvt_f(0x7f812345);
 struct xnn_qs8_f32_cvt_params p={{z,cvt_f(s)}};
 if(equivalent(n,input,left+1,right+1,&p)!=1)return 1;
 if(p.scalar.zero_point!=z || cvt_u(p.scalar.scale)!=s)return 2;
 if(cvt_u(left[0])!=0x7f812345 || cvt_u(right[0])!=0x7f812345 ||cvt_u(left[n+1])!=0x7f812345 ||cvt_u(right[n+1])!=0x7f812345)return 3;
 for(unsigned i=0;i<n+7;i++)if(input[i]!=before[i])return 4;
 for(unsigned i=0;i<n;i++){
  long long d=(long long)input[i]-(long long)z;d%=65536;if(d<0)d+=65536;if(d>=32768)d-=65536;
  float expected=(float)d*cvt_f(s);
  if(!relation(left[i+1],expected)||!relation(right[i+1],expected))return 5;
 }
 checks++;lanes+=(unsigned long)n;return 0;
}
int main(void){
 const int32_t zs[]={(-2147483647-1),-2147483647,2147483647,-65537,-65536,-32769,-32768,-129,-128,-1,0,1,127,128,32767,32768,65535,65536,65537};
 const uint32_t scales[]={0,0x80000000,0x3f800000,0xbf800000,0x3dcccccd,1,0x7f7fffff,0x00800000,0x7f800000,0xff800000,0x7fc12345,0xffc54321,0x7f800001,0xff800001};
 for(unsigned n=1;n<=73;n++)for(unsigned z=0;z<sizeof zs/sizeof zs[0];z++)for(unsigned s=0;s<sizeof scales/sizeof scales[0];s++){int code=check(n,zs[z],scales[s]);if(code)return code;}
 const unsigned ns[]={127,128,129,255,256,257};
 for(unsigned n=0;n<sizeof ns/sizeof ns[0];n++)for(unsigned z=0;z<sizeof zs/sizeof zs[0];z++)for(unsigned s=0;s<sizeof scales/sizeof scales[0];s++){int code=check(ns[n],zs[z],scales[s]);if(code)return code;}
 for(unsigned z=0;z<65536;z++){int code=check(1,z,0x3f800000);if(code)return code;code=check(9,(-2147483647-1)+(int)z,0xbf800000);if(code)return code;}
 for(unsigned i=0;i<5000;i++){int code=check(next()%257+1,(int32_t)next(),next());if(code)return code;}
 if(check_observation(1.0f,2.0f)!=0 ||check_observation(cvt_f(0x7fc12345),1.0f)!=0 ||check_observation(cvt_f(0x7fc12345),cvt_f(0xffc54321))!=1 ||check_observation(0.0f,cvt_f(0x80000000))!=1)return 6;
 printf("selected actual scalar-field C closure + exact kernel frontends + public equivalent passed cases=%lu lanes_per_side=%lu failures=0; all65536 zero-point residues, INT32 endpoints and NaN/Inf/signed-zero scales; frame/guards and comparator controls\n",checks,lanes);return 0;
}
