From Coq Require Import ZArith String Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From Minmax Require Import VectorLayout neon_copy_strategy_proof neon_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module Checked <: neon_goal.VC_Correct.
Include neon_copy_strategy_proof.Checked.
Lemma proof_of_vminq_f32_return_wit_1 : vminq_f32_return_wit_1.
Proof. unfold vminq_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vminq_f32_partial_solve_wit_1 : vminq_f32_partial_solve_wit_1.
Proof. unfold vminq_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vminq_f32_partial_solve_wit_2 : vminq_f32_partial_solve_wit_2.
Proof. unfold vminq_f32_partial_solve_wit_2; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vminq_f32_partial_solve_wit_3 : vminq_f32_partial_solve_wit_3.
Proof. unfold vminq_f32_partial_solve_wit_3; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vminq_f32_partial_solve_wit_4 : vminq_f32_partial_solve_wit_4.
Proof. unfold vminq_f32_partial_solve_wit_4; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vminq_f32_partial_solve_wit_5 : vminq_f32_partial_solve_wit_5.
Proof. unfold vminq_f32_partial_solve_wit_5; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_return_wit_1 : vmaxq_f32_return_wit_1.
Proof. unfold vmaxq_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_1 : vmaxq_f32_partial_solve_wit_1.
Proof. unfold vmaxq_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_2 : vmaxq_f32_partial_solve_wit_2.
Proof. unfold vmaxq_f32_partial_solve_wit_2; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_3 : vmaxq_f32_partial_solve_wit_3.
Proof. unfold vmaxq_f32_partial_solve_wit_3; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_4 : vmaxq_f32_partial_solve_wit_4.
Proof. unfold vmaxq_f32_partial_solve_wit_4; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_5 : vmaxq_f32_partial_solve_wit_5.
Proof. unfold vmaxq_f32_partial_solve_wit_5; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_n_f32_return_wit_1 : vdupq_n_f32_return_wit_1.
Proof. unfold vdupq_n_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_n_f32_partial_solve_wit_1 : vdupq_n_f32_partial_solve_wit_1.
Proof. unfold vdupq_n_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_lane_f32_safety_wit_1 : vdupq_lane_f32_safety_wit_1.
Proof. unfold vdupq_lane_f32_safety_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_lane_f32_return_wit_1 : vdupq_lane_f32_return_wit_1.
Proof. unfold vdupq_lane_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_lane_f32_return_wit_2 : vdupq_lane_f32_return_wit_2.
Proof. unfold vdupq_lane_f32_return_wit_2; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_lane_f32_partial_solve_wit_1 : vdupq_lane_f32_partial_solve_wit_1.
Proof. unfold vdupq_lane_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vdupq_lane_f32_partial_solve_wit_2 : vdupq_lane_f32_partial_solve_wit_2.
Proof. unfold vdupq_lane_f32_partial_solve_wit_2; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Proof. unfold vget_low_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vget_low_f32_partial_solve_wit_1 : vget_low_f32_partial_solve_wit_1.
Proof. unfold vget_low_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Proof. unfold vget_high_f32_return_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
Lemma proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.
Proof. unfold vget_high_f32_partial_solve_wit_1; try left; intros; unfold bit_same in *; subst; unfold glane, UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; repeat match goal with |- context[Z.eqb ?x ?y] => destruct (Z.eqb_spec x y) end; entailer!. Qed.
End Checked.
Print Assumptions Checked.proof_of_vminq_f32_return_wit_1.
Print Assumptions Checked.proof_of_vminq_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vminq_f32_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vminq_f32_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vminq_f32_partial_solve_wit_4.
Print Assumptions Checked.proof_of_vminq_f32_partial_solve_wit_5.
Print Assumptions Checked.proof_of_vmaxq_f32_return_wit_1.
Print Assumptions Checked.proof_of_vmaxq_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmaxq_f32_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vmaxq_f32_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vmaxq_f32_partial_solve_wit_4.
Print Assumptions Checked.proof_of_vmaxq_f32_partial_solve_wit_5.
Print Assumptions Checked.proof_of_vdupq_n_f32_return_wit_1.
Print Assumptions Checked.proof_of_vdupq_n_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vdupq_lane_f32_safety_wit_1.
Print Assumptions Checked.proof_of_vdupq_lane_f32_return_wit_1.
Print Assumptions Checked.proof_of_vdupq_lane_f32_return_wit_2.
Print Assumptions Checked.proof_of_vdupq_lane_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vdupq_lane_f32_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vget_low_f32_return_wit_1.
Print Assumptions Checked.proof_of_vget_low_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vget_high_f32_return_wit_1.
Print Assumptions Checked.proof_of_vget_high_f32_partial_solve_wit_1.
