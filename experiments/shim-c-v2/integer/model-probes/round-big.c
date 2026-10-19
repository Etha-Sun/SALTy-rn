#include <stdint.h>
#include <limits.h>
/*@
  logic integer L_sat16(integer x)=x>32767?32767:x< -32768?-32768:x;
  logic integer L_sat8(integer x)=x>127?127:x< -128?-128:x;
  logic integer L_satu8(integer x)=x>255?255:x<0?0:x;
  logic integer L_sat32(integer x)=x>2147483647?2147483647:x< -2147483648?-2147483648:x;
  logic integer L_wrap8(integer x)=(int8_t)(uint8_t)x;
  logic integer L_wrap16(integer x)=(int16_t)(uint16_t)x;
  logic integer L_wrap32(integer x)=(int32_t)(uint32_t)x;
  logic integer L_asr64(integer x,integer s)=s==0?x:s>=63?(x<0?-1:0):(x>=0?x/(1<<s):-1-((-1-x)/(1<<s)));
  logic integer L_round_shift(integer x,integer s,integer mode)=s==0?x:s>=63?0:L_asr64(x,s)+(mode==0 && ((uint64_t)x & ((uint64_t)1<<(s-1))) ? 1:0);
*/
/*@ ghost
/@ requires s>=32; terminates \true; assigns \nothing;
 ensures L_round_shift(x,s,0)==0; @/
void round_big(int32_t x,unsigned s) {
 if(s>=63)return;
 switch(s) {
case 32:break;
case 33:break;
case 34:break;
case 35:break;
case 36:break;
case 37:break;
case 38:break;
case 39:break;
case 40:break;
case 41:break;
case 42:break;
case 43:break;
case 44:break;
case 45:break;
case 46:break;
case 47:break;
case 48:break;
case 49:break;
case 50:break;
case 51:break;
case 52:break;
case 53:break;
case 54:break;
case 55:break;
case 56:break;
case 57:break;
case 58:break;
case 59:break;
case 60:break;
case 61:break;
case 62:break;
 }
}
*/
