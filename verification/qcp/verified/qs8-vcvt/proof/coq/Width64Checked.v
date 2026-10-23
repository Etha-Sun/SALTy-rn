From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8I8Cvt Require Import type_width_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedWidth : Qs8I8Cvt.type_width_goal.VC_Correct.
Lemma proof_of_width_size_t_return_wit_1 : Qs8I8Cvt.type_width_goal.width_size_t_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_size_t_return_wit_1; entailer!. Qed.
Lemma proof_of_width_i8_return_wit_1 : Qs8I8Cvt.type_width_goal.width_i8_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_i8_return_wit_1; entailer!. Qed.
Lemma proof_of_width_i16_return_wit_1 : Qs8I8Cvt.type_width_goal.width_i16_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_i16_return_wit_1; entailer!. Qed.
Lemma proof_of_width_i32_return_wit_1 : Qs8I8Cvt.type_width_goal.width_i32_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_i32_return_wit_1; entailer!. Qed.
Lemma proof_of_width_i64_return_wit_1 : Qs8I8Cvt.type_width_goal.width_i64_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_i64_return_wit_1; entailer!. Qed.
Lemma proof_of_width_u16_return_wit_1 : Qs8I8Cvt.type_width_goal.width_u16_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_u16_return_wit_1; entailer!. Qed.
Lemma proof_of_width_u32_return_wit_1 : Qs8I8Cvt.type_width_goal.width_u32_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_u32_return_wit_1; entailer!. Qed.
Lemma proof_of_width_pointer_return_wit_1 : Qs8I8Cvt.type_width_goal.width_pointer_return_wit_1.
Proof. unfold Qs8I8Cvt.type_width_goal.width_pointer_return_wit_1; entailer!. Qed.
End CheckedWidth.
