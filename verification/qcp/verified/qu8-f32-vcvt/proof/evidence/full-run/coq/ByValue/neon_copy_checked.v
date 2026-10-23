From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac forget_rhs_fields :=
 repeat match goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_float ?p] =>
   multimatch P with context[store_float p ?value] =>
    sep_apply (store_float_undef_store_float p value)
   end
  end
 end.
Ltac copy_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address;
 try csimpl;
 first [ apply _derivable1_andp_intros;
  [ unfold derivable1, andp, coq_prop; intros;
    repeat first [assumption | split | reflexivity]; lia
  | forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel ]
 | forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel ].
Module CheckedNeonCopies.
Lemma proof_of_test_neon_partial_solve_wit_7 : test_neon_partial_solve_wit_7.
Proof. unfold test_neon_partial_solve_wit_7; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Proof. unfold test_neon_partial_solve_wit_9; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Proof. unfold test_neon_partial_solve_wit_10; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : test_neon_partial_solve_wit_11.
Proof. unfold test_neon_partial_solve_wit_11; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : test_neon_partial_solve_wit_16.
Proof. unfold test_neon_partial_solve_wit_16; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : test_neon_partial_solve_wit_17.
Proof. unfold test_neon_partial_solve_wit_17; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : test_neon_partial_solve_wit_18.
Proof. unfold test_neon_partial_solve_wit_18; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : test_neon_partial_solve_wit_22.
Proof. unfold test_neon_partial_solve_wit_22; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : test_neon_partial_solve_wit_23.
Proof. unfold test_neon_partial_solve_wit_23; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : test_neon_partial_solve_wit_24.
Proof. unfold test_neon_partial_solve_wit_24; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : test_neon_partial_solve_wit_25.
Proof. unfold test_neon_partial_solve_wit_25; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : test_neon_partial_solve_wit_26.
Proof. unfold test_neon_partial_solve_wit_26; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : test_neon_partial_solve_wit_27.
Proof. unfold test_neon_partial_solve_wit_27; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : test_neon_partial_solve_wit_28.
Proof. unfold test_neon_partial_solve_wit_28; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : test_neon_partial_solve_wit_29.
Proof. unfold test_neon_partial_solve_wit_29; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : test_neon_partial_solve_wit_30.
Proof. unfold test_neon_partial_solve_wit_30; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : test_neon_partial_solve_wit_31.
Proof. unfold test_neon_partial_solve_wit_31; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : test_neon_partial_solve_wit_32.
Proof. unfold test_neon_partial_solve_wit_32; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : test_neon_partial_solve_wit_33.
Proof. unfold test_neon_partial_solve_wit_33; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : test_neon_partial_solve_wit_34.
Proof. unfold test_neon_partial_solve_wit_34; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : test_neon_partial_solve_wit_35.
Proof. unfold test_neon_partial_solve_wit_35; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : test_neon_partial_solve_wit_36.
Proof. unfold test_neon_partial_solve_wit_36; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : test_neon_partial_solve_wit_39.
Proof. unfold test_neon_partial_solve_wit_39; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : test_neon_partial_solve_wit_40.
Proof. unfold test_neon_partial_solve_wit_40; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : test_neon_partial_solve_wit_41.
Proof. unfold test_neon_partial_solve_wit_41; intros; copy_frame. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : test_neon_partial_solve_wit_42.
Proof. unfold test_neon_partial_solve_wit_42; intros; copy_frame. Qed.
End CheckedNeonCopies.
