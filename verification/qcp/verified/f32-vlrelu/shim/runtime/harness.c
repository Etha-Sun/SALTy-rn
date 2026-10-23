/* Finite, instrumented regression, not a formal proof or hardware execution. */
#include "intrinsics.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
void test_neon(size_t,const float*,float*,const struct xnn_f32_lrelu_params*);
void test_rvv(size_t,const float*,float*,const struct xnn_f32_lrelu_params*);
int equivalent(size_t,const float*,float*,float*,const struct xnn_f32_lrelu_params*);
int compare_outputs(size_t,const float*,const float*);

static size_t cases, lanes, primitive_checks;
static uint32_t state=UINT32_C(0x315f7e29);
static uint32_t random_bits(void) {
  state ^= state<<13; state ^= state>>17; state ^= state<<5; return state;
}
static void require(int ok,const char *message) {
  if (!ok) { fprintf(stderr,"FAIL: %s\n",message); exit(1); }
}
static int nan_bits(uint32_t x) {
  return (x&UINT32_C(0x7f800000))==UINT32_C(0x7f800000) && (x&UINT32_C(0x007fffff));
}
/* Independent oracle: do not call either intrinsic implementation or multiply
 * helper. Two binary32 significands have <=48 product bits, so finite product
 * is exact in binary64; conversion to binary32 supplies the one RNE rounding. */
static uint32_t oracle(uint32_t x,uint32_t slope) {
  if (!(x&UINT32_C(0x80000000))) return x;
  float xf,sf,result; memcpy(&xf,&x,4); memcpy(&sf,&slope,4);
  volatile double exact=(double)xf*(double)sf;
  volatile float rounded=(float)exact; result=rounded;
  uint32_t bits; memcpy(&bits,&result,4); return bits;
}
static int observed(uint32_t actual,uint32_t expected) {
  /* Deliberately stronger than numerical equality for signed zero. */
  return actual==expected || (nan_bits(actual)&&nan_bits(expected));
}
static uint32_t bits_at(const float *p) { uint32_t b; memcpy(&b,p,4); return b; }
static void set_bits(float *p,uint32_t b) { memcpy(p,&b,4); }

static const uint32_t special[]={
  0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,
  0x3f000000,0xbf000000,0x3f800000,0xbf800000,0x40000000,0xc0000000,
  0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00001,0xffc00001,
  0x7fa00001,0xffa00001,0x7fffffff,0xffffffff
};
#define NSPECIAL (sizeof(special)/sizeof(special[0]))

static void check_case(size_t n,uint32_t slope,unsigned mode,unsigned offset) {
  const uint32_t canary=UINT32_C(0x4d35cafe);
  float *input=malloc((n+3)*sizeof(float)),*left=malloc((n+2)*sizeof(float));
  float *right=malloc((n+2)*sizeof(float));
  uint32_t *before=malloc((n+3)*sizeof(uint32_t));
  require(input&&left&&right&&before,"allocation");
  struct xnn_f32_lrelu_params params;
  memcpy(&params.scalar.slope,&slope,4);
  for(size_t i=0;i<n+3;i++) {
    uint32_t x=mode==0?special[(i+offset)%NSPECIAL]:mode==1?random_bits():special[offset%NSPECIAL];
    set_bits(input+i,x); before[i]=x;
  }
  for(size_t i=0;i<n+2;i++) { set_bits(left+i,canary); set_bits(right+i,canary); }
  test_neon(4*n,input,left+1,&params);
  test_rvv(4*n,input,right+1,&params);
  for(size_t i=0;i<n;i++) {
    uint32_t expected=oracle(before[i],slope),a=bits_at(left+1+i),b=bits_at(right+1+i);
    if(!observed(a,expected)||!observed(b,expected)||!observed(a,b)) {
      fprintf(stderr,"oracle mismatch n=%zu lane=%zu x=%08" PRIx32 " slope=%08" PRIx32
        " left=%08" PRIx32 " right=%08" PRIx32 " expected=%08" PRIx32 "\n",
        n,i,before[i],slope,a,b,expected); exit(1);
    }
  }
  require(bits_at(left)==canary&&bits_at(left+n+1)==canary&&
          bits_at(right)==canary&&bits_at(right+n+1)==canary,"direct output frame");
  require(memcmp(input,before,4*(n+3))==0,"direct input plus padding frame");
  require(bits_at(&params.scalar.slope)==slope,"direct params frame");
  for(size_t i=0;i<n+2;i++) { set_bits(left+i,canary); set_bits(right+i,canary); }
  require(equivalent(n,input,left+1,right+1,&params)==1,"public equivalent");
  for(size_t i=0;i<n;i++) {
    uint32_t expected=oracle(before[i],slope);
    require(observed(bits_at(left+1+i),expected)&&observed(bits_at(right+1+i),expected),"public output vs oracle");
  }
  require(bits_at(left)==canary&&bits_at(left+n+1)==canary&&
          bits_at(right)==canary&&bits_at(right+n+1)==canary,"public output frame");
  require(memcmp(input,before,4*(n+3))==0,"public input plus padding frame");
  require(bits_at(&params.scalar.slope)==slope,"public params frame");
  cases++; lanes+=n;
  free(before); free(right); free(left); free(input);
}

