From Coq Require Import ZArith Lia.
From FMax Require Import Bits Model Types VectorModel VectorFastFrame vector_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac vector_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredvfloat32m8_t, UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;
  repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedVectorNeon.
Lemma proof_of_vmaxq_f32_return_wit_1 : vmaxq_f32_return_wit_1.
Proof. unfold vmaxq_f32_return_wit_1; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_1 : vmaxq_f32_partial_solve_wit_1.
Proof. unfold vmaxq_f32_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_2 : vmaxq_f32_partial_solve_wit_2.
Proof. unfold vmaxq_f32_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_3 : vmaxq_f32_partial_solve_wit_3.
Proof. unfold vmaxq_f32_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_4 : vmaxq_f32_partial_solve_wit_4.
Proof. unfold vmaxq_f32_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
Lemma proof_of_vmaxq_f32_partial_solve_wit_5 : vmaxq_f32_partial_solve_wit_5.
Proof. unfold vmaxq_f32_partial_solve_wit_5; try left; intros; unfold same_bits in *; subst; vector_frame. Qed.
End CheckedVectorNeon.
