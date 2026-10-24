#include "original.c"
#include <stdio.h>
#include <fenv.h>
int main(void){
 if(fesetround(FE_TONEAREST))return 2;
 int8_t A[8]={0};_Alignas(4) unsigned char W[208]={0};float L[16]={0},R[16]={0};
 float one=1.0f;for(int i=0;i<16;i++)memcpy(W+80+4*i,&one,4);
 uint32_t nan=0x7fc00000;struct xnn_qd8_quantization_params q={0,0};memcpy(&q.inv_scale,&nan,4);
 struct xnn_f32_qc4w_minmax_params p={{-1,1,0}};
 test_neon(1,1,1,A,0,W,L,0,64,&p,&q);test_rvv(1,1,1,A,0,W,R,0,64,&p,&q);
 uint32_t l,r;memcpy(&l,L,4);memcpy(&r,R,4);
 printf("{\"neon_bits\":%u,\"rvv_bits\":%u,\"same\":%s}\n",l,r,(L[0]==R[0]||(isnan(L[0])&&isnan(R[0])))?"true":"false");
 return isnan(L[0])&&R[0]==-1.0f?0:1;
}
