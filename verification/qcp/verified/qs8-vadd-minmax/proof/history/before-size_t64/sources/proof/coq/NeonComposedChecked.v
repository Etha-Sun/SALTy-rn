From Coq Require Import ZArith Lia.
From Qs8Add Require Import ComposedBridge ByteBridge NeonFrame neon_composed_goal S8ArraysStrategy signed_tail_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonComposed : Qs8Add.neon_composed_goal.VC_Correct.
Include Qs8Add.S8ArraysStrategy.CheckedS8Arrays.
Include Qs8Add.signed_tail_strategy_proof.CheckedSignedTailStrategy.
Lemma proof_of_qcp_qa_store4_0_entail_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store4_0_entail_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store4_0_entail_wit_1;try left;intros;rewrite qa_undef4_cells;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qa_store4_0_return_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store4_0_return_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store4_0_return_wit_1;try left;intros;rewrite qa_full4_cells;rewrite ?sizeof_char,?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;sepcon_assoc_change;do 4(apply derivable1_sepcon_mono;[apply byte_cell_signed_roundtrip;lia|]);apply derivable1_refl. Qed.
Lemma proof_of_qcp_qa_store4_0_partial_solve_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store4_0_partial_solve_wit_2 : Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_2.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_2;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store4_0_partial_solve_wit_3 : Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_3.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store4_0_partial_solve_wit_3;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store2_0_entail_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store2_0_entail_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store2_0_entail_wit_1;try left;intros;rewrite qa_undef2_cells;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qa_store2_0_return_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store2_0_return_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store2_0_return_wit_1;try left;intros;rewrite qa_full2_cells;rewrite ?sizeof_char,?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;sepcon_assoc_change;do 2(apply derivable1_sepcon_mono;[apply byte_cell_signed_roundtrip;lia|]);apply derivable1_refl. Qed.
Lemma proof_of_qcp_qa_store2_0_partial_solve_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store2_0_partial_solve_wit_2 : Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_2.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_2;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store2_0_partial_solve_wit_3 : Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_3.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store2_0_partial_solve_wit_3;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qa_store1_0_entail_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store1_0_entail_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store1_0_entail_wit_1;try left;intros;rewrite qa_undef1_cells;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qa_store1_0_return_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store1_0_return_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store1_0_return_wit_1;try left;intros;rewrite qa_full1_cells;rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qa_store1_0_partial_solve_wit_1 : Qs8Add.neon_composed_goal.qcp_qa_store1_0_partial_solve_wit_1.
Proof. unfold Qs8Add.neon_composed_goal.qcp_qa_store1_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
End CheckedNeonComposed.
