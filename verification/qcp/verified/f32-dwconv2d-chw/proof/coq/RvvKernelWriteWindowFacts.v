From Coq Require Import ZArith List Lia.
From DwChw Require Export RvvKernelWriteValuesFacts ProgressModel.
Local Open Scope Z_scope.

(* Exact pointwise characterization, including every unaligned/unwritten
   address and None.  This does not grant initialized-read permission. *)
Lemma dw_write_values_cell:forall xs O p q,
 dw_write_values O p xs q=
 if Z_le_dec p q then
  if Z_lt_dec q(p+4*Z.of_nat(length xs))then
   if Z.eq_dec((q-p)mod 4)0 then
    Some(nth(Z.to_nat((q-p)/4))xs fp32_zero)
   else O q
  else O q
 else O q.
Proof.
 intros xs O p q.
 destruct(Z_le_dec p q)as[Hlo|Hlo].
 - destruct(Z_lt_dec q(p+4*Z.of_nat(length xs)))as[Hhi|Hhi].
   + destruct(Z.eq_dec((q-p)mod 4)0)as[Halign|Halign].
     * assert(Hj:0<=(q-p)/4<Z.of_nat(length xs)).
       { split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]. }
       pose proof(Z.div_mod(q-p)4 ltac:(lia))as Hdiv.
       assert(Hq:q=p+4*Z.of_nat(Z.to_nat((q-p)/4))).
       { rewrite Z2Nat.id by lia;lia. }
       rewrite Hq at 1;apply dw_write_values_nth.
       apply Nat2Z.inj_lt;rewrite Z2Nat.id by lia;lia.
     * apply dw_write_values_frame;intros n Hn Eq.
       apply Halign;rewrite Eq.
       replace(p+4*Z.of_nat n-p)with(Z.of_nat n*4)by ring.
       apply Z.mod_mul;lia.
   + apply dw_write_values_frame;intros n Hn Eq.
     assert(HnZ:Z.of_nat n<Z.of_nat(length xs))by(apply Nat2Z.inj_lt;exact Hn).
     lia.
 - apply dw_write_values_frame;intros n Hn Eq.
   pose proof(Nat2Z.is_nonneg n);lia.
Qed.
Print Assumptions dw_write_values_cell.
