From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Cvt Require Import RvvModel rvv_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac active_cases :=
 repeat match goal with
 | |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y);cbn
 end.
Ltac cvt_scalar_finish :=
 try rewrite Z.min_l by lia;
 try rewrite Z.min_r by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try match goal with |- context[signed_last_nbits ?x 16] => pose proof(signed_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 32] => pose proof(unsigned_Lastnbits_range x 32 ltac:(lia)) end;
 entailer!;try congruence;try lia.
Module CheckedActive : Qs8Cvt.rvv_active_goal.VC_Correct.
Lemma proof_of_qcp_cvt_active_sext8_safety_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext8_return_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext8_return_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_return_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_return_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext8_partial_solve_wit_1_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_partial_solve_wit_1_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext8_partial_solve_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_partial_solve_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_partial_solve_wit_1, Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext8_partial_solve_wit_1_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext16_safety_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext16_return_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext16_return_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_return_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_return_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext16_partial_solve_wit_1_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_partial_solve_wit_1_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sext16_partial_solve_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_partial_solve_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_partial_solve_wit_1, Qs8Cvt.rvv_active_goal.qcp_cvt_active_sext16_partial_solve_wit_1_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sub16_safety_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sub16_return_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sub16_return_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_return_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_return_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sub16_partial_solve_wit_1_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_partial_solve_wit_1_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_sub16_partial_solve_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_partial_solve_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_partial_solve_wit_1, Qs8Cvt.rvv_active_goal.qcp_cvt_active_sub16_partial_solve_wit_1_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_safety_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_return_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_return_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_return_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_return_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_partial_solve_wit_1_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_1_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_partial_solve_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_1, Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_1_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_partial_solve_wit_2_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_2_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_2_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_float_partial_solve_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_2, Qs8Cvt.rvv_active_goal.qcp_cvt_active_float_partial_solve_wit_2_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_safety_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_return_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_return_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_return_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_return_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_partial_solve_wit_1 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_partial_solve_wit_2_pure : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_2_pure.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_2_pure;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of_qcp_cvt_active_mul_partial_solve_wit_2 : Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_2, Qs8Cvt.rvv_active_goal.qcp_cvt_active_mul_partial_solve_wit_2_aux;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;unfold cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof.
 unfold Qs8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2;intros n Hsmall Hnonneg Hmax.
 unfold cvt_vl;rewrite Z.min_l by lia.
 unfold derivable1,andp,orp,coq_prop;intros m [_ Hemp].
 destruct(Z.eq_dec n 0);[left|right];repeat first[assumption|split|lia].
Qed.
End CheckedActive.
