From Coq Require Import Lia.
From ByvalueRvv Require Import Layout shim_goal.
From QcpRvv32 Require Import FastFrame.
Import Snaive_C_Rules64.
Module Checked : VC_Correct.
Lemma proof_of_qcp_byvalue_load_return_wit_1 : qcp_byvalue_load_return_wit_1.
Proof. unfold qcp_byvalue_load_return_wit_1; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_load_partial_solve_wit_1_pure : qcp_byvalue_load_partial_solve_wit_1_pure.
Proof. unfold qcp_byvalue_load_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_byvalue_load_partial_solve_wit_1 : qcp_byvalue_load_partial_solve_wit_1.
Proof. unfold qcp_byvalue_load_partial_solve_wit_1, qcp_byvalue_load_partial_solve_wit_1_aux; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_load_partial_solve_wit_2 : qcp_byvalue_load_partial_solve_wit_2.
Proof. unfold qcp_byvalue_load_partial_solve_wit_2; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_div_return_wit_1 : qcp_byvalue_div_return_wit_1.
Proof. unfold qcp_byvalue_div_return_wit_1; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_div_partial_solve_wit_1_pure : qcp_byvalue_div_partial_solve_wit_1_pure.
Proof. unfold qcp_byvalue_div_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_byvalue_div_partial_solve_wit_1 : qcp_byvalue_div_partial_solve_wit_1.
Proof. unfold qcp_byvalue_div_partial_solve_wit_1, qcp_byvalue_div_partial_solve_wit_1_aux; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_div_partial_solve_wit_2 : qcp_byvalue_div_partial_solve_wit_2.
Proof. unfold qcp_byvalue_div_partial_solve_wit_2; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_store_return_wit_1 : qcp_byvalue_store_return_wit_1.
Proof. unfold qcp_byvalue_store_return_wit_1; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_qcp_byvalue_store_partial_solve_wit_1_pure : qcp_byvalue_store_partial_solve_wit_1_pure.
Proof. unfold qcp_byvalue_store_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_byvalue_store_partial_solve_wit_1 : qcp_byvalue_store_partial_solve_wit_1.
Proof. unfold qcp_byvalue_store_partial_solve_wit_1, qcp_byvalue_store_partial_solve_wit_1_aux; intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
End Checked.