static void primitive_tests(void) {
  float input[35],output[40];
  for(size_t i=0;i<35;i++) set_bits(input+i,special[i%NSPECIAL]);
  for(size_t vl=0;vl<=32;vl++) {
    vfloat32m8_t x=__riscv_vle32_v_f32m8(input,vl);
    vint32m8_t xi=__riscv_vreinterpret_v_f32m8_i32m8(x);
    vbool4_t m=__riscv_vmslt_vx_i32m8_b4(xi,0,vl);
    vfloat32m8_t y=__riscv_vfmul_vf_f32m8(x,runtime_float(0xbf000000),vl);
    vfloat32m8_t z=__riscv_vmerge_vvm_f32m8(x,y,m,vl);
    for(size_t i=0;i<40;i++) set_bits(output+i,0x4d35cafe);
    __riscv_vse32_v_f32m8(output+1,z,vl);
    for(size_t i=0;i<vl;i++) {
      uint32_t original=bits_at(input+i),reinterpreted; memcpy(&reinterpreted,xi.lane+i,4);
      require(original==reinterpreted,"RVV reinterpret preserves NaN/zero bits");
      require(m.lane[i]==(original>>31),"RVV sign mask");
      require(bits_at(output+1+i)==(m.lane[i]?y.lane[i]:x.lane[i]),"RVV merge polarity");
      primitive_checks+=3;
    }
    for(size_t i=0;i<40;i++) if(i==0||i>vl) {
      require(bits_at(output+i)==0x4d35cafe,"RVV inactive output frame"); primitive_checks++;
    }
  }
  for(size_t i=0;i<NSPECIAL;i+=4) {
    for(size_t j=0;j<4;j++) set_bits(input+j,special[(i+j)%NSPECIAL]);
    float32x4_t x=vld1q_f32(input),y=vdupq_n_f32(runtime_float(0x3f000000));
    int32x4_t xi=vreinterpretq_s32_f32(x);
    uint32x4_t m=vcltq_s32(xi,vmovq_n_s32(0));
    float32x4_t z=vbslq_f32(m,vmulq_f32(x,y),x);
    for(size_t j=0;j<4;j++) {
      uint32_t ri; memcpy(&ri,xi.lane+j,4);
      require(ri==bits_at(input+j),"Arm reinterpret preserves NaN/zero bits");
      require(m.lane[j]==((ri>>31)?UINT32_MAX:0),"Arm sign mask");
      require(observed(z.lane[j],oracle(ri,0x3f000000)),"Arm bitselect"); primitive_checks+=3;
    }
    /* Bitselect is bitwise, including noncanonical masks. */
    m.lane[0]=0x55555555; z=vbslq_f32(m,x,y);
    require(z.lane[0]==((x.lane[0]&0x55555555)|(y.lane[0]&0xaaaaaaaa)),"partial bitselect mask");
    primitive_checks++;
  }
  require(runtime_arm_mul(0xffa12345,0x7fcabcde)==0xffe12345,"Arm signaling NaN first");
  require(runtime_arm_mul(0x7fcabcde,0xffa12345)==0xffe12345,"Arm second signaling before first quiet");
  require(runtime_arm_mul(0xffcabcde,0x7fc12345)==0xffcabcde,"Arm quiet payload order");
  require(runtime_rvv_mul(0xffa12345,0x3f800000)==0x7fc00000,"RVV canonical NaN");
  require(runtime_arm_mul(0,0x7f800000)==0x7fc00000&&runtime_rvv_mul(0,0x7f800000)==0x7fc00000,"invalid zero infinity");
  for(size_t n=0;n<100;n++) require(__riscv_vsetvl_e32m8(n)==(n<32?n:32),"VL policy");
  primitive_checks+=105;
}

