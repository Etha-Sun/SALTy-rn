From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rdsum Require Import Model ControlFacts control_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_limits :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Module CheckedControl : Qu8Rdsum.control_primitives_goal.VC_Correct.
Lemma proof_of_rdsum_min252_safety_wit_1 : Qu8Rdsum.control_primitives_goal.rdsum_min252_safety_wit_1.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_min252_safety_wit_1;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_min252_safety_wit_2 : Qu8Rdsum.control_primitives_goal.rdsum_min252_safety_wit_2.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_min252_safety_wit_2;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_min252_return_wit_1 : Qu8Rdsum.control_primitives_goal.rdsum_min252_return_wit_1.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_min252_return_wit_1;try left;intros;rd_limits;unfold rd_min252;rewrite Z.min_r by lia;entailer!;lia. Qed.
Lemma proof_of_rdsum_min252_return_wit_2 : Qu8Rdsum.control_primitives_goal.rdsum_min252_return_wit_2.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_min252_return_wit_2;try left;intros;rd_limits;unfold rd_min252;rewrite Z.min_l by lia;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_1 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_1.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_1;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_2 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_2.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_2;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_3 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_3.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_3;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_4 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_4.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_4;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_5 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_5.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_5;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_safety_wit_6 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_6.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_safety_wit_6;try left;intros;rd_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_return_wit_1 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_return_wit_1.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_return_wit_1;try left;intros;rd_limits;repeat rewrite Z.quot_div_nonneg in * by lia;repeat rewrite Z.rem_mod_nonneg in * by lia;pose proof(rd_quot252_bounds r_pre ltac:(lia));unfold rd_ceil252;destruct(Z.eqb_spec(r_pre mod 252)0);try contradiction;assert(0<r_pre)by(destruct(Z.eq_dec r_pre 0);subst;[cbn in *;lia|lia]);pose proof(rd_quot252_strict r_pre ltac:(lia));rewrite unsigned_last_nbits_eq by(cbn;lia);entailer!;lia. Qed.
Lemma proof_of_rdsum_ceil252_return_wit_2 : Qu8Rdsum.control_primitives_goal.rdsum_ceil252_return_wit_2.
Proof. unfold Qu8Rdsum.control_primitives_goal.rdsum_ceil252_return_wit_2;try left;intros;rd_limits;repeat rewrite Z.quot_div_nonneg in * by lia;repeat rewrite Z.rem_mod_nonneg in * by lia;pose proof(rd_quot252_bounds r_pre ltac:(lia));unfold rd_ceil252;destruct(Z.eqb_spec(r_pre mod 252)0);try contradiction;entailer!;lia. Qed.
End CheckedControl.
