From Coq Require Import ZArith String Lia.
From S8Clamp Require Import NeonFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Local Opaque s8_min s8_max.
Module CheckedNeonVectorPart03.
Lemma proof_of_vmin_s8_partial_solve_wit_2_pure : S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_2_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s1")) a1); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s1")) b1); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmax_s8_partial_solve_wit_1_pure : S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_1_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s0")) a0); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s0")) b0); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmax_s8_partial_solve_wit_9 : S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_9.
Proof. unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_9; try left; intros; subst.
 neon_frame.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_8_pure : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_8_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_8_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s7")) a7); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s7")) b7); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_16_pure : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_16_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_16_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s15")) a15); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s15")) b15); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_7_pure : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_7_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_7_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s6")) a6); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s6")) b6); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_15_pure : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_15_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_15_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s14")) a14); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s14")) b14); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
End CheckedNeonVectorPart03.
