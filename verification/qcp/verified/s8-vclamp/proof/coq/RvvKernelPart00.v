From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart00.
Lemma proof_of_test_rvv_safety_wit_1 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_1.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_1;kp. Qed.
Lemma proof_of_test_rvv_safety_wit_17 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_17.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_17;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_2.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_2;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_2_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_12_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_12_pure;kp. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_1 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_1. left;intros. prop_apply (CharArray.full_Zlength input_pre (batch_pre+7) A). Intros_p HA. rewrite sizeof_char,Z.rem_1_r. kframe. Qed.
Local Opaque s8_rvv_progress.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_5 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_5.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_5. intros. rewrite sizeof_char in *. subst.
 replace((batch_pre-batch)*1)with(batch_pre-batch)in * by lia.
 replace(vl*1)with vl in * by lia.
 rewrite(s8_rvv_pack128_seq(fun j=>s8_rvv_min_lane(s8_rvv_max_lane
 (s8_read_lane j vl(batch_pre-batch)A)(s8_narrow RawLo)j vl)(s8_narrow RawHi)j vl)).
 sep_apply_l_atomic(s8_rvv_bulk_output_merge output_pre(batch_pre-batch)vl batch_pre(s8_narrow RawLo)(s8_narrow RawHi)A ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(batch_pre-(batch-vl))with(batch_pre-batch+vl)by lia.
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz].
 - Left. kframe.
 - Right. kframe.
Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart00.
