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

int main(void){if(fegetround()!=FE_TONEAREST)return 3;for(size_t nc=1;nc<=35;nc++)for(size_t k=1;k<=19;k++)for(unsigned mode=0;mode<5;mode++){
 size_t kk=(k+1)&~1u,blocks=(nc+15)/16,wb=64+kk/2*16+128;unsigned char *buf=calloc(blocks*wb,1);int8_t *a=calloc(kk+8,1);float *l=calloc(nc,4),*r=calloc(nc,4);
 for(size_t i=0;i<kk;i++)a[i]=(int8_t)((int)(i%17)-8);for(size_t b=0;b<blocks;b++){for(size_t i=0;i<kk/2*16;i++)buf[b*wb+64+i]=(unsigned char)(i*19+7);for(size_t i=0;i<16;i++){int32_t ks=(int32_t)(i*16);memcpy(buf+b*wb+i*4,&ks,4);float scale=0.125f,bias=0.25f;memcpy(buf+b*wb+64+kk/2*16+i*4,&scale,4);memcpy(buf+b*wb+64+kk/2*16+64+i*4,&bias,4);}}
 struct xnn_f32_qc4w_minmax_params p={{-INFINITY,INFINITY,0}};struct xnn_qd8_quantization_params q={3,0.25f};if(mode==1)q.inv_scale=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 if(!equivalent(nc,k,a,buf,l,r,q.zero_point,q.inv_scale,p.scalar.min,p.scalar.max)){fprintf(stderr,"wrapper mismatch\n");return 2;}compare(l,r,nc,nc,mode);
 free(buf);free(a);free(l);free(r);}finish();return 0;}
