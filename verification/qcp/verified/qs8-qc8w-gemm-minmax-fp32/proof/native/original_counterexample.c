#include "support.h"
#include "../original/testNEON.c"
#include "../original/testRVV.c"
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
int main(void){
 int8_t a[8]={1};unsigned char packed[72];memset(packed,0,sizeof packed);
 for(int i=0;i<8;i++){packed[32+i]=0;float scale=frombits(0xffc00001u);memcpy(packed+40+4*i,&scale,4);}
 union xnn_qs8_qc8w_conv_minmax_params p={.fp32_neon={12582912.0f,0x4b400000,-128,127}};
 int8_t left[16],right[16];memset(left,42,sizeof left);memset(right,42,sizeof right);
 test_neon(1,1,1,a,0,packed,left,0,8,&p);test_rvv(1,1,1,a,0,packed,right,0,8,&p);
 int8_t expected=oracle(0,a,(const int8_t*)packed+32,1,0,frombits(0xffc00001u),p.fp32_neon.magic_bias,p.fp32_neon.magic_bias_less_output_zero_point,-128,127);
 printf("original full kernels: mr=1 nc=1 kc=1 bias=0 A=1 W=0 scale_bits=0xffc00001 magic_bits=0x4b400000 offset=0x4b400000 lo=-128 hi=127 NEON=%d RVV=%d oracle=%d\n",left[0],right[0],expected);
 for(int i=1;i<16;i++)assert(left[i]==42&&right[i]==42);
 assert(left[0]==expected);assert(left[0]==-128);assert(right[0]==127);return 0;
}
