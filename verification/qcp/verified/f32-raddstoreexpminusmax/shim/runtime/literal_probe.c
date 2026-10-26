#include <stdint.h>
#include <string.h>
#include <stdio.h>
int main(void){float old[]={0x1.715476p+0f,0x1.8000FEp23f,0x1.0F9F9Cp-7f,0x1.573A1Ap-5f,0x1.555A80p-3f,0x1.FFFDC6p-2f,0x1.FFFFF6p-1f,-0x1.5D589Ep6f,-0x1.62E430p-1f};float current[]={1.44269502162933349609375f,12583039.0f,0.00828929059207439422607421875f,0.0418978221714496612548828125f,0.16667652130126953125f,0.4999915063381195068359375f,0.999999701976776123046875f,-87.33654022216796875f,-0.693147182464599609375f};for(unsigned i=0;i<sizeof(old)/sizeof(*old);i++){uint32_t a,b;memcpy(&a,old+i,4);memcpy(&b,current+i,4);if(a!=b)return 1;printf("literal[%u]=%08x\n",i,a);}return 0;}
