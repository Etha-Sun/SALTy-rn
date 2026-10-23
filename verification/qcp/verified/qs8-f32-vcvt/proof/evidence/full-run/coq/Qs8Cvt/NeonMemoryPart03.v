From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart03.
Lemma proof_of_test_neon_entail_wit_4_1 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_4_1.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_4_1;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_6_3.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_6_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_5 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_8_5.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_8_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_return_wit_7 : Qs8Cvt.neon_unit_goal.test_neon_return_wit_7.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_return_wit_7;right;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch;intros;rewrite ?sizeof_char,?sizeof_float in *;subst batch;
 pose proof(cvt_prefix_cells4 output_pre(batch_pre-4)A RawZ Scale ltac:(lia))as Hmerge;
 replace(output_pre+4*(batch_pre-4))with output in Hmerge by lia;
 replace((batch_pre-4)+4)with batch_pre in Hmerge by lia;
 unfold cvt_neon_lane,cvt_neon_delta in Hmerge;
 rewrite ?FloatArray.undef_seg_empty;
 eapply derivable1_trans;[|exact Hmerge];
 repeat match goal with |- context[(output+?a)+?b] =>
  let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;
 rewrite ?Z.add_0_r;
 entailer!.
Qed.
End CheckedPart03.
