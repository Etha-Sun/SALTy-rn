From Coq Require Import ZArith Lia List.
From Sqrt Require Import KernelSupport Borrowed wrapper_unit_goal sqrt_public_strategy_proof.
From VaddComparator Require Import ComparatorLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque sqrt_arm sqrt_rvv sqrt_core sqrt_lane sqrt_active sqrt_read_at store_float undef_store_float FloatArray.full FloatArray.seg FloatArray.undef_full FloatArray.undef_seg.
Lemma wrapper_q4:forall x:Z,(x*4) ÷ 4=x.
Proof. intros;rewrite Z.quot_mul by lia;reflexivity. Qed.
Ltac wrapper_prepare := sqrt_kernel_prepare; rewrite ?wrapper_q4,?Z.rem_mul in * by lia.
Ltac wrapper_frame := repeat progress rewrite <-logic_equiv_andp_assoc;
first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
|solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]]
|opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedWrapper : Sqrt.wrapper_unit_goal.VC_Correct.
Include Sqrt.sqrt_public_strategy_proof.CheckedSqrtPublic.
Lemma proof_of_equivalent_safety_wit_1 : Sqrt.wrapper_unit_goal.equivalent_safety_wit_1.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_safety_wit_1. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_safety_wit_2 : Sqrt.wrapper_unit_goal.equivalent_safety_wit_2.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_safety_wit_2. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_entail_wit_1 : Sqrt.wrapper_unit_goal.equivalent_entail_wit_1.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_entail_wit_1. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_entail_wit_2 : Sqrt.wrapper_unit_goal.equivalent_entail_wit_2.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_entail_wit_2. try left;wrapper_prepare. assert(Hrelated: outputs_related(sqrt_arm_values n_pre A)(sqrt_rvv_values n_pre A))by exact(sqrt_prefix_related n_pre A). wrapper_frame. Qed.
Lemma proof_of_equivalent_return_wit_1 : Sqrt.wrapper_unit_goal.equivalent_return_wit_1.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_return_wit_1. try left;wrapper_prepare. Exists(sqrt_arm_values n_pre A)(sqrt_rvv_values n_pre A). wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_1.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_1. intro Hcall;unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_1_aux. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_2.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_2. intro Hcall;unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_2_aux. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure. try left;wrapper_prepare. wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_3.
Proof. unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_3. intro Hcall;unfold Sqrt.wrapper_unit_goal.equivalent_partial_solve_wit_3_aux. try left;wrapper_prepare. wrapper_frame. Qed.
End CheckedWrapper.
Print Assumptions CheckedWrapper.proof_of_equivalent_safety_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_safety_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3.
