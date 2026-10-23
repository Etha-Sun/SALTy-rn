From Coq Require Import ZArith Lia.
From VLRelu Require Import Model RvvModel RvvFastFrame rvv_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvScalar.
Lemma proof_of_qcp_rvv_signed_bits_safety_wit_1 : qcp_rvv_signed_bits_safety_wit_1.
Proof. unfold qcp_rvv_signed_bits_safety_wit_1; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_safety_wit_2 : qcp_rvv_signed_bits_safety_wit_2.
Proof. unfold qcp_rvv_signed_bits_safety_wit_2; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_safety_wit_3 : qcp_rvv_signed_bits_safety_wit_3.
Proof. unfold qcp_rvv_signed_bits_safety_wit_3; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_safety_wit_4 : qcp_rvv_signed_bits_safety_wit_4.
Proof. unfold qcp_rvv_signed_bits_safety_wit_4; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_return_wit_1 : qcp_rvv_signed_bits_return_wit_1.
Proof. unfold qcp_rvv_signed_bits_return_wit_1; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_return_wit_2 : qcp_rvv_signed_bits_return_wit_2.
Proof. unfold qcp_rvv_signed_bits_return_wit_2; try left; intros; subst; pose proof (bits_of_float_value_range x_pre (bits_of_fp32 x_pre) eq_refl) as Hr; change (0 <= bits_of_fp32 x_pre <= 4294967295) in Hr; unfold rvv_signed_bits; try (destruct (Z.ltb_spec (bits_of_fp32 x_pre) 2147483648)); try entailer!; unfold derivable1, andp, coq_prop; intros; cbn in *; try tauto; lia. Qed.
Lemma proof_of_qcp_rvv_signed_bits_partial_solve_wit_1 : qcp_rvv_signed_bits_partial_solve_wit_1.
Proof. unfold qcp_rvv_signed_bits_partial_solve_wit_1; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_qcp_rvv_mask_lane_safety_wit_1 : qcp_rvv_mask_lane_safety_wit_1.
Proof. unfold qcp_rvv_mask_lane_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; cbn in *; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_qcp_rvv_mask_lane_safety_wit_2 : qcp_rvv_mask_lane_safety_wit_2.
Proof. unfold qcp_rvv_mask_lane_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; cbn in *; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_qcp_rvv_mask_lane_safety_wit_3 : qcp_rvv_mask_lane_safety_wit_3.
Proof. unfold qcp_rvv_mask_lane_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; cbn in *; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_qcp_rvv_mask_lane_return_wit_1 : qcp_rvv_mask_lane_return_wit_1.
Proof. unfold qcp_rvv_mask_lane_return_wit_1; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_mask_lane_return_wit_2 : qcp_rvv_mask_lane_return_wit_2.
Proof. unfold qcp_rvv_mask_lane_return_wit_2; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_mask_lane_return_wit_3 : qcp_rvv_mask_lane_return_wit_3.
Proof. unfold qcp_rvv_mask_lane_return_wit_3; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_merge_lane_safety_wit_1 : qcp_rvv_merge_lane_safety_wit_1.
Proof. unfold qcp_rvv_merge_lane_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; cbn in *; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_qcp_rvv_merge_lane_return_wit_1 : qcp_rvv_merge_lane_return_wit_1.
Proof. unfold qcp_rvv_merge_lane_return_wit_1; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_merge_lane_return_wit_2 : qcp_rvv_merge_lane_return_wit_2.
Proof. unfold qcp_rvv_merge_lane_return_wit_2; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_merge_lane_return_wit_3 : qcp_rvv_merge_lane_return_wit_3.
Proof. unfold qcp_rvv_merge_lane_return_wit_3; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_mulf_lane_return_wit_1 : qcp_rvv_mulf_lane_return_wit_1.
Proof. unfold qcp_rvv_mulf_lane_return_wit_1; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
Lemma proof_of_qcp_rvv_mulf_lane_return_wit_2 : qcp_rvv_mulf_lane_return_wit_2.
Proof. unfold qcp_rvv_mulf_lane_return_wit_2; left; intros; unfold rvv_mask, rvv_merge, vlrelu_active_mul, fp32_bits_equal; repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; try rewrite rvv_c_zero; try entailer!; try lia. Qed.
End CheckedRvvScalar.
