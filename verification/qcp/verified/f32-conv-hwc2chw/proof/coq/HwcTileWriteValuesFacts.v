(* Source-level migration of checked DW list writes; proof credit requires a fresh HwcConv compilation. *)
From Coq Require Import ZArith List Lia.
From HwcConv Require Export HwcProgressModel.
Import ListNotations. Local Open Scope Z_scope.

Lemma hc_write_values_frame:forall xs O p q,
 (forall n,(n<length xs)%nat->q<>p+4*Z.of_nat n)->
 hc_write_values O p xs q=O q.
Proof.
 induction xs as[|v xs IH];intros O p q Haway;cbn[hc_write_values];[reflexivity|].
 rewrite IH.
 - unfold hc_output_put,hc_put.
   destruct(Z.eqb_spec q p);[specialize(Haway 0%nat ltac:(cbn;lia));cbn in Haway;lia|reflexivity].
 - intros n Hn Eq;apply(Haway(S n)ltac:(cbn;lia)).
   rewrite Nat2Z.inj_succ;lia.
Qed.

Lemma hc_write_values_nth:forall xs O p n,
 (n<length xs)%nat->
 hc_write_values O p xs(p+4*Z.of_nat n)=Some(nth n xs fp32_zero).
Proof.
 induction xs as[|v xs IH];intros O p n Hn;[cbn in Hn;lia|].
 destruct n as[|n].
 - cbn[hc_write_values nth].
   rewrite hc_write_values_frame.
   + replace(p+4*Z.of_nat 0)with p by lia.
     unfold hc_output_put,hc_put;rewrite Z.eqb_refl;reflexivity.
   + intros k Hk Eq;lia.
 - cbn[hc_write_values nth].
   replace(p+4*Z.of_nat(S n))with((p+4)+4*Z.of_nat n)by(rewrite Nat2Z.inj_succ;lia).
   apply IH;cbn in Hn;lia.
Qed.

Print Assumptions hc_write_values_frame.
Print Assumptions hc_write_values_nth.

(* Exact pointwise characterization, including every unaligned/unwritten
   address and None.  This does not grant initialized-read permission. *)
Lemma hc_write_values_cell:forall xs O p q,
 hc_write_values O p xs q=
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
       rewrite Hq at 1;apply hc_write_values_nth.
       apply Nat2Z.inj_lt;rewrite Z2Nat.id by lia;lia.
     * apply hc_write_values_frame;intros n Hn Eq.
       apply Halign;rewrite Eq.
       replace(p+4*Z.of_nat n-p)with(Z.of_nat n*4)by ring.
       apply Z.mod_mul;lia.
   + apply hc_write_values_frame;intros n Hn Eq.
     assert(HnZ:Z.of_nat n<Z.of_nat(length xs))by(apply Nat2Z.inj_lt;exact Hn).
     lia.
 - apply hc_write_values_frame;intros n Hn Eq.
   pose proof(Nat2Z.is_nonneg n);lia.
Qed.
Print Assumptions hc_write_values_cell.

Lemma hc_tile_values_length:forall R c y x n dy lane,
 length(hc_tile_values R c y x n dy lane)=Z.to_nat n.
Proof. intros;unfold hc_tile_values;rewrite map_length,seq_length;reflexivity. Qed.
Lemma hc_tile_values_nth:forall R c y x n dy lane k,
 (k<Z.to_nat n)%nat->
 nth k(hc_tile_values R c y x n dy lane)fp32_zero=R c lane(y+dy)(x+Z.of_nat k).
Proof.
 intros;unfold hc_tile_values.
 transitivity((fun k:nat=>R c lane(y+dy)(x+Z.of_nat k))(nth k(seq 0(Z.to_nat n))0%nat)).
 - rewrite <-(@map_nth nat fp32(fun k:nat=>R c lane(y+dy)(x+Z.of_nat k))(seq 0(Z.to_nat n))0%nat k).
   apply nth_indep;rewrite map_length,seq_length;assumption.
 - rewrite seq_nth by assumption;replace(0+k)%nat with k by lia;reflexivity.
Qed.
Print Assumptions hc_tile_values_length.
Print Assumptions hc_tile_values_nth.
