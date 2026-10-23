From Coq Require Import ZArith Lia.
From VLRelu Require Import Model Bits RvvFastFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac primitive_frame :=
 unfold fp32_bits_equal, same_bits in *; subst;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredint32x4_t, UndefStructPreduint32x4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedNeonPrimitives : VC_Correct.
Lemma proof_of_qcp_signed32_lane_safety_wit_1 : qcp_signed32_lane_safety_wit_1.
Proof. unfold qcp_signed32_lane_safety_wit_1; try left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32; repeat match goal with
 | |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_signed32_lane_safety_wit_2 : qcp_signed32_lane_safety_wit_2.
Proof. unfold qcp_signed32_lane_safety_wit_2; try left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32; repeat match goal with
 | |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_signed32_lane_safety_wit_3 : qcp_signed32_lane_safety_wit_3.
Proof. unfold qcp_signed32_lane_safety_wit_3; try left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32; repeat match goal with
 | |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_signed32_lane_safety_wit_4 : qcp_signed32_lane_safety_wit_4.
Proof. unfold qcp_signed32_lane_safety_wit_4; try left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32; repeat match goal with
 | |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_signed32_lane_return_wit_1 : qcp_signed32_lane_return_wit_1.
Proof. unfold qcp_signed32_lane_return_wit_1; left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_signed with 2147483647 in *; entailer!; lia. Qed.
Lemma proof_of_qcp_signed32_lane_return_wit_2 : qcp_signed32_lane_return_wit_2.
Proof. unfold qcp_signed32_lane_return_wit_2; left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_signed with 2147483647 in *; entailer!; lia. Qed.
Lemma proof_of_qcp_signed32_lane_partial_solve_wit_1 : qcp_signed32_lane_partial_solve_wit_1.
Proof. unfold qcp_signed32_lane_partial_solve_wit_1; entailer!. Qed.
Lemma proof_of_qcp_bitselect_return_wit_1 : qcp_bitselect_return_wit_1.
Proof. unfold qcp_bitselect_return_wit_1; try left; intros; unfold same_bits,fp32_bits_equal,vlrelu_bitselect in *; subst;
 try change Int.max_unsigned with 4294967295 in *; entailer!. Qed.
Lemma proof_of_qcp_bitselect_partial_solve_wit_1 : qcp_bitselect_partial_solve_wit_1.
Proof. unfold qcp_bitselect_partial_solve_wit_1; try left; intros; unfold same_bits,fp32_bits_equal,vlrelu_bitselect in *; subst;
 try change Int.max_unsigned with 4294967295 in *; entailer!. Qed.
Lemma proof_of_qcp_bitselect_partial_solve_wit_2 : qcp_bitselect_partial_solve_wit_2.
Proof. unfold qcp_bitselect_partial_solve_wit_2; try left; intros; unfold same_bits,fp32_bits_equal,vlrelu_bitselect in *; subst;
 try change Int.max_unsigned with 4294967295 in *; entailer!. Qed.
Lemma proof_of_qcp_bitselect_partial_solve_wit_3 : qcp_bitselect_partial_solve_wit_3.
Proof. unfold qcp_bitselect_partial_solve_wit_3; try left; intros; unfold same_bits,fp32_bits_equal,vlrelu_bitselect in *; subst;
 try change Int.max_unsigned with 4294967295 in *; entailer!. Qed.
