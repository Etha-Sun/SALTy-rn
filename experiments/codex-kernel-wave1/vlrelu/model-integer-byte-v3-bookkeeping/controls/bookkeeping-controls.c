#include <stdint.h>
/*@ \wp::strategy MaskSMT: \prover("z3","cvc5",3);
    \wp::strategy MaskBits32:
      \tactic("Wp.bitwised",\param("Wp.bitwised.range",32),\children(MaskSMT)); */
/*@ requires 0<=u<4294967296; terminates \true; assigns \nothing;
    ensures mask_ok: (u&2147483647)==(((uint32_t)(u<<1))>>1); */
void mask_good(uint32_t u) {}
/*@ \wp::proof MaskBits32: mask_ok; */
/*@ requires 0<=u<4294967296; terminates \true; assigns \nothing;
    ensures mask_bad: (u&2147483647)==(((uint32_t)(u<<1))>>2); */
void mask_bad(uint32_t u) {}
/*@ \wp::proof MaskBits32: mask_bad; */
/*@ terminates \true; assigns \nothing; ensures \true; */
void bookkeeping_true(void) {}
/*@ terminates \true; assigns \nothing; ensures \false; */
void bookkeeping_false(void) {}
