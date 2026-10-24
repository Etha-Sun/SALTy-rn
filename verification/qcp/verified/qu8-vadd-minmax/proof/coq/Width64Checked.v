From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Add Require Import width64_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedWidth : Qu8Add.width64_goal.VC_Correct.
Lemma proof_of_width_size_t_return_wit_1 : Qu8Add.width64_goal.width_size_t_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_size_t_return_wit_1;entailer!. Qed.
Lemma proof_of_width_i8_return_wit_1 : Qu8Add.width64_goal.width_i8_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_i8_return_wit_1;entailer!. Qed.
Lemma proof_of_width_u8_return_wit_1 : Qu8Add.width64_goal.width_u8_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_u8_return_wit_1;entailer!. Qed.
Lemma proof_of_width_i16_return_wit_1 : Qu8Add.width64_goal.width_i16_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_i16_return_wit_1;entailer!. Qed.
Lemma proof_of_width_i32_return_wit_1 : Qu8Add.width64_goal.width_i32_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_i32_return_wit_1;entailer!. Qed.
Lemma proof_of_width_u32_return_wit_1 : Qu8Add.width64_goal.width_u32_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_u32_return_wit_1;entailer!. Qed.
Lemma proof_of_width_i64_return_wit_1 : Qu8Add.width64_goal.width_i64_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_i64_return_wit_1;entailer!. Qed.
Lemma proof_of_width_pointer_return_wit_1 : Qu8Add.width64_goal.width_pointer_return_wit_1.
Proof. unfold Qu8Add.width64_goal.width_pointer_return_wit_1;entailer!. Qed.
End CheckedWidth.
Print Assumptions CheckedWidth.proof_of_width_size_t_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i8_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_u8_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i16_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_u32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_i64_return_wit_1.
Print Assumptions CheckedWidth.proof_of_width_pointer_return_wit_1.
