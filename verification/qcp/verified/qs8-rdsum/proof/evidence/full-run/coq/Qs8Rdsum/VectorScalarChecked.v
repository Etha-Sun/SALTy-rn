From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import VectorModel vector_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8Rdsum.vector_scalar_goal.VC_Correct.
Lemma proof_of_rdsum_wadd16_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_wadd16_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_wadd16_partial_solve_wit_1_pure : Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_partial_solve_wit_1_pure;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_wadd16_partial_solve_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_partial_solve_wit_1, Qs8Rdsum.vector_scalar_goal.rdsum_wadd16_partial_solve_wit_1_aux;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd16_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd16_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd16_return_wit_2 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_return_wit_2.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_return_wit_2;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd16_partial_solve_wit_1_pure : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_partial_solve_wit_1_pure;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd16_partial_solve_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_partial_solve_wit_1, Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd16_partial_solve_wit_1_aux;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd32_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd32_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd32_return_wit_2 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_return_wit_2.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_return_wit_2;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd32_partial_solve_wit_1_pure : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_partial_solve_wit_1_pure;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_wadd32_partial_solve_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_partial_solve_wit_1, Qs8Rdsum.vector_scalar_goal.rdsum_active_wadd32_partial_solve_wit_1_aux;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_add32_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_add32_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_add32_return_wit_2 : Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_return_wit_2.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_return_wit_2;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_add32_partial_solve_wit_1_pure : Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_partial_solve_wit_1_pure;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_active_add32_partial_solve_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_partial_solve_wit_1, Qs8Rdsum.vector_scalar_goal.rdsum_active_add32_partial_solve_wit_1_aux;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat16_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_splat16_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat16_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat16_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_splat16_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat16_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat16_return_wit_2 : Qs8Rdsum.vector_scalar_goal.rdsum_splat16_return_wit_2.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat16_return_wit_2;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat32_safety_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_splat32_safety_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat32_safety_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat32_return_wit_1 : Qs8Rdsum.vector_scalar_goal.rdsum_splat32_return_wit_1.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat32_return_wit_1;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
Lemma proof_of_rdsum_splat32_return_wit_2 : Qs8Rdsum.vector_scalar_goal.rdsum_splat32_return_wit_2.
Proof. unfold Qs8Rdsum.vector_scalar_goal.rdsum_splat32_return_wit_2;try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.
End Checked.
Print Assumptions Checked.proof_of_rdsum_wadd16_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_wadd16_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_wadd16_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rdsum_wadd16_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd16_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd16_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd16_return_wit_2.
Print Assumptions Checked.proof_of_rdsum_active_wadd16_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rdsum_active_wadd16_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd32_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd32_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_wadd32_return_wit_2.
Print Assumptions Checked.proof_of_rdsum_active_wadd32_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rdsum_active_wadd32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_add32_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_add32_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_active_add32_return_wit_2.
Print Assumptions Checked.proof_of_rdsum_active_add32_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_rdsum_active_add32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_rdsum_splat16_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_splat16_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_splat16_return_wit_2.
Print Assumptions Checked.proof_of_rdsum_splat32_safety_wit_1.
Print Assumptions Checked.proof_of_rdsum_splat32_return_wit_1.
Print Assumptions Checked.proof_of_rdsum_splat32_return_wit_2.
