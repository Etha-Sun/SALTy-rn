From X32Transpose Require Import ObservationModel CursorFacts observe_goal.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedObserve:X32Transpose.observe_goal.VC_Correct.
Lemma proof_of_xt_observe_pointer_return_wit_1:X32Transpose.observe_goal.xt_observe_pointer_return_wit_1.
Proof.
 unfold X32Transpose.observe_goal.xt_observe_pointer_return_wit_1;left;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 rewrite !xt_u64_is_mod64.
 rewrite(xt_mod_add_l p_pre(xt_mod64(column_pre*stride_pre))).
 rewrite(xt_mod_add_r p_pre(column_pre*stride_pre)).
 rewrite xt_mod_add_l,xt_mod_add_r.
 unfold xt_observation_address;entailer!.
Qed.
Lemma proof_of_xt_read_output_entail_wit_1:X32Transpose.observe_goal.xt_read_output_entail_wit_1.
Proof.
 unfold X32Transpose.observe_goal.xt_read_output_entail_wit_1;left;intros.
 unfold xt_output_rest,xt_output_exact in *.
 pose proof(proj1(xt_cells_pop Z xt_output_cell W O p_pre PreH1 PreH3))as Hpop.
 rewrite PreH4 in Hpop;cbn[xt_output_cell]in Hpop.
 unfold xt_output;sep_apply Hpop;entailer!.
Qed.
Lemma proof_of_xt_read_output_return_wit_1:X32Transpose.observe_goal.xt_read_output_return_wit_1.
Proof.
 unfold X32Transpose.observe_goal.xt_read_output_return_wit_1;left;intros.
 unfold xt_output_rest,xt_output_exact in *.
 pose proof(proj2(xt_cells_pop Z xt_output_cell W O p PreH1 PreH3))as Hback.
 rewrite PreH4 in Hback;cbn[xt_output_cell]in Hback.
 unfold xt_output;sep_apply Hback;entailer!.
Qed.
End CheckedObserve.
Module ObserveExact:X32Transpose.observe_goal.VC_Correct:=CheckedObserve.
Print Assumptions CheckedObserve.proof_of_xt_observe_pointer_return_wit_1.
Print Assumptions CheckedObserve.proof_of_xt_read_output_entail_wit_1.
Print Assumptions CheckedObserve.proof_of_xt_read_output_return_wit_1.
