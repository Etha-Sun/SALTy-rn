#include <stdint.h>
#include <limits.h>
/*@
 logic integer wrap16(integer x)=(int16_t)(uint16_t)x;
 logic integer centered(integer x,integer z)=wrap16((uint64_t)((int64_t)(int16_t)(-z)+x));
 logic integer target(integer x,integer z)=wrap16((uint64_t)((uint64_t)(int64_t)x-(uint64_t)(int64_t)(int16_t)z));
*/
/*@ ghost
/@ requires z!=INT32_MIN; terminates \true; assigns \nothing;
 ensures centered(x,z)==target(x,z); @/
void proof_center(int8_t x,int32_t z) {
 int32_t t=z;
 /@ loop invariant -2147483647<=t<=2147483647;
     loop invariant centered(x,z)==centered(x,t);
     loop invariant target(x,z)==target(x,t);
     loop assigns t; loop variant t-32767; @/
 while(t>32767) { t-=65536; }
 /@ loop invariant -2147483647<=t<=32767;
     loop invariant centered(x,z)==centered(x,t);
     loop invariant target(x,z)==target(x,t);
     loop assigns t; loop variant -32768-t; @/
 while(t< -32768) { t+=65536; }
 if(t== -32768) {
  if(x>=0) { /@ assert centered(x,t)==target(x,t); @/ }
  else { /@ assert centered(x,t)==target(x,t); @/ }
 } else {
  /@ assert (int16_t)(-t)== -t; @/
  /@ assert (int16_t)t==t; @/
  /@ assert centered(x,t)==target(x,t); @/
 }
}
*/
