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
*/
