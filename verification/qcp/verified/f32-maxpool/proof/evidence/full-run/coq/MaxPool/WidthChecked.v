From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import Model CountFacts type_width_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedWidth : MaxPool.type_width_goal.VC_Correct.
Lemma proof_of_mp_width_size_t_return_wit_1 : MaxPool.type_width_goal.mp_width_size_t_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_size_t_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_uintptr_return_wit_1 : MaxPool.type_width_goal.mp_width_uintptr_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_uintptr_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_u32_return_wit_1 : MaxPool.type_width_goal.mp_width_u32_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_u32_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_float_return_wit_1 : MaxPool.type_width_goal.mp_width_float_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_float_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_pointer_return_wit_1 : MaxPool.type_width_goal.mp_width_pointer_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_pointer_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_i32_return_wit_1 : MaxPool.type_width_goal.mp_width_i32_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_i32_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_i64_return_wit_1 : MaxPool.type_width_goal.mp_width_i64_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_i64_return_wit_1;entailer!. Qed.
Lemma proof_of_mp_width_u64_return_wit_1 : MaxPool.type_width_goal.mp_width_u64_return_wit_1.
Proof. unfold MaxPool.type_width_goal.mp_width_u64_return_wit_1;entailer!. Qed.
End CheckedWidth.
Print Assumptions CheckedWidth.proof_of_mp_width_size_t_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_uintptr_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_u32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_float_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_pointer_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_i32_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_i64_return_wit_1.
Print Assumptions CheckedWidth.proof_of_mp_width_u64_return_wit_1.
