From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Model CodecProof StoreFacts arrays_strategy_proof.
From StoreCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: StoreCodecVC.unit_goal.VC_Correct.
Include FullU8.arrays_strategy_proof.Checked.
Lemma proof_of_qcp_rvv_store_safety_wit_1 : qcp_rvv_store_safety_wit_1.
Proof. unfold qcp_rvv_store_safety_wit_1;pre_process;entailer!;lia. Qed.
Lemma proof_of_qcp_rvv_store_entail_wit_1 : qcp_rvv_store_entail_wit_1.
Proof.
 unfold qcp_rvv_store_entail_wit_1;left;pre_process.
 cbn[sublist];rewrite UCharArray.seg_empty;entailer!.
Qed.
Lemma proof_of_qcp_rvv_store_entail_wit_2 : qcp_rvv_store_entail_wit_2.
Proof.
 unfold qcp_rvv_store_entail_wit_2;left;pre_process;subst retval.
 match goal with |- context[vec_bytes ?W] =>pose proof(vec_prefix_snoc W i ltac:(lia))as Hsnoc end.
 rewrite Hsnoc;entailer!;try assumption;try reflexivity;lia.
Qed.
Lemma proof_of_qcp_rvv_store_return_wit_1 : qcp_rvv_store_return_wit_1.
Proof.
 unfold qcp_rvv_store_return_wit_1;left;pre_process.
 assert(Hi:i=vl_pre)by lia;subst i.
 sep_apply UCharArray.seg_to_full.
 sep_apply UCharArray.undef_seg_to_undef_full.
 unfold StoreUCharAsElement.sizeA.
 rewrite ?Z.mul_0_l,?Z.add_0_r,?Z.sub_0_r;entailer!.
Qed.
Lemma proof_of_qcp_rvv_store_partial_solve_wit_1_pure : qcp_rvv_store_partial_solve_wit_1_pure.
Proof. unfold qcp_rvv_store_partial_solve_wit_1_pure;pre_process;entailer!;lia. Qed.
Lemma proof_of_qcp_rvv_store_partial_solve_wit_1 : qcp_rvv_store_partial_solve_wit_1.
Proof.
 unfold qcp_rvv_store_partial_solve_wit_1,qcp_rvv_store_partial_solve_wit_1_aux;pre_process;entailer!;lia.
Qed.
Lemma proof_of_qcp_rvv_store_partial_solve_wit_2 : qcp_rvv_store_partial_solve_wit_2.
Proof.
 unfold qcp_rvv_store_partial_solve_wit_2;pre_process.
 rewrite(UCharArray.undef_seg_unfold p_pre i n)by lia.
 unfold StoreUCharAsElement.undefstoreA;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_rvv_store_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_rvv_store_entail_wit_1.
Print Assumptions Checked.proof_of_qcp_rvv_store_entail_wit_2.
Print Assumptions Checked.proof_of_qcp_rvv_store_return_wit_1.
Print Assumptions Checked.proof_of_qcp_rvv_store_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_rvv_store_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_rvv_store_partial_solve_wit_2.
