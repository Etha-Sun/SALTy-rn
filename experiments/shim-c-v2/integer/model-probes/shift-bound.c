#include <stdint.h>
#include <limits.h>
/*@ ghost
/@ requires s<32; terminates \true; assigns \nothing;
   ensures 0 <= ((uint64_t)a<<s) <= 140737488355327;
   ensures (uint64_t)((uint64_t)a<<s)==((uint64_t)a<<s); @/
void shift_bound(uint16_t a,unsigned s) {
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
*/
/*@ requires n<32; terminates \true; assigns \nothing;
 ensures \result==((uint64_t)a<<n); */
uint64_t shift_model(uint16_t a,unsigned n) {
 //@ ghost shift_bound(a,n);
 return (uint64_t)a<<n;
}
