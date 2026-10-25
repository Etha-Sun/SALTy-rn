From Coq Require Import ZArith List Lia.
From X32Packw Require Import StrideAccessModel StridedPairFacts rvv_store_pair_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvStorePair : X32Packw.rvv_store_pair_goal.VC_Correct.
Lemma proof_of_pw_store_pair_vectors_safety_wit_1:pw_store_pair_vectors_safety_wit_1.
Proof.
 unfold pw_store_pair_vectors_safety_wit_1.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_safety_wit_2:pw_store_pair_vectors_safety_wit_2.
Proof.
 unfold pw_store_pair_vectors_safety_wit_2.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_safety_wit_3:pw_store_pair_vectors_safety_wit_3.
Proof.
 unfold pw_store_pair_vectors_safety_wit_3.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_return_wit_1:pw_store_pair_vectors_return_wit_1.
Proof.
 unfold pw_store_pair_vectors_return_wit_1.
 first [left|idtac];intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;rewrite pw_two_strides_segmented_Z;entailer!.
Qed.
Lemma proof_of_pw_store_pair_vectors_partial_solve_wit_1_pure:pw_store_pair_vectors_partial_solve_wit_1_pure.
Proof.
 unfold pw_store_pair_vectors_partial_solve_wit_1_pure.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_partial_solve_wit_1:pw_store_pair_vectors_partial_solve_wit_1.
Proof.
 unfold pw_store_pair_vectors_partial_solve_wit_1, pw_store_pair_vectors_partial_solve_wit_1_aux.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_partial_solve_wit_2_pure:pw_store_pair_vectors_partial_solve_wit_2_pure.
Proof.
 unfold pw_store_pair_vectors_partial_solve_wit_2_pure.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
Lemma proof_of_pw_store_pair_vectors_partial_solve_wit_2:pw_store_pair_vectors_partial_solve_wit_2.
Proof.
 unfold pw_store_pair_vectors_partial_solve_wit_2, pw_store_pair_vectors_partial_solve_wit_2_aux.
 first [solve [left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [right;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!] |solve [intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold pw_segment_window in *;repeat match goal with H:_ /\ _ |- _=>destruct H end;entailer!]].
Qed.
End CheckedRvvStorePair.
Module RvvStorePairExact : X32Packw.rvv_store_pair_goal.VC_Correct := CheckedRvvStorePair.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_safety_wit_1.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_safety_wit_2.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_safety_wit_3.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_return_wit_1.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_partial_solve_wit_1_pure.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_partial_solve_wit_1.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_partial_solve_wit_2_pure.
Print Assumptions CheckedRvvStorePair.proof_of_pw_store_pair_vectors_partial_solve_wit_2.
