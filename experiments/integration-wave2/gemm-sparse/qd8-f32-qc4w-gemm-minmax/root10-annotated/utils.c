#include "fp_primitives.h"

void xnn_prefetch_to_l1(const void *p) { (void)p; }

size_t round_down_po2(size_t n,size_t q) { return n & ~(q-1); }

/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_clear_half: (x & (SIZE_MAX-1))==2*(x/2);
    ensures qd8_clear_compensation: (x & (SIZE_MAX-1))==x-x%2;
@/
static void qd8_clear_low(size_t x) {
  /@ assert qd8_clear_split: x==2*(x/2)+x%2; @/
  /@ assert qd8_clear_shift_half: (x>>1)==x/2; @/
  /@ assert qd8_clear_shift_restore: ((x>>1)<<1)==2*(x>>1); @/
  /@ assert qd8_clear_restored_range: 0<=((x>>1)<<1)<=x; @/
  /@ assert qd8_clear_restored_even: ((x>>1)<<1)%2==0; @/
  /@ assert qd8_clear_shift_mask: (x & (SIZE_MAX-1))==((x>>1)<<1); @/
}
*/
/*@ \wp::strategy Qd8BitChild: \prover("z3",30), \prover("cvc5",30);
    \wp::strategy Qd8Bit64: \tactic("Wp.bitwised",\ingoal(A==(18446744073709551614 & B)),\param("Wp.bitwised.range",64),\children(Qd8BitChild)), Qd8BitChild;
    \wp::proof Qd8Bit64: qd8_clear_low;
*/
/*@ ensures qd8_round_range: q==2 && n<=SIZE_MAX-2 ==> n<=\result<=n+1;
    ensures qd8_round_even: q==2 && n<=SIZE_MAX-2 ==> \result%2==0;
    ensures qd8_round_count: q==2 && n<=SIZE_MAX-2 ==> \result==2*((n+1)/2);
    ensures qd8_round_positive: q==2 && 0<n<=SIZE_MAX-2 ==> 0<\result;
*/
size_t round_up_po2(size_t n,size_t q) {
  /*@ assert qd8_round_sum_exact: q==2 && n<=SIZE_MAX-2 ==> (size_t)((size_t)(n+q)-1)==n+1; */
  /*@ assert qd8_round_mask_value: q==2 ==> (size_t)(~(size_t)(q-1))==SIZE_MAX-1; */
  //@ ghost qd8_clear_low((size_t)(n+1));
  /*@ assert qd8_round_mask_half: n<=SIZE_MAX-2 ==> ((size_t)(n+1) & (SIZE_MAX-1))==2*((n+1)/2); */
  return (n+q-1)&~(q-1);
}

size_t doz(size_t n,size_t d) { return n>d?n-d:0; }
