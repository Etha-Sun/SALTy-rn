#include "spec.h"
/*@ ghost
/@ requires b==0 || b==4 || b==8 || b==12;
    terminates \true;
    assigns \nothing;
    ensures tail_eight: ((b & 8) != 0) <==> (b==8 || b==12);
    ensures tail_four: ((b & 4) != 0) <==> (b==4 || b==12);
    ensures tail_parts: b/4 == ((b & 8) != 0 ? 2 : 0) + ((b & 4) != 0 ? 1 : 0);
    ensures tail_remaining: (b%8)/4 == ((b & 4) != 0 ? 1 : 0);
    ensures tail_after_two: b/4 - ((b & 8) != 0 ? 2 : 0) == (b%8)/4; @/
void proof_f32_tail_bits(size_t b) {
  switch (b) { case 0: break; case 4: break; case 8: break; case 12: break; }
}
*/
#include "base.c"
#include "float_ops.c"
#include "representation.c"
#include "mul.c"
#include "mulc.c"
#include "bits.c"
#include "mask.c"
#include "sub.c"
#include "neon.c"
#include "rvv.c"
#include "harness.c"
