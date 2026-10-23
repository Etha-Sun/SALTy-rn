From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart13.
Lemma proof_of_test_neon_entail_wit_5_4 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_4.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_5_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_7_6 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_6.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_7_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_return_wit_1 : Qs8Cvt.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_return_wit_1;right;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch;intros;rewrite ?sizeof_char,?sizeof_float in *;subst batch;
 pose proof(cvt_prefix_cells7 output_pre(batch_pre-7)A RawZ Scale ltac:(lia))as Hmerge;
 replace(output_pre+4*(batch_pre-7))with output in Hmerge by lia;
 replace((batch_pre-7)+7)with batch_pre in Hmerge by lia;
 unfold cvt_neon_lane,cvt_neon_delta in Hmerge;
 rewrite ?FloatArray.undef_seg_empty;
 eapply derivable1_trans;[|exact Hmerge];
 repeat match goal with |- context[(output+?a)+?b] =>
  let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;
 rewrite ?Z.add_0_r;
 cvt_numeric_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_161 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_161.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_161;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18;rewrite ?sizeof_char,?sizeof_float in *;rewrite(FloatArray.undef_seg_unfold output 4 batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 5 batch ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;repeat match goal with |- context[(output+?a)+?b] =>let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;rewrite ?Z.add_0_r;cvt_numeric_frame.
Qed.
End CheckedPart13.
