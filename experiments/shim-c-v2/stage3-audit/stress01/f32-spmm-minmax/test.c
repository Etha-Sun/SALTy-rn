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

int main(void){if(fegetround()!=FE_TONEAREST)return 3;for(size_t m=1;m<=35;m++)for(size_t nc=1;nc<=5;nc++)for(unsigned mode=0;mode<6;mode++){
 float *a=calloc(m*nc+m+128,4),*w=calloc(nc*2+32,4),*l=calloc(nc*(m+4),4),*r=calloc(nc*(m+4),4);int32_t *dm=calloc(nc,4);uint32_t *nz=calloc(nc,4);
 for(size_t i=0;i<m*nc+m+128;i++)a[i]=frombits(0x3f800001);for(size_t i=0;i<nc;i++){w[2*i]=-1.0f;w[2*i+1]=frombits(0x3f7fffff);nz[i]=1;if(mode==5)dm[i]=4;}
 if(mode==5){for(size_t i=0;i<m*nc+m+128;i++)a[i]=(float)i;for(size_t i=0;i<nc;i++){w[2*i]=0.0f;w[2*i+1]=1.0f;}}
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 if(!equivalent(m,nc,a,w,dm,nz,l,r,p.scalar.min,p.scalar.max)){fprintf(stderr,"wrapper mismatch\n");return 2;}for(size_t n=0;n<nc;n++)compare(l+n*(m+4),r+n*(m+4),m,m,mode);
 free(a);free(w);free(l);free(r);free(dm);free(nz);}finish();return 0;}
