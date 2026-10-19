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

int main(void){if(fegetround()!=FE_TONEAREST)return 3;for(size_t pixels=1;pixels<=3;pixels++)for(size_t k=1;k<=20;k++)for(size_t c=1;c<=35;c++)for(unsigned mode=0;mode<5;mode++){
 float *a=calloc(pixels*k*(c+3),4),*l=calloc(pixels*c+3,4),*r=calloc(pixels*c+3,4);uint32_t *li=calloc(pixels*c+3,4),*ri=calloc(pixels*c+3,4);const float **tab=malloc(pixels*k*sizeof(float*));fill(a,pixels*k*(c+3),2);
 for(size_t j=0;j<pixels*k;j++)tab[j]=a+j*(c+3);
 if(mode==1)a[(k/2)*(c+3)]=NAN;if(mode==2)for(size_t i=0;i<pixels*k*(c+3);i++)a[i]=1.0f;if(mode==3)a[0]=NAN;
 if(!equivalent(pixels,k,c,tab,l,r,li,ri)){fprintf(stderr,"wrapper mismatch\n");return 2;}compare(l,r,c,c,mode);
 for(size_t i=0;i<c;i++)if(li[i]!=ri[i]){if(failed<8)printf("index mismatch c=%zu k=%zu mode=%u lane=%zu neon=%u rvv=%u\n",c,k,mode,i,li[i],ri[i]);failed++;break;}
 free(a);free(l);free(r);free(li);free(ri);free(tab);}finish();return 0;}
