#include <stdio.h>
#include <limits.h>
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vlrelu/shim/runtime.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vlrelu/proof/original/testNEON.c"
int main(int argc,char**argv){struct xnn_qs8_lrelu_params p={{0,0,0,0}};if(argc>1&&argv[1][0]=='p')p.scalar.positive_multiplier=INT_MIN;else p.scalar.negative_multiplier=INT_MIN;int8_t input[8]={0},output[1]={0};test_neon(1,input,output,&p);printf("%d\n",(int)output[0]);return 0;}
