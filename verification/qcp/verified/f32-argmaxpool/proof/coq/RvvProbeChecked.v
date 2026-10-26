From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Import RvvKernelModel FastFrame rvv_probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac apr_intro:=lazymatch goal with
 | |- ?P |-- ?Q=>idtac
 | |- forall _,_=>intro;apr_intro
 | |- _ \/ _=>left;apr_intro
 end.
Ltac apr_pure:=unfold derivable1,andp,coq_prop,truep;intros;
 repeat match goal with H:_ /\ _|-_=>destruct H end;
 repeat first[assumption|split|reflexivity|lia].
Ltac apr_frame:=
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvuint32m8_t,UndefStructPredvbool4_t;
 rewrite ?ap_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apr_pure]
 |apply _derivable1_andp_intros;[apr_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedRvvProbe : ArgmaxPool.rvv_probe_goal.VC_Correct.
Lemma proof_of_probe_vl_return_wit_1 : ArgmaxPool.rvv_probe_goal.probe_vl_return_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_vl_return_wit_1;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_vl_partial_solve_wit_1 : ArgmaxPool.rvv_probe_goal.probe_vl_partial_solve_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_vl_partial_solve_wit_1;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_store_pair_return_wit_1 : ArgmaxPool.rvv_probe_goal.probe_store_pair_return_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_store_pair_return_wit_1;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_store_pair_partial_solve_wit_1_pure : ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_1_pure.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_1_pure;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_store_pair_partial_solve_wit_1 : ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_1, ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_1_aux;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_store_pair_partial_solve_wit_2_pure : ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_2_pure.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_2_pure;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_store_pair_partial_solve_wit_2 : ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_2.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_2, ArgmaxPool.rvv_probe_goal.probe_store_pair_partial_solve_wit_2_aux;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_return_wit_1 : ArgmaxPool.rvv_probe_goal.probe_select_return_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_return_wit_1;apr_intro;
 unfold apr_int_lane in PreH33;specialize(PreH33 ltac:(lia));rewrite PreH33 in PreH1;apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_1_pure : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_1_pure.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_1_pure;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_1 : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_1.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_1, ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_1_aux;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_2 : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_2.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_2;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_3_pure : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_3_pure.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_3_pure;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_3 : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_3.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_3, ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_3_aux;apr_intro;
 apr_frame. Qed.
Lemma proof_of_probe_select_partial_solve_wit_4 : ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_4.
Proof. unfold ArgmaxPool.rvv_probe_goal.probe_select_partial_solve_wit_4;apr_intro;
 apr_frame. Qed.
End CheckedRvvProbe.
Module ExactRvvProbe:ArgmaxPool.rvv_probe_goal.VC_Correct:=CheckedRvvProbe.
Print Assumptions ExactRvvProbe.proof_of_probe_vl_return_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_vl_partial_solve_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_store_pair_return_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_store_pair_partial_solve_wit_1_pure.
Print Assumptions ExactRvvProbe.proof_of_probe_store_pair_partial_solve_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_store_pair_partial_solve_wit_2_pure.
Print Assumptions ExactRvvProbe.proof_of_probe_store_pair_partial_solve_wit_2.
Print Assumptions ExactRvvProbe.proof_of_probe_select_return_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_1_pure.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_1.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_2.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_3_pure.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_3.
Print Assumptions ExactRvvProbe.proof_of_probe_select_partial_solve_wit_4.
