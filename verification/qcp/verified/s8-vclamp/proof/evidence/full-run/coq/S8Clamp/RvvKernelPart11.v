From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart11.
Lemma proof_of_test_rvv_safety_wit_12 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_12.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_12;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_8.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_8;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_8_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_18 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_18;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_18_aux;intros; kframe. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_8 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_8.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_8. intros. rewrite sizeof_char in *. subst.
 replace((batch_pre-batch)*1)with(batch_pre-batch)in * by lia.
 replace(vl*1)with vl in * by lia.
 rewrite(s8_rvv_pack128_seq(fun j=>s8_rvv_max_lane(s8_rvv_min_lane
 (s8_read_lane j vl(batch_pre-batch)A)(s8_narrow RawHi)j vl)(s8_narrow RawLo)j vl)).
 sep_apply_l_atomic(s8_rvv_tail_output_merge output_pre(batch_pre-batch)vl batch_pre(s8_narrow RawLo)(s8_narrow RawHi)A ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(batch_pre-(batch-vl))with(batch_pre-batch+vl)by lia.
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz].
 - Left. kframe.
 - Right. kframe.
Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart11.
