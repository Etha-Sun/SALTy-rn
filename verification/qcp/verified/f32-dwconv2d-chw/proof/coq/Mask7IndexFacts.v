From Coq Require Import ZArith Lia.
From DwChw Require Export NeonProgressModel.
Local Open Scope Z_scope.

Definition dw_mask_index_source(N:Z):Z:=
 unsigned_last_nbits(3-Z.land(Z.shiftr(4*N)2-1)3)64.
Lemma dw_width_shift_two:forall N,Z.shiftr(4*N)2=N.
Proof.
 intros;rewrite Z.shiftr_div_pow2 by lia;change(4*N/4=N).
 rewrite Z.mul_comm;apply Z.div_mul;lia.
Qed.
Lemma dw_land_three_mod_four:forall x,Z.land x 3=x mod 4.
Proof.
 intros;change(Z.land x(Z.ones 2)=x mod 4);rewrite Z.land_ones by lia;reflexivity.
Qed.
Lemma dw_mask_index_range:forall N,0<=dw_mask_index N<=3.
Proof. intros;unfold dw_mask_index;pose proof(Z.mod_pos_bound(N-1)4 ltac:(lia));lia. Qed.
Lemma dw_mask_index_source_exact:forall N,dw_mask_index_source N=dw_mask_index N.
Proof.
 intros;unfold dw_mask_index_source;rewrite dw_width_shift_two,dw_land_three_mod_four.
 change(unsigned_last_nbits(dw_mask_index N)64=dw_mask_index N).
 apply unsigned_last_nbits_eq;pose proof(dw_mask_index_range N).
 change(0<=dw_mask_index N<18446744073709551616);lia.
Qed.
Lemma dw_mask_index_source_range:forall N,0<=dw_mask_index_source N<=3.
Proof. intros;rewrite dw_mask_index_source_exact;apply dw_mask_index_range. Qed.
Print Assumptions dw_width_shift_two.
Print Assumptions dw_land_three_mod_four.
Print Assumptions dw_mask_index_range.
Print Assumptions dw_mask_index_source_exact.
Print Assumptions dw_mask_index_source_range.
