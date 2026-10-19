#include <stdint.h>
/*@ logic float from_repr32(integer u); */
/*@ requires (u & 2139095040)!=2139095040 || (u & 8388607)==0;
    assigns \nothing;
    ensures u<=2139095040 || (2147483648<=u<=4286578688); */
void proof_non_nan_mask(uint32_t u) {}
/*@ requires (2139095040<u<2147483648) || (4286578688<u<4294967296);
    assigns \nothing;
    ensures (u & 2139095040)==2139095040 && (u & 8388607)!=0; */
void proof_nan_mask(uint32_t u) {}
/*@ assigns \nothing;
    ensures \is_NaN(from_repr32(u)) <==>
      ((2139095040<u<2147483648) || (4286578688<u<4294967296)); */
void proof_nan32_intervals(uint32_t u) {}
/*@ assigns \nothing; ensures \false; */
void bridge_false(void) {}

/*@ \wp::strategy MaskRootSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy MaskRootRange: \tactic("Wp.bitrange",\children(MaskRootRange)), MaskRootSolve;
 \wp::strategy MaskRootBits: \tactic("Wp.bitwised",\param("Wp.bitwised.range",32),\children(MaskRootRange)), MaskRootRange;
 \wp::proof MaskRootBits:proof_nan_mask,proof_non_nan_mask; */
