#include <stdint.h>
/*@ logic integer rem16(integer x)=((x%65536)+65536)%65536;
 logic integer signed16(integer x)=rem16(x)<=32767?rem16(x):rem16(x)-65536; */
/*@ ghost
/@ terminates \true; assigns \nothing;
 ensures (uint16_t)x==x%65536; @/
void proof_uint16_mod(uint64_t x) {
 uint64_t t=x;
 /@ loop invariant (uint16_t)t==(uint16_t)x;
     loop invariant t%65536==x%65536;
     loop assigns t; loop variant t; @/
 while(t>=65536) { t-=65536; }
}
/@ terminates \true; assigns \nothing;
 ensures (int16_t)x==signed16(x); @/
void proof_sint16_mod(int32_t x) {
 int32_t t=x;
 /@ loop invariant (int16_t)t==(int16_t)x;
     loop invariant rem16(t)==rem16(x);
     loop assigns t; loop variant t-32767; @/
 while(t>32767) { t-=65536; }
 /@ loop invariant t<=32767;
     loop invariant (int16_t)t==(int16_t)x;
     loop invariant rem16(t)==rem16(x);
     loop assigns t; loop variant -32768-t; @/
 while(t< -32768) { t+=65536; }
 if(t<0) { /@ assert rem16(t)==t+65536; @/ }
 else { /@ assert rem16(t)==t; @/ }
}
*/
