#include "support.h"
#include "../../impl/testNEON.c"
#define test_neon test_neon_original
#include "../original/testNEON.c"
#undef test_neon
#include "../../impl/testRVV.c"
static int8_t oracle(int32_t bias,const int8_t *a,const int8_t *w,size_t k,size_t lane,float scale,float magic,int32_t off,int8_t lo,int8_t hi){
 uint32_t u=(uint32_t)bias;for(size_t d=0;d<k;d++)u+=(uint32_t)((int32_t)a[d]*w[8*d+lane]);
 int32_t acc;memcpy(&acc,&u,4);volatile float conv=(float)acc;volatile float mul=conv*scale;
 // Independent operand-priority decision, not a call to vector/arm_result helpers.
 uint32_t sb;memcpy(&sb,&scale,4);uint32_t mb;memcpy(&mb,&magic,4);uint32_t pb;memcpy(&pb,(const void*)&mul,4);
 if((sb&0x7fffffffu)>0x7f800000u)pb=sb|0x400000u;else if((pb&0x7fffffffu)>0x7f800000u)pb=0x7fc00000u;
 float m;memcpy(&m,&pb,4);volatile float add=m+magic;uint32_t ab;memcpy(&ab,(const void*)&add,4);
 if((mb&0x7fffffffu)>0x7f800000u && !(mb&0x400000u))ab=mb|0x400000u;
 else if((pb&0x7fffffffu)>0x7f800000u)ab=pb;
 else if((mb&0x7fffffffu)>0x7f800000u)ab=mb;
 else if((ab&0x7fffffffu)>0x7f800000u)ab=0x7fc00000u;
 int32_t si;memcpy(&si,&ab,4);int64_t q=(int64_t)si-off;
 if(q<-128)q=-128;if(q>127)q=127;if(q<lo)q=lo;if(q>hi)q=hi;return (int8_t)q;
}
static uint32_t rng=0x972a81u;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static const uint32_t specials[]={0,0x80000000u,0x00000001u,0x007fffffu,0x00800000u,0x3f800000u,0xbf800000u,0x4b400000u,0x7f7fffffu,0xff7fffffu,0x7f800000u,0xff800000u,0x7fc00000u,0x7fc00001u,0xffc00001u,0x7fffffffu,0xffffffffu,0x7f800001u,0xff800001u};
int main(void){
 const size_t ns[]={1,2,3,4,5,6,7,8,9,15,16,17,31};
 const size_t ks[]={1,2,3,4,5,6,7,8,9,15,16,17,31,32,33};
 size_t cases=0,cells=0;
 for(size_t ni=0;ni<sizeof ns/sizeof *ns;ni++)for(size_t ki=0;ki<sizeof ks/sizeof *ks;ki++)for(size_t mode=0;mode<80;mode++){
  size_t n=ns[ni],k=ks[ki],tiles=(n+7)/8,ps=64+8*k,alen=8*((k+7)/8);
  int8_t *a=malloc(alen),*acopy=malloc(alen);unsigned char *packed=malloc(ps*tiles),*pcopy=malloc(ps*tiles);
  int8_t *left=malloc(n+16),*right=malloc(n+16),*old=malloc(n+16);assert(a&&acopy&&packed&&pcopy&&left&&right&&old);
  for(size_t i=0;i<alen;i++)a[i]=(int8_t)(next()&255);memcpy(acopy,a,alen);
  for(size_t t=0;t<tiles;t++){
   unsigned char *w=packed+ps*t;
   for(size_t j=0;j<8;j++){uint32_t u=next();memcpy(w+4*j,&u,4);}
   for(size_t d=0;d<8*k;d++)w[32+d]=(unsigned char)next();
   for(size_t j=0;j<8;j++){uint32_t u=mode<38?specials[(mode+j)%19]:next();memcpy(w+32+8*k+4*j,&u,4);}
  }
  memcpy(pcopy,packed,ps*tiles);memset(left,0x5a,n+16);memset(right,0x5a,n+16);memset(old,0x5a,n+16);
  uint32_t mb=mode<38?specials[(mode/2)%19]:next();int32_t off=signedbits(mode%3==0?0x4b400000u:next());
  int8_t lo=mode%4==0?-128:(int8_t)next(),hi=mode%4==0?127:(int8_t)next();
  union xnn_qs8_qc8w_conv_minmax_params p={.fp32_neon={frombits(mb),off,lo,hi}},pc=p;
  test_neon(1,n,k,a,0,packed,left,0,8,&p);test_rvv(1,n,k,a,0,packed,right,0,8,&p);
  test_neon_original(1,n,k,a,0,packed,old,0,8,&p);
#ifdef BOTH_WRONG
  left[0]^=1;right[0]^=1;
#endif
  assert(memcmp(a,acopy,alen)==0&&memcmp(packed,pcopy,ps*tiles)==0&&memcmp(&p,&pc,sizeof p)==0);
  for(size_t j=0;j<n;j++){
   size_t t=j/8,l=j%8;unsigned char *w=packed+ps*t;int32_t bias;memcpy(&bias,w+4*l,4);float scale;memcpy(&scale,w+32+8*k+4*l,4);
   int8_t expected=oracle(bias,a,(const int8_t*)w+32,k,l,scale,p.fp32_neon.magic_bias,off,lo,hi);
   if(left[j]!=expected||right[j]!=expected||old[j]!=expected){printf("FAIL n=%zu k=%zu mode=%zu lane=%zu scale=%08x magic=%08x off=%d lo=%d hi=%d neon=%d rvv=%d originalNeon=%d expected=%d same=%d\n",n,k,mode,j,bits(scale),mb,off,lo,hi,left[j],right[j],old[j],expected,left[j]==right[j]);return 21;}
  }
  for(size_t j=n;j<n+16;j++)assert(left[j]==0x5a&&right[j]==0x5a&&old[j]==0x5a);
  cases++;cells+=n;free(a);free(acopy);free(packed);free(pcopy);free(left);free(right);free(old);
 }
 printf("PASS cases=%zu output_cells=%zu finite regression only; full kernels, original NEON, independent scalar oracle, input and output frame checked\n",cases,cells);return 0;
}
