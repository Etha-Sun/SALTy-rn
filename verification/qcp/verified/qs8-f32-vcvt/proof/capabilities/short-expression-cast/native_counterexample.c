#include "probe.c"
#include <stdio.h>
_Static_assert(sizeof(int16_t)==2 && sizeof(int32_t)==4,"16/32-bit configuration");
int main(void){
 int16_t a=32767;int8_t b=1;
 printf("expression=%d temporary=%d expected=-32768\n",(int)cast_expression(a,b),(int)cast_temporary(a,b));
 return !(cast_expression(a,b)==-32768 && cast_temporary(a,b)==-32768);
}
