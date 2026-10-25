From Coq Require Import ZArith Lia.
From Qs8Mul Require Import Types FastFrame store_body_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedStore : Qs8Mul.store_body_goal.VC_Correct.
Lemma proof_of_qm_store8_safety_wit_1 : Qs8Mul.store_body_goal.qm_store8_safety_wit_1.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_1;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_2 : Qs8Mul.store_body_goal.qm_store8_safety_wit_2.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_2;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_3 : Qs8Mul.store_body_goal.qm_store8_safety_wit_3.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_3;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_4 : Qs8Mul.store_body_goal.qm_store8_safety_wit_4.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_4;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_5 : Qs8Mul.store_body_goal.qm_store8_safety_wit_5.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_5;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_6 : Qs8Mul.store_body_goal.qm_store8_safety_wit_6.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_6;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_7 : Qs8Mul.store_body_goal.qm_store8_safety_wit_7.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_7;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_safety_wit_8 : Qs8Mul.store_body_goal.qm_store8_safety_wit_8.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_8;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_qm_store8_return_wit_1 : Qs8Mul.store_body_goal.qm_store8_return_wit_1.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_return_wit_1;intros;first[apply derivable1_refl|fast_cancel]. Qed.
End CheckedStore.
Module ExactCheckedStore : Qs8Mul.store_body_goal.VC_Correct := CheckedStore.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_1.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_2.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_3.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_4.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_5.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_6.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_7.
Print Assumptions CheckedStore.proof_of_qm_store8_safety_wit_8.
Print Assumptions CheckedStore.proof_of_qm_store8_return_wit_1.
