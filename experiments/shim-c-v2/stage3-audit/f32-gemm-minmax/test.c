#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "unit.c"

static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static float frombits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static int same(float a,float b){return a==b||(a!=a&&b!=b);}
static size_t cases=0,failed=0;
static void compare(const float *a,const float *b,size_t n,size_t dim,unsigned mode){
 cases++;for(size_t i=0;i<n;i++)if(!same(a[i],b[i])){if(failed<8)printf("mismatch dim=%zu mode=%u index=%zu neon=%08x rvv=%08x\n",dim,mode,i,bits(a[i]),bits(b[i]));failed++;break;}}
static void fill(float *p,size_t n,unsigned seed){for(size_t i=0;i<n;i++)p[i]=((float)(int)((i*7+seed)%23)-11.0f)/9.0f;}
static void finish(void){printf("cases=%zu failed=%zu\n",cases,failed);}
static int one(size_t mr,size_t nc,size_t k,unsigned mode) {
  size_t tiles=(nc+7)/8, wn=tiles*(k+1)*8;
  float *a=calloc(4*k,sizeof(float)),*w=calloc(wn,sizeof(float));
  float *left=calloc(4*nc,sizeof(float)),*right=calloc(4*nc,sizeof(float));
  if(!a||!w||!left||!right)abort();
  for(size_t i=0;i<4*k;i++)a[i]=(float)((int)(i%9)-4)*0.125f;
  for(size_t i=0;i<wn;i++)w[i]=(float)((int)(i%13)-6)*0.0625f;
  struct xnn_f32_minmax_params p={{-0.75f,0.625f}};
  float qnan=frombits(UINT32_C(0xffc03456));
  switch(mode) {
  case 1: a[k/2]=qnan;break;
  case 2: w[8+(nc>3?3:0)]=qnan;break;
  case 3: for(size_t t=0;t<tiles;t++)w[t*(k+1)*8]=qnan;break;
  case 4: p.scalar.min=qnan;break;
  case 5: p.scalar.max=qnan;break;
  case 6: p.scalar.min=qnan;p.scalar.max=qnan;break;
  case 7: for(size_t i=0;i<4*k;i++)a[i]=i%2?-0.0f:0.0f;
          for(size_t i=0;i<wn;i++)w[i]=i%2?0.0f:-0.0f;
          p.scalar.min=-0.0f;p.scalar.max=0.0f;break;
  case 8: a[0]=INFINITY;w[8]=0.0f;break;
  case 9: a[0]=-INFINITY;p.scalar.min=-INFINITY;p.scalar.max=INFINITY;break;
  case 10: w[0]=INFINITY;w[8]=-INFINITY;a[0]=1.0f;break;
  case 11: p.scalar.min=INFINITY;p.scalar.max=-INFINITY;break;
  }
  if(!equivalent(mr,nc,k,a,w,left,right,p.scalar.min,p.scalar.max)){fprintf(stderr,"wrapper mismatch\n");return 2;}
  int ok=1;
  for(size_t r=0;r<mr;r++)for(size_t c=0;c<nc;c++) {
    size_t at=r*nc+c;
    if(!same(left[at],right[at])) {
      fprintf(stderr,"mismatch mr=%zu nc=%zu k=%zu mode=%u row=%zu col=%zu %08x %08x\n",mr,nc,k,mode,r,c,bits(left[at]),bits(right[at]));ok=0;
    }
  }
  free(a);free(w);free(left);free(right);return ok;
}
int main(void){if(fegetround()!=FE_TONEAREST)return 3;size_t columns[]={1,2,3,4,7,8,9,17,23,33},depths[]={1,2,3,7,16};size_t count=0;
for(size_t mr=1;mr<=4;mr++)for(size_t j=0;j<10;j++)for(size_t q=0;q<5;q++)for(unsigned mode=0;mode<12;mode++){if(!one(mr,columns[j],depths[q],mode))return 2;count++;}
printf("cases=%zu failed=0\n",count);return 0;}