static void wrong_result_control(void) {
  float input[4],output[1],expected[1]; struct xnn_f32_lrelu_params p;
  set_bits(input,0xc0000000); for(size_t i=1;i<4;i++) set_bits(input+i,0);
  set_bits(&p.scalar.slope,0x3f000000); test_neon(4,input,output,&p);
  require(observed(bits_at(output),oracle(0xc0000000,0x3f000000)),"negative-control valid baseline");
  set_bits(output,0x40000000);
  require(!observed(bits_at(output),oracle(0xc0000000,0x3f000000)),"wrong-result control rejected");
  set_bits(expected,oracle(0xc0000000,0x3f000000));
  require(compare_outputs(1,output,expected)==0,"public comparator rejects wrong result");
}
int main(int argc,char **argv) {
  require(sizeof(void*)==8,"LP64 pointer host");
  uint32_t endian_probe=1;
  require(((const unsigned char*)&endian_probe)[0]==1,"little endian host");
  require(fesetround(FE_TONEAREST)==0&&fegetround()==FE_TONEAREST,"RNE host");
  require(runtime_host_mul(1,0x3f800000)==1,"gradual underflow host");
  require(runtime_host_mul(0x80000000,0xbf800000)==0,"signed zero host");
  int control=argc>1&&!strcmp(argv[1],"--model-control");
  if(control) {
    /* A valid, finite case. Both wrong models agree, oracle must reject them. */
    check_case(1,0x3f000000,2,10); /* +1 must stay +1; wrong sign mask scales it. */
    fprintf(stderr,"wrong model unexpectedly survived\n"); return 2;
  }
  primitive_tests(); wrong_result_control();
  for(size_t n=1;n<=70;n++) {
    for(size_t s=0;s<NSPECIAL;s++) check_case(n,special[s],0,(unsigned)s);
    for(size_t r=0;r<4;r++) check_case(n,random_bits(),1,0);
  }
  const size_t boundaries[]={95,96,97,127,128,129,255,256,257,1023,1024,1025};
  for(size_t k=0;k<sizeof(boundaries)/sizeof(boundaries[0]);k++) {
    for(size_t s=0;s<NSPECIAL;s++) check_case(boundaries[k],special[s],0,(unsigned)s);
    for(size_t r=0;r<4;r++) check_case(boundaries[k],random_bits(),1,0);
  }
  for(size_t a=0;a<NSPECIAL;a++) for(size_t b=0;b<NSPECIAL;b++) check_case(1,special[b],2,(unsigned)a);
  printf("{\"passed\":true,\"cases\":%zu,\"active_lanes_per_path\":%zu,\"primitive_checks\":%zu,"
    "\"wrong_result_rejected\":true,\"public_equivalent_checked\":true}\n",cases,lanes,primitive_checks);
  return 0;
}
