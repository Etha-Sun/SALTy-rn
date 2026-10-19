#include <stdint.h>
/* Independent tool controls: no requires, axioms, or external ghost contracts.
   Each deliberately false claim has its own function to avoid contamination. */
/*@ \wp::strategy HighBitLeaf: \prover("z3",10), \prover("cvc5",10);
    \wp::strategy HighBit64:
      \tactic("Wp.bitwised", \ingoal(A == B),
        \param("Wp.bitwised.range",64), \children(HighBitLeaf)), HighBitLeaf;
    \wp::proof HighBit64: high_reconstruct, high_shift,
      false_bit62, false_bit63, false_ignore_high;
*/
/*@ assigns \nothing;
    ensures good_reconstruct: \result == x;
*/
uint64_t high_reconstruct(uint64_t x) {
  return (x & UINT64_C(4611686018427387903)) |
         (x & UINT64_C(4611686018427387904)) |
         (x & UINT64_C(9223372036854775808));
}
/*@ assigns \nothing;
    ensures good_shift: \result == (x & UINT64_C(18446744073709551614));
*/
uint64_t high_shift(uint64_t x) { return (x >> 1) << 1; }
/*@ assigns \nothing;
    ensures deliberately_false_bit62: \result == x;
*/
uint64_t false_bit62(uint64_t x) { return x ^ UINT64_C(4611686018427387904); }
/*@ assigns \nothing;
    ensures deliberately_false_bit63: \result == x;
*/
uint64_t false_bit63(uint64_t x) { return x ^ UINT64_C(9223372036854775808); }
/*@ assigns \nothing;
    ensures deliberately_false_ignore_high: \result == x;
*/
uint64_t false_ignore_high(uint64_t x) { return x & UINT64_C(4611686018427387903); }
