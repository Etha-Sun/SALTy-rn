From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import type_width_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedWidth : type_width_goal.VC_Correct.
Lemma proof_of_dw_width_size_t_safety_wit_1 : type_width_goal.dw_width_size_t_safety_wit_1.
Proof. unfold type_width_goal.dw_width_size_t_safety_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_size_t_safety_wit_2 : type_width_goal.dw_width_size_t_safety_wit_2.
Proof. unfold type_width_goal.dw_width_size_t_safety_wit_2;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_size_t_return_wit_1 : type_width_goal.dw_width_size_t_return_wit_1.
Proof. unfold type_width_goal.dw_width_size_t_return_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uintptr_safety_wit_1 : type_width_goal.dw_width_uintptr_safety_wit_1.
Proof. unfold type_width_goal.dw_width_uintptr_safety_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uintptr_safety_wit_2 : type_width_goal.dw_width_uintptr_safety_wit_2.
Proof. unfold type_width_goal.dw_width_uintptr_safety_wit_2;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uintptr_return_wit_1 : type_width_goal.dw_width_uintptr_return_wit_1.
Proof. unfold type_width_goal.dw_width_uintptr_return_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uint32_safety_wit_1 : type_width_goal.dw_width_uint32_safety_wit_1.
Proof. unfold type_width_goal.dw_width_uint32_safety_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uint32_safety_wit_2 : type_width_goal.dw_width_uint32_safety_wit_2.
Proof. unfold type_width_goal.dw_width_uint32_safety_wit_2;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
Lemma proof_of_dw_width_uint32_return_wit_1 : type_width_goal.dw_width_uint32_return_wit_1.
Proof. unfold type_width_goal.dw_width_uint32_return_wit_1;try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.
End CheckedWidth.
Module ExactWidthAgain : type_width_goal.VC_Correct := CheckedWidth.
Print Assumptions ExactWidthAgain.proof_of_dw_width_size_t_safety_wit_1.
Print Assumptions ExactWidthAgain.proof_of_dw_width_size_t_safety_wit_2.
Print Assumptions ExactWidthAgain.proof_of_dw_width_size_t_return_wit_1.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uintptr_safety_wit_1.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uintptr_safety_wit_2.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uintptr_return_wit_1.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uint32_safety_wit_1.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uint32_safety_wit_2.
Print Assumptions ExactWidthAgain.proof_of_dw_width_uint32_return_wit_1.
