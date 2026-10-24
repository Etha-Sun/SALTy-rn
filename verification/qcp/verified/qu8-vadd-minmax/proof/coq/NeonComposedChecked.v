From Coq Require Import ZArith Lia.
From Qu8Add Require Import ComposedBridge ByteBridge NeonFrame neon_composed_goal U8ArraysStrategy unsigned_tail_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonComposed : Qu8Add.neon_composed_goal.VC_Correct.
Include Qu8Add.U8ArraysStrategy.CheckedU8Arrays.
Include Qu8Add.unsigned_tail_strategy_proof.CheckedUnsignedTailStrategy.
Lemma proof_of_qcp_qu_store4_0_entail_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store4_0_entail_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store4_0_entail_wit_1;try left;intros;rewrite qu_undef4_cells;rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qu_store4_0_return_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store4_0_return_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store4_0_return_wit_1;try left;intros;rewrite qu_full4_cells;rewrite ?sizeof_uchar,?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;repeat rewrite unsigned_last_nbits_eq by lia;neon_frame. Qed.
Lemma proof_of_qcp_qu_store4_0_partial_solve_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store4_0_partial_solve_wit_2 : Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_2.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_2;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store4_0_partial_solve_wit_3 : Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_3.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store4_0_partial_solve_wit_3;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store2_0_entail_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store2_0_entail_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store2_0_entail_wit_1;try left;intros;rewrite qu_undef2_cells;rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qu_store2_0_return_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store2_0_return_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store2_0_return_wit_1;try left;intros;rewrite qu_full2_cells;rewrite ?sizeof_uchar,?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;repeat rewrite unsigned_last_nbits_eq by lia;neon_frame. Qed.
Lemma proof_of_qcp_qu_store2_0_partial_solve_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store2_0_partial_solve_wit_2 : Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_2.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_2;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store2_0_partial_solve_wit_3 : Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_3.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store2_0_partial_solve_wit_3;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
Lemma proof_of_qcp_qu_store1_0_entail_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store1_0_entail_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store1_0_entail_wit_1;try left;intros;rewrite qu_undef1_cells;rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qu_store1_0_return_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store1_0_return_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store1_0_return_wit_1;try left;intros;rewrite qu_full1_cells;rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r;neon_frame. Qed.
Lemma proof_of_qcp_qu_store1_0_partial_solve_wit_1 : Qu8Add.neon_composed_goal.qcp_qu_store1_0_partial_solve_wit_1.
Proof. unfold Qu8Add.neon_composed_goal.qcp_qu_store1_0_partial_solve_wit_1;intros;unfold UndefStructPreduint8x8_t;rewrite ?byte_typed_field_address;entailer!. Qed.
End CheckedNeonComposed.
