From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart05.
Lemma proof_of_test_neon_entail_wit_4_3 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_4_3.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_4_3;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_6_5 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_6_5.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_6_5;try left;intros;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_8_7 : Qu8Cvt.neon_unit_goal.test_neon_entail_wit_8_7.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_entail_wit_8_7;try left;pre_process;subst;rewrite ?sizeof_uchar,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold Qu8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13;rewrite ?sizeof_uchar,?sizeof_float in *;rewrite(root_float_undef_seg0 output batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 0 batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 1 batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 2 batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 3 batch ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;repeat match goal with |- context[(output+?a)+?b] =>let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;rewrite ?Z.add_0_r;cvt_numeric_frame.
Qed.
End CheckedPart05.
