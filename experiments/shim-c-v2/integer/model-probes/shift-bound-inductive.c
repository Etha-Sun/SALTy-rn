#include <stdint.h>
/*@ ghost
/@ requires s<32; terminates \true; assigns \nothing;
    ensures ((uint64_t)a<<s)==a*((uint64_t)1<<s); @/
void shift_induction(uint16_t a,unsigned s) {
 /@ loop invariant 0<=k<=s;
     loop invariant ((uint64_t)a<<k)==a*((uint64_t)1<<k);
     loop assigns k; loop variant s-k; @/
 for(unsigned k=0;k<s;k++) {
  /@ assert (((uint64_t)a<<k)<<1)==((uint64_t)a<<(k+1)); @/
  /@ assert (((uint64_t)1<<k)<<1)==((uint64_t)1<<(k+1)); @/
 }
}
/@ requires s<32; terminates \true; assigns \nothing;
 ensures 0 < ((uint64_t)1<<s) <= 2147483648; @/
void power32_bound(unsigned s) {
 switch(s) {
case 0:break;
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
 }
}
/@ requires s<32; terminates \true; assigns \nothing;
 ensures 0 <= ((uint64_t)a<<s) <= 140737488355327;
 ensures (uint64_t)((uint64_t)a<<s)==((uint64_t)a<<s); @/
void shift_bound(uint16_t a,unsigned s) {
 shift_induction(a,s);
 power32_bound(s);
}
*/
