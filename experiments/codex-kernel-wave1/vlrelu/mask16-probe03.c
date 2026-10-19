#include "/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/codex-kernel-wave1/integer/qs8-vlrelu-v4/.build/full01/annotated/shim.h"
/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures low_a: ((a&m)&65535)==(a&m);
    ensures low_b: ((b&~m)&65535)==(b&~m);
    ensures merge: L_wrap16(((a&m)&65535)|((b&~m)&65535))==L_wrap16((a&m)|(b&~m)); @/
void mask16_normalize(uint16_t a,uint16_t b,uint16_t m) {
 /@ assert range_a: 0<=(a&m)<=65535; @/
 /@ assert range_b: 0<=(b&~m)<=65535; @/
 /@ assert masked_a_exact: ((a&m)&65535)==(a&m); @/
 /@ assert masked_b_exact: ((b&~m)&65535)==(b&~m); @/
}
*/
/*@ terminates \true; assigns \nothing; ensures \false; */
void mask16_false(void) {}
/*@
 \wp::strategy MaskSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy MaskRange: \tactic("Wp.bitrange",\children(MaskRange)), MaskSolve;
 \wp::strategy MaskSplit: \tactic("Wp.split",\children(MaskRange)), MaskRange;
 \wp::strategy MaskBits: \tactic("Wp.bitwised",\param("Wp.bitwised.range",16),\children(MaskSplit)), MaskRange;
 \wp::proof MaskBits:mask16_normalize;
*/
