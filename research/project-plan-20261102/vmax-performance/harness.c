#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <riscv_vector.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/microparams.h"
#include <stdio.h>
#include "fixture.h"
void test_rvv(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
static float out[65540] __attribute__((aligned(4096)));
int main(void){
  const size_t sizes[]={16,64,256,1024,4096,16384,65536};
  struct xnn_f32_default_params params={0};
  for(unsigned s=0;s<7;s++){
    size_t n=sizes[s];out[n]=123456.0f;
    test_rvv(n*4,a,b,out,&params);
    for(unsigned trial=0;trial<3;trial++){
      unsigned long begin,end;
      __asm__ volatile("fence rw,rw; rdcycle %0":"=r"(begin)::"memory");
      test_rvv(n*4,a,b,out,&params);
      __asm__ volatile("fence rw,rw; rdcycle %0":"=r"(end)::"memory");
      printf("CYCLE_COUNTER n%lu-t%u %lu\n",(unsigned long)n,trial,end-begin);
    }
    for(size_t i=0;i<n;i++){if(out[i]!=gold[i]){printf("FAIL n%lu i%lu\n",(unsigned long)n,(unsigned long)i);return 1;}}
    if(out[n]!=123456.0f){printf("FAIL canary\n");return 1;}
  }
  printf("PASS\n");return 0;
}
