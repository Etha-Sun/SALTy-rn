From Coq Require Import ZArith List Lia.
From SpmmProof Require Export NeonExtras.
From SpmmSpec Require Export FinalStore.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma spmm_neon_remaining_step : forall nnz column row start ds input weights remaining,
 0<=z_at nnz column-remaining ->
 spmm_acc (z_at nnz column-(remaining-1)) column row start nnz ds input weights=
 fma_rne (fp_at input(input_index ds start row(nnz_before nnz column+(z_at nnz column-remaining))))
 (fp_at weights(bias_index nnz column+1+(z_at nnz column-remaining)))
 (spmm_acc (z_at nnz column-remaining) column row start nnz ds input weights).
Proof.
 intros;replace(z_at nnz column-(remaining-1))with((z_at nnz column-remaining)+1)by lia.
 now apply spmm_acc_step.
Qed.
Lemma block1 : forall row col start NN D A W lo hi,
 0<=row -> spmm_column_block row 1 col start NN D A W lo hi=[spmm_cell col(row+0)start NN D A W lo hi].
Proof.
 intros;unfold spmm_column_block;cbn [Z.to_nat];cbv [Pos.to_nat Pos.iter_op Nat.add];cbn [seq map];
 rewrite ?Nat2Z.inj_succ,?Z2Nat.id by lia;repeat f_equal;lia.
Qed.
Lemma block2 : forall row col start NN D A W lo hi,
 0<=row -> spmm_column_block row 2 col start NN D A W lo hi=[spmm_cell col(row+0)start NN D A W lo hi;spmm_cell col(row+1)start NN D A W lo hi].
Proof.
 intros;unfold spmm_column_block;cbn [Z.to_nat];cbv [Pos.to_nat Pos.iter_op Nat.add];cbn [seq map];
 rewrite ?Nat2Z.inj_succ,?Z2Nat.id by lia;repeat f_equal;lia.
Qed.
Lemma block4 : forall row col start NN D A W lo hi,
 0<=row -> spmm_column_block row 4 col start NN D A W lo hi=[spmm_cell col(row+0)start NN D A W lo hi;spmm_cell col(row+1)start NN D A W lo hi;spmm_cell col(row+2)start NN D A W lo hi;spmm_cell col(row+3)start NN D A W lo hi].
Proof.
 intros;unfold spmm_column_block;cbn [Z.to_nat];cbv [Pos.to_nat Pos.iter_op Nat.add];cbn [seq map];
 rewrite ?Nat2Z.inj_succ,?Z2Nat.id by lia;repeat f_equal;lia.
Qed.
Ltac block_close :=
 multimatch goal with |- ?P |-- ?Q =>
 multimatch P with context[spmm_output_hole ?out ?rows ?cols ?stride ?row ?col ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
 multimatch P with context[FloatArray.full (spmm_output_cursor out row stride col) width ?xs] =>
 let Hb:=fresh "Hblock" in assert(Hb:spmm_column_block row width col start NN D A W lo hi=xs)by
 (first[rewrite block4 by lia|rewrite block2 by lia|rewrite block1 by lia];
 unfold spmm_cell,neon_clamp,spmm_get;
 try match goal with H:z_at NN col=0 |- _ =>rewrite H end;
 rewrite ?spmm_acc_zero,?Z.add_0_r;reflexivity);
 rewrite <-Hb;
 sep_apply(spmm_close_stored_column out rows cols stride row col width start NN D A W lo hi ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia))
 end end end.
Lemma spmm_word64_add_sub : forall x y z,
 word64(word64(x-y)+z)=word64(x-(y-z)).
Proof.
 intros;unfold word64;rewrite Z.add_mod_idemp_l by(pose proof modulus64_positive;lia).
 f_equal;ring.
Qed.
Lemma spmm_word_cursor_restore : forall base row stride columns width,
 word64(word64(spmm_output_cursor base row stride columns)-word64(word64(stride*columns)-4*width))=
 spmm_output_cursor base(row+width)stride 0.
Proof. intros;exact(spmm_output_cursor_restore base row stride columns width). Qed.
Ltac mc_facts := multimatch goal with H:Z.rem ?mc 4=0 |- _ =>
 let Hm:=fresh "Hmc" in pose proof(spmm_mc_multiple mc H)as Hm end.
Ltac width_start := match goal with |- _ |-- ?Q =>
 multimatch Q with context[spmm_output ?out ?rows ?cols ?stride ?row 0 ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
 rewrite(spmm_output_start_width out rows cols stride row width start NN D A W lo hi)
 end end.
Ltac small_mc mc :=
 let Hcases:=fresh "Hcases" in assert(Hcases:mc=0\/mc=4\/mc=8\/mc=12)by lia;
 destruct Hcases as[Hcases | [Hcases | [Hcases | Hcases]]];subst mc;
 repeat match goal with H:context[Z.land ?x ?y] |- _ => vm_compute in H end;try lia;reflexivity.
Ltac spmm_neon_start_width :=
 match goal with |- _ |-- ?Q =>
 multimatch Q with context[spmm_output ?out ?rows ?cols ?stride ?row 0 ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
 rewrite(spmm_output_start_width out rows cols stride row width start NN D A W lo hi)
 end end.
Ltac spmm_neon_mc_facts :=
 multimatch goal with H:Z.rem ?mc 4=0 |- _ =>
 let Hm:=fresh "Hmc" in pose proof(spmm_mc_multiple mc H)as Hm end.