Lemma proof_of_vdupq_n_f32_return_wit_1 : vdupq_n_f32_return_wit_1.
Proof. unfold vdupq_n_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vdupq_n_f32_partial_solve_wit_1 : vdupq_n_f32_partial_solve_wit_1.
Proof. unfold vdupq_n_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmovq_n_s32_return_wit_1 : vmovq_n_s32_return_wit_1.
Proof. unfold vmovq_n_s32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmovq_n_s32_partial_solve_wit_1 : vmovq_n_s32_partial_solve_wit_1.
Proof. unfold vmovq_n_s32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_return_wit_1 : vmulq_f32_return_wit_1.
Proof. unfold vmulq_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_1 : vmulq_f32_partial_solve_wit_1.
Proof. unfold vmulq_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_return_wit_1 : vreinterpretq_s32_f32_return_wit_1.
Proof. unfold vreinterpretq_s32_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_partial_solve_wit_1 : vreinterpretq_s32_f32_partial_solve_wit_1.
Proof. unfold vreinterpretq_s32_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_partial_solve_wit_2 : vreinterpretq_s32_f32_partial_solve_wit_2.
Proof. unfold vreinterpretq_s32_f32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_partial_solve_wit_3 : vreinterpretq_s32_f32_partial_solve_wit_3.
Proof. unfold vreinterpretq_s32_f32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_partial_solve_wit_4 : vreinterpretq_s32_f32_partial_solve_wit_4.
Proof. unfold vreinterpretq_s32_f32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vreinterpretq_s32_f32_partial_solve_wit_5 : vreinterpretq_s32_f32_partial_solve_wit_5.
Proof. unfold vreinterpretq_s32_f32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_1 : vcltq_s32_return_wit_1.
Proof. unfold vcltq_s32_return_wit_1; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_2 : vcltq_s32_return_wit_2.
Proof. unfold vcltq_s32_return_wit_2; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_3 : vcltq_s32_return_wit_3.
Proof. unfold vcltq_s32_return_wit_3; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_4 : vcltq_s32_return_wit_4.
Proof. unfold vcltq_s32_return_wit_4; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_5 : vcltq_s32_return_wit_5.
Proof. unfold vcltq_s32_return_wit_5; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_6 : vcltq_s32_return_wit_6.
Proof. unfold vcltq_s32_return_wit_6; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_7 : vcltq_s32_return_wit_7.
Proof. unfold vcltq_s32_return_wit_7; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_8 : vcltq_s32_return_wit_8.
Proof. unfold vcltq_s32_return_wit_8; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_9 : vcltq_s32_return_wit_9.
Proof. unfold vcltq_s32_return_wit_9; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_10 : vcltq_s32_return_wit_10.
Proof. unfold vcltq_s32_return_wit_10; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_11 : vcltq_s32_return_wit_11.
Proof. unfold vcltq_s32_return_wit_11; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_12 : vcltq_s32_return_wit_12.
Proof. unfold vcltq_s32_return_wit_12; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_13 : vcltq_s32_return_wit_13.
Proof. unfold vcltq_s32_return_wit_13; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_14 : vcltq_s32_return_wit_14.
Proof. unfold vcltq_s32_return_wit_14; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_15 : vcltq_s32_return_wit_15.
Proof. unfold vcltq_s32_return_wit_15; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_return_wit_16 : vcltq_s32_return_wit_16.
Proof. unfold vcltq_s32_return_wit_16; left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_1 : vcltq_s32_partial_solve_wit_1.
Proof. unfold vcltq_s32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_2 : vcltq_s32_partial_solve_wit_2.
Proof. unfold vcltq_s32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_3 : vcltq_s32_partial_solve_wit_3.
Proof. unfold vcltq_s32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_4 : vcltq_s32_partial_solve_wit_4.
Proof. unfold vcltq_s32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_5 : vcltq_s32_partial_solve_wit_5.
Proof. unfold vcltq_s32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_6 : vcltq_s32_partial_solve_wit_6.
Proof. unfold vcltq_s32_partial_solve_wit_6; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_7 : vcltq_s32_partial_solve_wit_7.
Proof. unfold vcltq_s32_partial_solve_wit_7; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_8 : vcltq_s32_partial_solve_wit_8.
Proof. unfold vcltq_s32_partial_solve_wit_8; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_9 : vcltq_s32_partial_solve_wit_9.
Proof. unfold vcltq_s32_partial_solve_wit_9; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_10 : vcltq_s32_partial_solve_wit_10.
Proof. unfold vcltq_s32_partial_solve_wit_10; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_11 : vcltq_s32_partial_solve_wit_11.
Proof. unfold vcltq_s32_partial_solve_wit_11; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_12 : vcltq_s32_partial_solve_wit_12.
Proof. unfold vcltq_s32_partial_solve_wit_12; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_13 : vcltq_s32_partial_solve_wit_13.
Proof. unfold vcltq_s32_partial_solve_wit_13; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_14 : vcltq_s32_partial_solve_wit_14.
Proof. unfold vcltq_s32_partial_solve_wit_14; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_15 : vcltq_s32_partial_solve_wit_15.
Proof. unfold vcltq_s32_partial_solve_wit_15; try left; intros; primitive_frame. Qed.
Lemma proof_of_vcltq_s32_partial_solve_wit_16 : vcltq_s32_partial_solve_wit_16.
Proof. unfold vcltq_s32_partial_solve_wit_16; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_return_wit_1 : vbslq_f32_return_wit_1.
Proof. unfold vbslq_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_partial_solve_wit_1 : vbslq_f32_partial_solve_wit_1.
Proof. unfold vbslq_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_partial_solve_wit_2 : vbslq_f32_partial_solve_wit_2.
Proof. unfold vbslq_f32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_partial_solve_wit_3 : vbslq_f32_partial_solve_wit_3.
Proof. unfold vbslq_f32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_partial_solve_wit_4 : vbslq_f32_partial_solve_wit_4.
Proof. unfold vbslq_f32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vbslq_f32_partial_solve_wit_5 : vbslq_f32_partial_solve_wit_5.
Proof. unfold vbslq_f32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
End CheckedNeonPrimitives.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_safety_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_safety_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_safety_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_safety_wit_4.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_return_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_signed32_lane_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_bitselect_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_bitselect_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_bitselect_partial_solve_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_qcp_bitselect_partial_solve_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_vdupq_n_f32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vdupq_n_f32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vmovq_n_s32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vmovq_n_s32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vmulq_f32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vmulq_f32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_partial_solve_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_partial_solve_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_partial_solve_wit_4.
Print Assumptions CheckedNeonPrimitives.proof_of_vreinterpretq_s32_f32_partial_solve_wit_5.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_4.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_5.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_6.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_7.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_8.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_9.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_10.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_11.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_12.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_13.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_14.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_15.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_return_wit_16.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_4.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_5.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_6.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_7.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_8.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_9.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_10.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_11.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_12.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_13.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_14.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_15.
Print Assumptions CheckedNeonPrimitives.proof_of_vcltq_s32_partial_solve_wit_16.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_return_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_partial_solve_wit_1.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_partial_solve_wit_2.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_partial_solve_wit_3.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_partial_solve_wit_4.
Print Assumptions CheckedNeonPrimitives.proof_of_vbslq_f32_partial_solve_wit_5.
