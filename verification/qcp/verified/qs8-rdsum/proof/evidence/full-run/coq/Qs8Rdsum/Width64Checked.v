From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import type_width_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedWidth : Qs8Rdsum.type_width_goal.VC_Correct.
Lemma proof_of_width_size_t_return_wit_1 : Qs8Rdsum.type_width_goal.width_size_t_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_i8_return_wit_1 : Qs8Rdsum.type_width_goal.width_i8_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_i8_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_i16_return_wit_1 : Qs8Rdsum.type_width_goal.width_i16_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_i16_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_i32_return_wit_1 : Qs8Rdsum.type_width_goal.width_i32_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_i32_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_i64_return_wit_1 : Qs8Rdsum.type_width_goal.width_i64_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_i64_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_u16_return_wit_1 : Qs8Rdsum.type_width_goal.width_u16_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_u16_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_u32_return_wit_1 : Qs8Rdsum.type_width_goal.width_u32_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_u32_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_pointer_return_wit_1 : Qs8Rdsum.type_width_goal.width_pointer_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_pointer_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_width_size_t_unsigned_safety_wit_1 : Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_1; intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!. Qed.
Lemma proof_of_width_size_t_unsigned_safety_wit_2 : Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_2.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_2; intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!. Qed.
Lemma proof_of_width_size_t_unsigned_safety_wit_3 : Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_3.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_3; intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!. Qed.
Lemma proof_of_width_size_t_unsigned_safety_wit_4 : Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_4.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_unsigned_safety_wit_4; intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!. Qed.
Lemma proof_of_width_size_t_unsigned_return_wit_1 : Qs8Rdsum.type_width_goal.width_size_t_unsigned_return_wit_1.
Proof. unfold Qs8Rdsum.type_width_goal.width_size_t_unsigned_return_wit_1; intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!. Qed.
End CheckedWidth.
Print Assumptions CheckedWidth.proof_of_width_size_t_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i8_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i16_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i64_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_u16_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_u32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_pointer_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_size_t_unsigned_safety_wit_1.
Print Assumptions CheckedWidth.proof_of_width_size_t_unsigned_safety_wit_2.
Print Assumptions CheckedWidth.proof_of_width_size_t_unsigned_safety_wit_3.
Print Assumptions CheckedWidth.proof_of_width_size_t_unsigned_safety_wit_4.
Print Assumptions CheckedWidth.proof_of_width_size_t_unsigned_return_wit_1.
