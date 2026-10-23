From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rsum Require Import VectorModel rvv_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8Rsum.rvv_scalar_goal.VC_Correct.
Lemma proof_of_rsum_active_s32_return_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_active_s32_return_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_active_s32_return_wit_1;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_s32_return_wit_2 : Qs8Rsum.rvv_scalar_goal.rsum_active_s32_return_wit_2.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_active_s32_return_wit_2;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_s32_partial_solve_wit_1_pure : Qs8Rsum.rvv_scalar_goal.rsum_active_s32_partial_solve_wit_1_pure.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_active_s32_partial_solve_wit_1_pure;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_s32_partial_solve_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_active_s32_partial_solve_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_active_s32_partial_solve_wit_1, Qs8Rsum.rvv_scalar_goal.rsum_active_s32_partial_solve_wit_1_aux;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_s32_safety_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_safety_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_safety_wit_1;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_s32_return_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_return_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_return_wit_1;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_s32_return_wit_2 : Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_return_wit_2.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_splat_s32_return_wit_2;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_mul_s8_safety_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_mul_s8_safety_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_mul_s8_safety_wit_1;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_mul_s8_return_wit_1 : Qs8Rsum.rvv_scalar_goal.rsum_mul_s8_return_wit_1.
Proof. unfold Qs8Rsum.rvv_scalar_goal.rsum_mul_s8_return_wit_1;try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
End Checked.
Print Assumptions Checked.proof_of_rsum_active_s32_return_wit_1.
Print Assumptions Checked.proof_of_rsum_active_s32_return_wit_2.
Print Assumptions Checked.proof_of_rsum_active_s32_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rsum_active_s32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_s32_safety_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_s32_return_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_s32_return_wit_2.
Print Assumptions Checked.proof_of_rsum_mul_s8_safety_wit_1.
Print Assumptions Checked.proof_of_rsum_mul_s8_return_wit_1.
