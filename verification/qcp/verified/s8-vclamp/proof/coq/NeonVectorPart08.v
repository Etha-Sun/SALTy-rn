From Coq Require Import ZArith String Lia.
From S8Clamp Require Import NeonFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Local Opaque s8_min s8_max.
Module CheckedNeonVectorPart08.
Lemma proof_of_vmin_s8_partial_solve_wit_4 : S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_4; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_4_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s3")) a3); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s3")) b3); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmax_s8_partial_solve_wit_3 : S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_3; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_3_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s2")) a2); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s2")) b2); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_2 : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_2; intros Hpure; unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_2_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s1")) a1); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s1")) b1); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_10 : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_10.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_10; intros Hpure; unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_10_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s9")) a9); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s9")) b9); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_1 : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_1; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_1_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s0")) a0); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s0")) b0); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_9 : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_9.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_9; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_9_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s8")) a8); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s8")) b8); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vdupq_n_s8_return_wit_1 : S8Clamp.neon_primitives_goal.vdupq_n_s8_return_wit_1.
Proof. unfold S8Clamp.neon_primitives_goal.vdupq_n_s8_return_wit_1; try left; intros; subst.
 neon_frame.
Qed.
End CheckedNeonVectorPart08.
