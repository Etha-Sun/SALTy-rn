#include "spec.h"
/*@ ghost
/@ requires b<=7; terminates \true; assigns \nothing;
   ensures four: (b&4)!=0 ==> 4<=b;
   ensures two: (b&2)!=0 ==> 2<=b%4;
   ensures one: (b&1)!=0 ==> b%2==1;
   ensures parts: b==((b&4)!=0?4:0)+((b&2)!=0?2:0)+((b&1)!=0?1:0); @/
void proof_tail8(size_t b) {
  switch(b) { case 0: break; case 1: break; case 2: break; case 3: break;
              case 4: break; case 5: break; case 6: break; case 7: break; }
}
*/
#include "integer-qu8-f32-vcvt.c"
#include "neon.c"
#include "rvv.c"
#include "harness.c"
