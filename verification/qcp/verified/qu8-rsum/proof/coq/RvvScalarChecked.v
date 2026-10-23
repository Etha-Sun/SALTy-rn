From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rsum Require Import VectorModel rvv_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qu8Rsum.rvv_scalar_goal.VC_Correct.
Lemma proof_of_rsum_active_u32_return_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_active_u32_return_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_active_u32_return_wit_1;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_u32_return_wit_2 : Qu8Rsum.rvv_scalar_goal.rsum_active_u32_return_wit_2.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_active_u32_return_wit_2;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_u32_partial_solve_wit_1_pure : Qu8Rsum.rvv_scalar_goal.rsum_active_u32_partial_solve_wit_1_pure.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_active_u32_partial_solve_wit_1_pure;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_active_u32_partial_solve_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_active_u32_partial_solve_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_active_u32_partial_solve_wit_1, Qu8Rsum.rvv_scalar_goal.rsum_active_u32_partial_solve_wit_1_aux;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_u32_safety_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_safety_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_safety_wit_1;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_u32_return_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_return_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_return_wit_1;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_splat_u32_return_wit_2 : Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_return_wit_2.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_splat_u32_return_wit_2;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_mul_u8_safety_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_mul_u8_safety_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_mul_u8_safety_wit_1;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rsum_mul_u8_return_wit_1 : Qu8Rsum.rvv_scalar_goal.rsum_mul_u8_return_wit_1.
Proof. unfold Qu8Rsum.rvv_scalar_goal.rsum_mul_u8_return_wit_1;try left;intros;subst;unfold rs_active_u32,rs_splat_u32,rs_mul_u8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
End Checked.
Print Assumptions Checked.proof_of_rsum_active_u32_return_wit_1.
Print Assumptions Checked.proof_of_rsum_active_u32_return_wit_2.
Print Assumptions Checked.proof_of_rsum_active_u32_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rsum_active_u32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_u32_safety_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_u32_return_wit_1.
Print Assumptions Checked.proof_of_rsum_splat_u32_return_wit_2.
Print Assumptions Checked.proof_of_rsum_mul_u8_safety_wit_1.
Print Assumptions Checked.proof_of_rsum_mul_u8_return_wit_1.
