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

int main(void){if(fegetround()!=FE_TONEAREST)return 3;for(size_t h=1;h<=5;h++)for(size_t w=1;w<=11;w++)for(size_t nc=1;nc<=5;nc++)for(unsigned mode=0;mode<6;mode++){
 size_t oh=(h+1)/2,ow=(w+1)/2;float *abase=calloc(h*w*3+3,4),*a=abase,*zbase=calloc(w*3+3,4),*z=zbase,*wt=calloc(((nc+3)/4)*112,4),*l=calloc(nc*oh*ow,4),*r=calloc(nc*oh*ow,4);fill(a,h*w*3,1);fill(wt,((nc+3)/4)*112,4);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 if(!equivalent(h,w,nc,a,wt,z,l,r,p.scalar.min,p.scalar.max)){fprintf(stderr,"wrapper mismatch\n");return 2;}compare(l,r,nc*oh*ow,w,mode);
 free(abase);free(zbase);free(wt);free(l);free(r);}finish();return 0;}
