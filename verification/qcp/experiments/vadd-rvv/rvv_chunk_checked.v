Require Import Coq.Strings.String Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpRvv32 Require Import RvvStoreModel RvvLayout RvvResultBridge rvv_chunk_goal rvv_arrays_strategy_proof rvv_store_strategy_proof.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
From QcpRvv32 Require Import FastFrame.
Local Opaque rvv_read_value vadd_active_add store_float undef_store_float FloatArray.full FloatArray.undef_full.
Module CheckedRvvChunk : VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Lemma proof_of_rvv_chunk_return_wit_1 : rvv_chunk_return_wit_1.
Proof.
 unfold rvv_chunk_return_wit_1; left; intros.
 change (FloatArray.full out_pre vl_pre (rvv_take vl_pre (rvv_result_packed vl_pre A B)) **
   FloatArray.full b_pre vl_pre B ** FloatArray.full a_pre vl_pre A |--
   FloatArray.full a_pre vl_pre A ** FloatArray.full b_pre vl_pre B **
   FloatArray.full out_pre vl_pre (vadd_values vl_pre A B)).
 prop_apply (FloatArray.full_Zlength a_pre vl_pre A); Intros_p Ha.
 prop_apply (FloatArray.full_Zlength b_pre vl_pre B); Intros_p Hb.
 rewrite rvv_packed_result_prefix by lia. cancel.
Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_1_pure : rvv_chunk_partial_solve_wit_1_pure.
Proof. unfold rvv_chunk_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_1 : rvv_chunk_partial_solve_wit_1.
Proof. unfold rvv_chunk_partial_solve_wit_1, rvv_chunk_partial_solve_wit_1_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat split; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_2_pure : rvv_chunk_partial_solve_wit_2_pure.
Proof. unfold rvv_chunk_partial_solve_wit_2_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_2 : rvv_chunk_partial_solve_wit_2.
Proof. unfold rvv_chunk_partial_solve_wit_2, rvv_chunk_partial_solve_wit_2_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat split; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_3_pure : rvv_chunk_partial_solve_wit_3_pure.
Proof. unfold rvv_chunk_partial_solve_wit_3_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_3 : rvv_chunk_partial_solve_wit_3.
Proof. unfold rvv_chunk_partial_solve_wit_3, rvv_chunk_partial_solve_wit_3_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat split; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_4_pure : rvv_chunk_partial_solve_wit_4_pure.
Proof. unfold rvv_chunk_partial_solve_wit_4_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_rvv_chunk_partial_solve_wit_4 : rvv_chunk_partial_solve_wit_4.
Proof. unfold rvv_chunk_partial_solve_wit_4, rvv_chunk_partial_solve_wit_4_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat split; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel. Qed.
End CheckedRvvChunk.
Print Assumptions CheckedRvvChunk.proof_of_rvv_chunk_return_wit_1.

Print Assumptions CheckedRvvChunk.proof_of_rvv_chunk_partial_solve_wit_3.
