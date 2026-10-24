From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import Model scalar_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac scalar_bound :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_signed with 9223372036854775807 in *;
 try change Int64.min_signed with (-9223372036854775808) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac scalar_range :=
 repeat match goal with
 | |- context[signed_last_nbits ?x ?n] =>
   let H:=fresh "Hrange"in pose proof(signed_Lastnbits_range x n ltac:(lia))as H;
   change(-2^(n-1)<=signed_last_nbits x n<2^(n-1))in H;
   first[solve[entailer!;lia]|fail 1]
 | |- context[unsigned_last_nbits ?x ?n] =>
   let H:=fresh "Hrange"in pose proof(unsigned_Lastnbits_range x n ltac:(lia))as H;
   first[solve[entailer!;lia]|fail 1]
 end.
Ltac scalar_cases :=
 repeat match goal with
 | |- context[Z.gtb ?a ?b] => destruct(Z.gtb_spec a b)
 | |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b)
 end.
Ltac scalar_finish :=
 scalar_bound;
 unfold rs_s16,rs_u16,rs_s32,rs_u32,rs_pair_s8,rs_pair_u8,
 rs_pair_s16,rs_pair_u16,rs_add_s32,rs_add_u32 in *;
 scalar_cases;scalar_bound;
 try rewrite signed_unsigned_revolutive_less by lia;
 repeat first[progress rewrite signed_unsigned_add_l by lia|progress rewrite signed_unsigned_add_r by lia];
 try rewrite unsigned_last_nbits_eq by (cbn;lia);
 try rewrite signed_last_nbits_eq by (cbn;lia);
 first[solve[entailer!;lia]|solve[scalar_range]].
Module CheckedScalar : Qs8Rdsum.scalar_primitives_goal.VC_Correct.
Lemma proof_of_rsum_narrow16_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_narrow16_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_narrow16_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_unarrow16_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_unarrow16_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_unarrow16_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_narrow32_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_narrow32_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_narrow32_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_2 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_2.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_3 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_3.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_3;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_4 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_4.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_4;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_5 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_5.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_5;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_6 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_6.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_6;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_7 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_7.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_7;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_8 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_8.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_8;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_9 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_9.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_9;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_10 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_10.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_10;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_11 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_11.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_11;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_12 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_12.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_12;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_13 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_13.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_13;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_14 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_14.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_14;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_safety_wit_15 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_15.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_safety_wit_15;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_return_wit_2 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_2.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_s32_return_wit_3 : Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_3.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_s32_return_wit_3;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_u32_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_add_u32_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_u32_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_add_u32_return_wit_2 : Qs8Rdsum.scalar_primitives_goal.rsum_add_u32_return_wit_2.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_add_u32_return_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s8_safety_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_safety_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s8_safety_wit_2 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_safety_wit_2.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_safety_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s8_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s8_partial_solve_wit_1_pure : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_partial_solve_wit_1_pure;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s8_partial_solve_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_partial_solve_wit_1, Qs8Rdsum.scalar_primitives_goal.rsum_pair_s8_partial_solve_wit_1_aux;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u8_safety_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_safety_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u8_safety_wit_2 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_safety_wit_2.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_safety_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u8_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u8_partial_solve_wit_1_pure : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_partial_solve_wit_1_pure;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u8_partial_solve_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_partial_solve_wit_1, Qs8Rdsum.scalar_primitives_goal.rsum_pair_u8_partial_solve_wit_1_aux;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s16_safety_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_safety_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s16_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s16_partial_solve_wit_1_pure : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_partial_solve_wit_1_pure;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_s16_partial_solve_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_partial_solve_wit_1, Qs8Rdsum.scalar_primitives_goal.rsum_pair_s16_partial_solve_wit_1_aux;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u16_return_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_return_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u16_partial_solve_wit_1_pure : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_partial_solve_wit_1_pure;try left;intros;scalar_finish. Qed.
Lemma proof_of_rsum_pair_u16_partial_solve_wit_1 : Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_partial_solve_wit_1, Qs8Rdsum.scalar_primitives_goal.rsum_pair_u16_partial_solve_wit_1_aux;try left;intros;scalar_finish. Qed.
End CheckedScalar.
