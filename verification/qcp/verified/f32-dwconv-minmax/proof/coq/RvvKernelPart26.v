From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Local Opaque sepcon store_float store_int store_ptr store_uint64 undef_store_float undef_store_int undef_store_ptr undef_store_uint64 Dwconv.Types.UndefStructPredvfloat32m4_t Dwconv.Types.UndefStructPredvbool8_t dw_data dw_ptr_data dw_output.
Module CheckedRvvKernelPart26.
Lemma proof_of_test_rvv_partial_solve_wit_48 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_48.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_48;idtac "STAGE binders". Time dw_prepare. Time dw_address_units. idtac "STAGE borrow". Time dwr_rewrite_borrow. idtac "STAGE assoc". Time (repeat progress rewrite <-logic_equiv_andp_assoc). apply _derivable1_andp_intros. - idtac "STAGE pure". Time (unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];first[tauto|lia]). - idtac "STAGE spatial". Time opaque_leaves. Time sepcon_assoc_change. Time fast_cancel. Qed.
End CheckedRvvKernelPart26.
