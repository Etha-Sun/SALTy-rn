From Coq Require Import ZArith Lia.
From X32Transpose Require Import ArithmeticModel scalar_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedScalar : X32Transpose.scalar_goal.VC_Correct.
Lemma proof_of_doz_safety_wit_1:X32Transpose.scalar_goal.doz_safety_wit_1.
Proof. unfold X32Transpose.scalar_goal.doz_safety_wit_1;try left;intros;try change INT_MAX with2147483647;try change INT_MIN with(-2147483648);entailer!;lia. Qed.
Lemma proof_of_doz_return_wit_1:X32Transpose.scalar_goal.doz_return_wit_1.
Proof. unfold X32Transpose.scalar_goal.doz_return_wit_1;try left;intros;unfold xt_doz;destruct(Z.ltb_spec b_pre a_pre);entailer!;lia. Qed.
Lemma proof_of_doz_return_wit_2:X32Transpose.scalar_goal.doz_return_wit_2.
Proof. unfold X32Transpose.scalar_goal.doz_return_wit_2;try left;intros;unfold xt_doz;destruct(Z.ltb_spec b_pre a_pre);entailer!;lia. Qed.
Lemma proof_of_round_down_po2_safety_wit_1:X32Transpose.scalar_goal.round_down_po2_safety_wit_1.
Proof. unfold X32Transpose.scalar_goal.round_down_po2_safety_wit_1;try left;intros;try change INT_MAX with2147483647;try change INT_MIN with(-2147483648);entailer!;lia. Qed.
Lemma proof_of_round_down_po2_return_wit_1:X32Transpose.scalar_goal.round_down_po2_return_wit_1.
Proof. unfold X32Transpose.scalar_goal.round_down_po2_return_wit_1;try left;intros;unfold xt_round_down,xt_mod64,unsigned_last_nbits;change (2^64)with18446744073709551616;entailer!. Qed.
End CheckedScalar.
Print Assumptions CheckedScalar.proof_of_doz_safety_wit_1.
Print Assumptions CheckedScalar.proof_of_doz_return_wit_1.
Print Assumptions CheckedScalar.proof_of_doz_return_wit_2.
Print Assumptions CheckedScalar.proof_of_round_down_po2_safety_wit_1.
Print Assumptions CheckedScalar.proof_of_round_down_po2_return_wit_1.
