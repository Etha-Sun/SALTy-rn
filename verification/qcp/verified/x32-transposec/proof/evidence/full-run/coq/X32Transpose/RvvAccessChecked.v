From X32Transpose Require Import RvvAutomation RvvAccessFacts.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedRvvAccess.
Lemma proof_of_test_rvv_safety_wit_8:X32Transpose.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_safety_wit_8;intros.
rewrite PreH14,PreH10 in PreH1;rewrite PreH14 in PreH13;cbn [unsigned_last_nbits] in PreH13.
entailer!;lia. Qed.
Lemma proof_of_test_rvv_safety_wit_10:X32Transpose.rvv_unit_goal.test_rvv_safety_wit_10.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_safety_wit_10;intros.
rewrite PreH3,PreH11 in PreH1;rewrite PreH3 in PreH15;cbn [unsigned_last_nbits] in PreH15.
entailer!;lia. Qed.
Lemma proof_of_test_rvv_safety_wit_14:X32Transpose.rvv_unit_goal.test_rvv_safety_wit_14.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_safety_wit_14;intros.
rewrite PreH3,PreH11 in PreH1;rewrite PreH3 in PreH15;cbn [unsigned_last_nbits] in PreH15.
entailer!;lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17_pure:X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure;left;intros.
assert(Hwindow:xt_window F i vl). { rewrite PreH20,PreH6;eapply xt_rvv_loop_window;[exact PreH2|lia|lia|lia]. }
unfold UndefStructPredvuint32m8_t;rewrite ?xt_rvv_local_field_address;entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17:X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_17;intro Hpure;unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_17_aux;intros.
assert(Hwindow:xt_window F i vl). { rewrite PreH20,PreH6;eapply xt_rvv_loop_window;[exact PreH2|lia|lia|lia]. }
unfold UndefStructPredvuint32m8_t;rewrite ?xt_rvv_local_field_address;entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19_pure:X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure;left;intros.
assert(Hstore:xt_stride_valid W o output_stride vl /\ xt_stride_distinct o output_stride vl). { rewrite PreH53,PreH36,PreH38;eapply xt_rvv_loop_store;[exact PreH34|lia|lia|lia|lia]. } destruct Hstore as[Hvalid Hdistinct].
unfold UndefStructPredvuint32m8_t;rewrite ?xt_rvv_local_field_address;entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19:X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_19.
Proof. unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_19;intro Hpure;unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_19_aux;intros.
assert(Hstore:xt_stride_valid W o output_stride vl /\ xt_stride_distinct o output_stride vl). { rewrite PreH53,PreH36,PreH38;eapply xt_rvv_loop_store;[exact PreH34|lia|lia|lia|lia]. } destruct Hstore as[Hvalid Hdistinct].
unfold UndefStructPredvuint32m8_t;rewrite ?xt_rvv_local_field_address;entailer!. Qed.
End CheckedRvvAccess.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_safety_wit_8.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_safety_wit_10.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_safety_wit_14.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_partial_solve_wit_17_pure.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_partial_solve_wit_17.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_partial_solve_wit_19_pure.
Print Assumptions CheckedRvvAccess.proof_of_test_rvv_partial_solve_wit_19.
