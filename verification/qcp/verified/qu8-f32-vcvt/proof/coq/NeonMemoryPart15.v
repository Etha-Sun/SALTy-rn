From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart15.
Lemma proof_of_test_neon_entail_wit_5_6 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_5_6.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_5_6;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_1 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_8_1.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_8_1;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_return_wit_3 : Qu8Cvt.neon_unit_goal.test_neon_return_wit_3.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_return_wit_3;right;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch;intros;rewrite ?sizeof_uchar,?sizeof_float in *;subst batch;
 pose proof(cvt_prefix_cells1 output_pre(batch_pre-1)A RawZ Scale ltac:(lia))as Hmerge;
 replace(output_pre+4*(batch_pre-1))with output in Hmerge by lia;
 replace((batch_pre-1)+1)with batch_pre in Hmerge by lia;
 unfold cvt_neon_lane,cvt_neon_delta in Hmerge;
 rewrite ?FloatArray.undef_seg_empty;
 eapply derivable1_trans;[|exact Hmerge];
 repeat match goal with |- context[(output+?a)+?b] =>
  let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;
 rewrite ?Z.add_0_r;
 entailer!.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_171 : Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_171.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_171,Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_171_aux;intros _;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19;rewrite ?sizeof_uchar,?sizeof_float in *;rewrite(FloatArray.undef_seg_unfold output 6 batch ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;repeat match goal with |- context[(output+?a)+?b] =>let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;rewrite ?Z.add_0_r;cvt_numeric_frame.
Qed.
End CheckedPart15.
