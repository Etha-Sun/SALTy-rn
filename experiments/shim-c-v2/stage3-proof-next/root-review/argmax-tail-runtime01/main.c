#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-proof-next/maxpool/root41/.build/guard01/plain/unit.c"

#include <stdlib.h>
#include <stdio.h>
int main(int argc,char **argv) {
 const size_t pixels=1,k=10,channels=1;
 const float **input=malloc(k*sizeof(*input));
 float *left=malloc(4*sizeof(float)),*right=malloc(4*sizeof(float));
 size_t idx_count=(argc>2)?4:1;
 uint32_t *li=malloc(idx_count*sizeof(uint32_t)),*ri=malloc(idx_count*sizeof(uint32_t));
 for(size_t j=0;j<k;j++) { float *row=malloc(4*sizeof(float)); for(size_t i=0;i<4;i++)row[i]=(float)j; input[j]=row; }
 int mode=argc>1?atoi(argv[1]):0;
 if(mode==1) { test_rvv(pixels,k,channels,input,0,0,right,ri,k*sizeof(void*),channels*sizeof(float),channels*sizeof(uint32_t)); printf("rvv=%g index=%u\n",right[0],ri[0]); }
 else if(mode==2) { test_neon(pixels,k,channels,input,0,0,left,li,k*sizeof(void*),channels*sizeof(float),channels*sizeof(uint32_t)); printf("neon=%g index=%u\n",left[0],li[0]); }
 else printf("equivalent=%d\n",equivalent(pixels,k,channels,input,left,right,li,ri));
 return 0;
}
