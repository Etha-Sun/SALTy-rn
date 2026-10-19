#include <stdint.h>
#include <limits.h>
/*@ ghost
/@ requires 1<=s<=62; terminates \true; assigns \nothing;
   ensures 2 <= ((int64_t)1<<s) <= INT64_MAX; @/
void power_bound(unsigned s) {
 switch(s) {
case 1:break;
case 2:break;
case 3:break;
case 4:break;
case 5:break;
case 6:break;
case 7:break;
case 8:break;
case 9:break;
case 10:break;
case 11:break;
case 12:break;
case 13:break;
case 14:break;
case 15:break;
case 16:break;
case 17:break;
case 18:break;
case 19:break;
case 20:break;
case 21:break;
case 22:break;
case 23:break;
case 24:break;
case 25:break;
case 26:break;
case 27:break;
case 28:break;
case 29:break;
case 30:break;
case 31:break;
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
/*@ terminates \true; assigns \nothing;
    ensures s>0 ==> INT64_MIN/2<=\result<=INT64_MAX/2;
    ensures \result== (s==0?x:s>=63?(x<0?-1:0):(x>=0?x/(1<<s):-1-((-1-x)/(1<<s)))); */
int64_t asr64(int64_t x,unsigned s) {
 if(!s)return x;
 if(s>=63)return x<0?-1:0;
 //@ ghost power_bound(s);
 /*@ assert x<0 ==> 0<=(-1-x)/((int64_t)1<<s)<= -1-x; */
 return x>=0?x/((int64_t)1<<s):-1-((-1-x)/((int64_t)1<<s));
}
