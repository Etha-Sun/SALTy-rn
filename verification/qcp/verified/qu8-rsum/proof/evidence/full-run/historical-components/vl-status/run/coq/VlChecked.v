From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rsum Require Import Model VlModel vl_goal.
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
 unfold rs_vl in *;scalar_bound;
 unfold rs_s16,rs_u16,rs_s32,rs_u32,rs_pair_s8,rs_pair_u8,
 rs_pair_s16,rs_pair_u16,rs_add_s32,rs_add_u32 in *;
 scalar_cases;scalar_bound;
 try rewrite signed_unsigned_revolutive_less by lia;
 repeat first[progress rewrite signed_unsigned_add_l by lia|progress rewrite signed_unsigned_add_r by lia];
 try rewrite unsigned_last_nbits_eq by (cbn;lia);
 try rewrite signed_last_nbits_eq by (cbn;lia);
 first[solve[entailer!;lia]|solve[scalar_range]].
Module CheckedScalar : Qu8Rsum.vl_goal.VC_Correct.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_safety_wit_2 : Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_2.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_safety_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvl_e8m2_return_wit_2;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m8_safety_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_safety_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m8_return_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_return_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m8_return_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m1_safety_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_safety_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_safety_wit_1;try left;intros;scalar_finish. Qed.
Lemma proof_of___riscv_vsetvlmax_e32m1_return_wit_1 : Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_return_wit_1.
Proof. unfold Qu8Rsum.vl_goal.__riscv_vsetvlmax_e32m1_return_wit_1;try left;intros;scalar_finish. Qed.
End CheckedScalar.
