#include <stdint.h>
/*@ requires (2139095040<u<2147483648) || (4286578688<u<4294967296);
    assigns \nothing;
    ensures (u & 2139095040)==2139095040 && (u & 8388607)!=0; */
void proof_nan_mask(uint32_t u) {
 /*@ assert shift_division: (u>>23)==u/8388608; */
 if (u<2147483648u) {
  /*@ assert quotient_positive: u/8388608==255; */
  /*@ assert high_positive: (u>>23)==255; */
  /*@ assert exponent_positive: (u & 2139095040)==2139095040; */
  if ((u&8388607u)==0) { /*@ assert positive_zero: u==2139095040; */ }
  /*@ assert mantissa_positive: (u & 8388607)!=0; */
 } else {
  /*@ assert quotient_negative: u/8388608==511; */
  /*@ assert high_negative: (u>>23)==511; */
  /*@ assert exponent_negative: (u & 2139095040)==2139095040; */
  if ((u&8388607u)==0) { /*@ assert negative_zero: u==4286578688; */ }
  /*@ assert mantissa_negative: (u & 8388607)!=0; */
 }
}
/*@ requires (u & 2139095040)!=2139095040 || (u & 8388607)==0;
    assigns \nothing;
    ensures u<=2139095040 || (2147483648<=u<=4286578688); */
void proof_non_nan_mask(uint32_t u) {
 if ((2139095040u<u && u<2147483648u) || (4286578688u<u)) proof_nan_mask(u);
}
/*@ assigns \nothing; ensures \false; */
void bridge_false(void) {}
/*@ \wp::strategy MaskRootSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy MaskRootShift: \tactic("Wp.shift",\ingoal(lsr(U,N)),\children(MaskRootSolve)), MaskRootSolve;
 \wp::proof MaskRootShift:shift_division; */
