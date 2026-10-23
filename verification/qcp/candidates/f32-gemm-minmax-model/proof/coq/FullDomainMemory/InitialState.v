From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma output_row_zero : forall c mr nc k row A W lo hi,
 output_row c mr nc k 0 row A W lo hi --||--
 FloatArray.undef_seg c (row*nc) ((row+1)*nc).
Proof.
 intros;unfold output_row;rewrite Z.add_0_r.
 destruct(row <? mr);[unfold full_row_values;cbn [Z.to_nat seq map];rewrite FloatArray.seg_empty|];split;entailer!.
Qed.
Lemma undef_four_rows : forall c nc,0<=nc ->
 FloatArray.undef_full c (4*nc) |--
 FloatArray.undef_seg c 0 nc ** FloatArray.undef_seg c nc (2*nc) **
 FloatArray.undef_seg c (2*nc)(3*nc) ** FloatArray.undef_seg c (3*nc)(4*nc).
Proof.
 intros.
 sep_apply(FloatArray.undef_full_split_to_undef_seg c nc (4*nc));try lia.
 sep_apply(FloatArray.undef_seg_split_to_undef_seg c nc (2*nc)(4*nc));try lia.
 sep_apply(FloatArray.undef_seg_split_to_undef_seg c (2*nc)(3*nc)(4*nc));try lia.
 entailer!.
Qed.
Lemma initial_output_state : forall c mr nc k A W lo hi,0<=nc ->
 FloatArray.undef_full c (4*nc) |-- output_state c mr nc k 0 A W lo hi.
Proof.
 intros;unfold output_state;rewrite !output_row_zero.
 replace(0*nc)with 0 by ring;replace(1*nc)with nc by ring.
 replace((0+1)*nc)with nc by ring.
 apply undef_four_rows;assumption.
Qed.
Print Assumptions output_row_zero.
Print Assumptions undef_four_rows.
Print Assumptions initial_output_state.
