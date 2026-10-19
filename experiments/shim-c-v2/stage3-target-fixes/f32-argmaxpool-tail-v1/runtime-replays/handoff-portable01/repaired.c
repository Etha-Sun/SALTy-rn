#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/runtime-replays/handoff-portable01/.build/repaired/unit.c"

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
static uint32_t rng=0x9172ab34u;
static float value(size_t p,size_t row,size_t c,int pattern) {
 if(pattern==0)return (float)row;
 if(pattern==1)return 3.0f;
 if(pattern==2)return row==0?NAN:(float)(row+c);
 if(pattern==3) { const float values[]={0.0f,-0.0f,INFINITY,-INFINITY,NAN,1.0f,-1.0f}; return values[(p+row+c)%7]; }
 rng=1664525u*rng+1013904223u;float x;memcpy(&x,&rng,4);return x;
}
int main(void) {
 const size_t cs[]={1,2,3,4,5,7,8,9,15,16,17,31,32,33};
 const size_t ks[]={1,2,8,9,10,17,18,19,27,28};
 size_t cases=0;
 for(size_t pixels=1;pixels<=3;pixels++)for(size_t ci=0;ci<14;ci++)for(size_t ki=0;ki<10;ki++)for(int pattern=0;pattern<5;pattern++) {
  size_t channels=cs[ci],k=ks[ki],n=pixels*channels;
  const float **input=malloc(pixels*k*sizeof(*input));
  float *left=malloc((n+3)*sizeof(float)),*right=malloc((n+3)*sizeof(float));
  uint32_t *li=malloc(n*sizeof(uint32_t)),*ri=malloc(n*sizeof(uint32_t));
  if(!input||!left||!right||!li||!ri)return 2;
  for(size_t j=0;j<pixels*k;j++) { float *row=malloc((channels+3)*sizeof(float));if(!row)return 2;for(size_t c=0;c<channels+3;c++)row[c]=value(j/k,j%k,c,pattern);input[j]=row; }
  for(size_t j=0;j<n+3;j++){left[j]=123.0f;right[j]=-456.0f;}
  for(size_t j=0;j<n;j++){li[j]=UINT32_MAX;ri[j]=UINT32_MAX-1;}
  int eq=equivalent(pixels,k,channels,input,left,right,li,ri);
  if(eq!=1){fprintf(stderr,"cross mismatch p=%zu c=%zu k=%zu pattern=%d\n",pixels,channels,k,pattern);return 3;}
  for(size_t p=0;p<pixels;p++)for(size_t c=0;c<channels;c++) {
   float best=input[p*k][c];uint32_t idx=0;
   for(size_t j=1;j<k;j++)if(input[p*k+j][c]>best){best=input[p*k+j][c];idx=(uint32_t)j;}
   size_t out=p*channels+c;
   if(!((left[out]==best)||(isnan(left[out])&&isnan(best)))||li[out]!=idx||ri[out]!=idx){fprintf(stderr,"reference mismatch p=%zu c=%zu k=%zu pattern=%d\n",pixels,channels,k,pattern);return 4;}
  }
  for(size_t j=0;j<pixels*k;j++)free((void*)input[j]);free(input);free(left);free(right);free(li);free(ri);cases++;
 }
 printf("%zu exact-index-extent cases passed: NEON/RVV and scalar reference; ASan+UBSan enabled\n",cases);
 return 0;
}
