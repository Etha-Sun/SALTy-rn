From Coq Require Import ZArith String Lia.
From S8Clamp Require Import NeonFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Local Opaque s8_min s8_max.
Module CheckedNeonVectorPart14.
Lemma proof_of_vmin_s8_partial_solve_wit_7 : S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_7.
Proof. unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_7; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmin_s8_partial_solve_wit_7_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s6")) a6); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s6")) b6); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmax_s8_partial_solve_wit_6 : S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_6.
Proof. unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_6; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmax_s8_partial_solve_wit_6_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s5")) a5); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s5")) b5); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_5 : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_5.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_5; intros Hpure; unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_5_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s4")) a4); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s4")) b4); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vminq_s8_partial_solve_wit_13 : S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_13.
Proof. unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_13; intros Hpure; unfold S8Clamp.neon_primitives_goal.vminq_s8_partial_solve_wit_13_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s12")) a12); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s12")) b12); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_4 : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_4; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_4_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s3")) a3); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s3")) b3); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
Lemma proof_of_vmaxq_s8_partial_solve_wit_12 : S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_12.
Proof. unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_12; intros Hpure; unfold S8Clamp.neon_primitives_goal.vmaxq_s8_partial_solve_wit_12_aux; intros; subst.
 prop_apply (valid_store_char (&((&("a"))->ₛ "s11")) a11); Intros.
 prop_apply (valid_store_char (&((&("b"))->ₛ "s11")) b11); Intros.
 change Byte.min_signed with (-128) in *; change Byte.max_signed with 127 in *; entailer!;lia.
Qed.
End CheckedNeonVectorPart14.
