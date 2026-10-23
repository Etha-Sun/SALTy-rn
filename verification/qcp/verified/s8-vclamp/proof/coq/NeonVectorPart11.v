From Coq Require Import ZArith String Lia.
From S8Clamp Require Import NeonFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Local Opaque s8_min s8_max.
Module CheckedNeonVectorPart11.
Lemma proof_of_vmin_s8_partial_solve_wit_6_pure : S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_6_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_6_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s5")) a5); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s5")) b5); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmax_s8_partial_solve_wit_5_pure : S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_5_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_5_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s4")) a4); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s4")) b4); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_4_pure : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_4_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s3")) a3); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s3")) b3); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_12_pure : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_12_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_12_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s11")) a11); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s11")) b11); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_3_pure : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_3_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s2")) a2); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s2")) b2); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_11_pure : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_11_pure.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_11_pure; try left; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s10")) a10); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s10")) b10); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vget_low_s8_partial_solve_wit_1 : S8Clamp.neon_primitives_goal.vget_low_s8_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_primitives_goal.vget_low_s8_partial_solve_wit_1; try left; intros; subst.
 neon_frame.
Qed.
End CheckedNeonVectorPart11.
