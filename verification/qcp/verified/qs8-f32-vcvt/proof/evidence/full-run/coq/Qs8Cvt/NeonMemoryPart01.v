From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import NeonStep neon_unit_goal NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart01.
Lemma proof_of_test_neon_entail_wit_2 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_2.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_2;intros params_pre output_pre input_pre batch_pre Scale RawZ A;intros;
 rewrite ?sizeof_char,?sizeof_float,?Z.sub_diag,?Z.mul_0_l,?Z.add_0_r;
 rewrite ?cvt_values_zero,?cvt_float_full0_cells,?cvt_seed_actual;
 repeat first[progress rewrite sepcon_emp_equiv|match goal with |- context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P)end];
destruct(Z.eq_dec batch_pre 1)as[Hcase|Hcase1];[subst batch_pre;do 7 Left;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 2)as[Hcase|Hcase2];[subst batch_pre;do 6 Left;Right;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 3)as[Hcase|Hcase3];[subst batch_pre;do 5 Left;Right;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 4)as[Hcase|Hcase4];[subst batch_pre;do 4 Left;Right;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 5)as[Hcase|Hcase5];[subst batch_pre;do 3 Left;Right;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 6)as[Hcase|Hcase6];[subst batch_pre;do 2 Left;Right;cvt_numeric_frame|];
destruct(Z.eq_dec batch_pre 7)as[Hcase|Hcase7];[subst batch_pre;do 1 Left;Right;cvt_numeric_frame|];
assert(8<=batch_pre)by lia;Right;cvt_numeric_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_6_1.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_6_1;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_8_3 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_8_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_return_wit_5 : Qs8Cvt.neon_unit_goal.test_neon_return_wit_5.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_return_wit_5;right;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch;intros;rewrite ?sizeof_char,?sizeof_float in *;subst batch;
 pose proof(cvt_prefix_cells6 output_pre(batch_pre-6)A RawZ Scale ltac:(lia))as Hmerge;
 replace(output_pre+4*(batch_pre-6))with output in Hmerge by lia;
 replace((batch_pre-6)+6)with batch_pre in Hmerge by lia;
 unfold cvt_neon_lane,cvt_neon_delta in Hmerge;
 rewrite ?FloatArray.undef_seg_empty;
 eapply derivable1_trans;[|exact Hmerge];
 repeat match goal with |- context[(output+?a)+?b] =>
  let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;
 rewrite ?Z.add_0_r;
 cbv beta iota zeta delta[Z.mul Pos.mul Pos.add Pos.succ];repeat first[progress rewrite sepcon_emp_equiv|match goal with |- context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P)end];cvt_memory_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_173 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_173.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_173,Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_173_aux;intros _;intros params_pre output_pre input_pre batch_pre Scale RawZ A output input batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19;rewrite ?sizeof_char,?sizeof_float in *;rewrite(root_float_undef_seg0 output batch ltac:(lia));rewrite(FloatArray.undef_seg_unfold output 0 batch ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;repeat match goal with |- context[(output+?a)+?b] =>let c:=eval vm_compute in(a+b)in replace((output+a)+b)with(output+c)by lia end;rewrite ?Z.add_0_r;cvt_numeric_frame.
Qed.
End CheckedPart01.
