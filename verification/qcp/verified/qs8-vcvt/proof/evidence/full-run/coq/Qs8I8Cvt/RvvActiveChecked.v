From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From compcert.lib Require Import Integers.
From Qs8I8Cvt Require Import RvvModel rvv_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac active_cases :=
 repeat match goal with
 | |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y);cbn
 end.
Ltac qcv_active_finish :=
 try unfold qcv_rvv_mul in *;
 try rewrite Z.min_l by lia;
 try rewrite Z.min_r by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try match goal with |- context[signed_last_nbits ?x 16] => pose proof(signed_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 32] => pose proof(unsigned_Lastnbits_range x 32 ltac:(lia)) end;
 entailer!;try congruence;try lia.
Module CheckedActive : Qs8I8Cvt.rvv_active_goal.VC_Correct.
Lemma proof_of_qcp_qcv_active_sext_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_sext_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_sext_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_sext_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_safety_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_safety_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_safety_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_partial_solve_wit_1_pure;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_rsub_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_rsub_partial_solve_wit_1_aux;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_shl7_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_shl7_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_shl7_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_shl7_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_partial_solve_wit_1_pure;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_shl7_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_shl7_partial_solve_wit_1_aux;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_mul_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_safety_wit_1;try left;intros;pose proof(qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia));unfold qcv_rvv_mul in *;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_mul_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_return_wit_1;try left;intros;pose proof(qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia));unfold qcv_rvv_mul in *;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_mul_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_return_wit_2;try left;intros;pose proof(qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia));unfold qcv_rvv_mul in *;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_mul_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_partial_solve_wit_1_pure;try left;intros;pose proof(qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia));unfold qcv_rvv_mul in *;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_mul_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_mul_partial_solve_wit_1_aux;try left;intros;pose proof(qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia));unfold qcv_rvv_mul in *;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip15_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip15_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip15_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip15_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_partial_solve_wit_1_pure;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip15_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip15_partial_solve_wit_1_aux;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_add_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_add_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_add_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_add_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_partial_solve_wit_1_pure;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_add_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_add_partial_solve_wit_1_aux;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip8_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip8_return_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip8_return_wit_2 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_return_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_return_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip8_partial_solve_wit_1_pure : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_partial_solve_wit_1_pure;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of_qcp_qcv_active_clip8_partial_solve_wit_1 : Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_partial_solve_wit_1, Qs8I8Cvt.rvv_active_goal.qcp_qcv_active_clip8_partial_solve_wit_1_aux;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;unfold qcv_active_sext,qcv_active_rsub,qcv_active_shl7,qcv_active_mul,qcv_active_clip15,qcv_active_add,qcv_active_clip8,qcv_vl in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; qcv_active_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof.
 unfold Qs8I8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2;intros n Hsmall Hnonneg Hmax.
 unfold qcv_vl;rewrite Z.min_l by lia.
 unfold derivable1,andp,orp,coq_prop;intros m [_ Hemp].
 destruct(Z.eq_dec n 0);[left|right];repeat first[assumption|split|lia].
Qed.
End CheckedActive.
