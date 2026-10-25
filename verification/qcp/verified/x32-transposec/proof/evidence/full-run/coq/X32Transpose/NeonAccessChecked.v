From X32Transpose Require Import NeonAutomation NeonAccessFacts.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedNeonAccess.
Lemma proof_of_test_neon_safety_wit_8:X32Transpose.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_safety_wit_8;intros.
rewrite PreH14,PreH10 in PreH1;rewrite PreH14 in PreH13;cbn [unsigned_last_nbits] in PreH13.
entailer!;lia. Qed.
Lemma proof_of_test_neon_safety_wit_10:X32Transpose.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_safety_wit_10;intros.
rewrite PreH3,PreH11 in PreH1;rewrite PreH3 in PreH15;cbn [unsigned_last_nbits] in PreH15.
entailer!;lia. Qed.
Lemma proof_of_test_neon_safety_wit_14:X32Transpose.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_safety_wit_14;intros.
rewrite PreH3,PreH11 in PreH1;rewrite PreH3 in PreH15;cbn [unsigned_last_nbits] in PreH15.
entailer!;lia. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_40_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_40_pure;left;intros.
assert(Hwindow:xt_window F i0 2). { rewrite PreH28,PreH7.
eapply xt_current_input_padded_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_40:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_40;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_40_aux;intros.
assert(Hwindow:xt_window F i0 2). { rewrite PreH28,PreH7.
eapply xt_current_input_padded_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_42_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_42_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_42_pure;left;intros.
assert(Hwindow:xt_window F i1 2). { rewrite PreH29,PreH7.
eapply xt_current_input_padded_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_42:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_42;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_42_aux;intros.
assert(Hwindow:xt_window F i1 2). { rewrite PreH29,PreH7.
eapply xt_current_input_padded_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_48_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_48_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_48_pure;left;intros.
assert(Hwindow:xt_write_window W o1 2). { rewrite PreH31,PreH7.
pose proof(xt_neon_second_bounds(xt_cols G)k block_width ltac:(lia)PreH22)as Hsecond.
eapply xt_current_output_vertical_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_48:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_48;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_48_aux;intros.
assert(Hwindow:xt_write_window W o1 2). { rewrite PreH31,PreH7.
pose proof(xt_neon_second_bounds(xt_cols G)k block_width ltac:(lia)PreH22)as Hsecond.
eapply xt_current_output_vertical_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_49_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_49_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_49_pure;left;intros.
assert(Hwindow:xt_write_window W o0 2). { rewrite PreH30,PreH7.
eapply xt_current_output_vertical_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_49:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_49;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_49_aux;intros.
assert(Hwindow:xt_write_window W o0 2). { rewrite PreH30,PreH7.
eapply xt_current_output_vertical_window;[exact PreH2|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_50_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_50_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_50_pure;left;intros.
assert(Hwindow:xt_window F i0 2). { rewrite PreH29,PreH8.
eapply xt_current_input_padded_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_50:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_50.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_50;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_50_aux;intros.
assert(Hwindow:xt_window F i0 2). { rewrite PreH29,PreH8.
eapply xt_current_input_padded_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_58_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_58_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_58_pure;left;intros.
assert(Hwindow:xt_write_window W o1 1). { rewrite PreH32,PreH8.
pose proof(xt_neon_second_bounds(xt_cols G)k block_width ltac:(lia)PreH23)as Hsecond.
eapply xt_current_output_vertical_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_58:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_58;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_58_aux;intros.
assert(Hwindow:xt_write_window W o1 1). { rewrite PreH32,PreH8.
pose proof(xt_neon_second_bounds(xt_cols G)k block_width ltac:(lia)PreH23)as Hsecond.
eapply xt_current_output_vertical_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_59_pure:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_59_pure.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_59_pure;left;intros.
assert(Hwindow:xt_write_window W o0 1). { rewrite PreH31,PreH8.
eapply xt_current_output_vertical_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_neon_partial_solve_wit_59:X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_59;intro Hpure;unfold X32Transpose.neon_unit_goal.test_neon_partial_solve_wit_59_aux;intros.
assert(Hwindow:xt_write_window W o0 1). { rewrite PreH31,PreH8.
eapply xt_current_output_vertical_window;[exact PreH3|lia|lia|lia|lia]. }
unfold UndefStructPreduint32x2_t;rewrite ?xt_neon_local_field_address;entailer!;try(subst;apply derivable1_refl). Qed.
End CheckedNeonAccess.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_safety_wit_8.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_safety_wit_10.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_safety_wit_14.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_40_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_40.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_42_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_42.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_48_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_48.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_49_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_49.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_50_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_50.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_58_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_58.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_59_pure.
Print Assumptions CheckedNeonAccess.proof_of_test_neon_partial_solve_wit_59.
