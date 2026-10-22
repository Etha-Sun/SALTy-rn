From Probe Require Import Layout vadd_goal.
Import Snaive_C_Rules64.
Module Checked : VC_Correct.
Lemma proof_of_vaddq_f32_return_wit_1 : vaddq_f32_return_wit_1.
Proof. unfold vaddq_f32_return_wit_1; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_vaddq_f32_partial_solve_wit_1 : vaddq_f32_partial_solve_wit_1.
Proof. unfold vaddq_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_return_wit_1 : chain_return_wit_1.
Proof. unfold chain_return_wit_1; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_partial_solve_wit_1 : chain_partial_solve_wit_1.
Proof. unfold chain_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_partial_solve_wit_2 : chain_partial_solve_wit_2.
Proof. unfold chain_partial_solve_wit_2; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_partial_solve_wit_3 : chain_partial_solve_wit_3.
Proof. unfold chain_partial_solve_wit_3; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_partial_solve_wit_4 : chain_partial_solve_wit_4.
Proof. unfold chain_partial_solve_wit_4; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
Lemma proof_of_chain_partial_solve_wit_5 : chain_partial_solve_wit_5.
Proof. unfold chain_partial_solve_wit_5; unfold UndefStructPredfloat32x4_t; intros; rewrite ?local_field_address; entailer!. Qed.
End Checked.
