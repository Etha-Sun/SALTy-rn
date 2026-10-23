From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Cvt Require Import UnsignedModel unsigned_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac cvt_scalar_finish :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try match goal with |- context[signed_last_nbits ?x 16] => pose proof(signed_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 16] => pose proof(unsigned_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 32] => pose proof(unsigned_Lastnbits_range x 32 ltac:(lia)) end;
 entailer!;try congruence;try lia.
Module CheckedUnsignedScalar : Qu8Cvt.unsigned_scalar_goal.VC_Correct.
Lemma proof_of_qcp_cvt_u16_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_u16_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_u16_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_add_u16_safety_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_safety_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_safety_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_add_u16_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_add_u16_partial_solve_wit_1_pure : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_partial_solve_wit_1_pure;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_add_u16_partial_solve_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_partial_solve_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_partial_solve_wit_1, Qu8Cvt.unsigned_scalar_goal.qcp_cvt_add_u16_partial_solve_wit_1_aux;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_s16_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_s16_partial_solve_wit_1_pure : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_partial_solve_wit_1_pure;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_s16_partial_solve_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_partial_solve_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_partial_solve_wit_1, Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_s16_partial_solve_wit_1_aux;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_u16_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_u16_partial_solve_wit_1_pure : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_partial_solve_wit_1_pure;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_as_u16_partial_solve_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_partial_solve_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_partial_solve_wit_1, Qu8Cvt.unsigned_scalar_goal.qcp_cvt_as_u16_partial_solve_wit_1_aux;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_seed_u16_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_seed_u16_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_seed_u16_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_zext_u8_return_wit_1 : Qu8Cvt.unsigned_scalar_goal.qcp_cvt_zext_u8_return_wit_1.
Proof. unfold Qu8Cvt.unsigned_scalar_goal.qcp_cvt_zext_u8_return_wit_1;try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16,cvt_u16,cvt_add_u16,cvt_seed_u16 in *;rewrite ?signed_unsigned_revolutive_less,?unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
End CheckedUnsignedScalar.
