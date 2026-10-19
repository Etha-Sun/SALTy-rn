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
static void fill(float *p,size_t n,unsigned seed){for(size_t i=0;i<n;i++)p[i]=frombits((uint32_t)(i*2654435761u+seed*2246822519u));}
static void finish(void){printf("cases=%zu failed=%zu\n",cases,failed);}

int main(void){if(fegetround()!=FE_TONEAREST)return 3;for(size_t nc=1;nc<=25;nc++)for(size_t k=1;k<=5;k++)for(size_t ks=1;ks<=3;ks++)for(unsigned mode=0;mode<5;mode++){
 size_t wn=((nc+7)/8)*(1+ks*k)*8;float *a=calloc(ks*(k+4),4),*w=calloc(wn,4),*l=calloc(nc,4),*r=calloc(nc,4);const float **tab=malloc(ks*sizeof(float*));fill(a,ks*(k+4),1);fill(w,wn,4);for(size_t p=0;p<ks;p++)tab[p]=a+p*(k+4);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 if(!equivalent(nc,k,ks,tab,w,l,r,p.scalar.min,p.scalar.max)){fprintf(stderr,"wrapper mismatch\n");return 2;}compare(l,r,nc,nc,mode);
 free(a);free(w);free(l);free(r);free(tab);}finish();return 0;}
