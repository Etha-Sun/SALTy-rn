From Coq Require Import ZArith Lia.
From MaxPool Require Import Types TraceLookup CompareFacts FastFrame caller_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_complete mp_out mp_data mp_ptr_data mp_probe_value.
Ltac mp_intro := lazymatch goal with |- _ |-- _=>idtac | |- forall _, _=>intro;mp_intro end.
Ltac mp_caller_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[solve[assumption|reflexivity|congruence|lia]
 |solve[eapply mp_complete_probe_known;[lia|lia|eassumption]]
 |solve[eapply mp_written_window;eassumption]
 |solve[match goal with HG:mp_geometry ?F ?PT ?W ?P ?K ?C ?table ?offset ?stride ?inc ?output ?outinc,
          HW:mp_written ?P ?C ?output ?outinc ?p |- _=>
     pose proof(mp_written_window F PT W P K C table offset stride inc output outinc p HG HW)as Hp;
     unfold mp_write_window in Hp;lia end]
 |split].
Ltac mp_caller_frame :=
 rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[mp_caller_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedCaller : MaxPool.caller_goal.VC_Correct.
Lemma proof_of_compare_maxpool_written_safety_wit_1 : MaxPool.caller_goal.compare_maxpool_written_safety_wit_1.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_safety_wit_1;try left;mp_intro;mp_caller_pure. Qed.
Lemma proof_of_compare_maxpool_written_return_wit_1 : MaxPool.caller_goal.compare_maxpool_written_return_wit_1.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_return_wit_1;try left;mp_intro;mp_caller_frame. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_1_pure : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_1_pure.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_1_pure;try left;mp_intro;mp_caller_pure. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_1 : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_1.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_1;unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_1_aux;try left;mp_intro;mp_caller_frame. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_2_pure : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_2_pure.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_2_pure;try left;mp_intro;mp_caller_pure. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_2 : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_2.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_2;unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_2_aux;try left;mp_intro;mp_caller_frame. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_3_pure : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_3_pure.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_3_pure;try left;mp_intro;mp_caller_pure. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_3 : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_3.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_3;unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_3_aux;try left;mp_intro;mp_caller_frame. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_4_pure : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_4_pure.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_4_pure;try left;mp_intro;mp_caller_pure. Qed.
Lemma proof_of_compare_maxpool_written_partial_solve_wit_4 : MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_4.
Proof. unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_4;unfold MaxPool.caller_goal.compare_maxpool_written_partial_solve_wit_4_aux;try left;mp_intro;mp_caller_frame. Qed.
End CheckedCaller.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_safety_wit_1.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_return_wit_1.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_1_pure.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_1.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_2_pure.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_2.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_3_pure.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_3.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_4_pure.
Print Assumptions CheckedCaller.proof_of_compare_maxpool_written_partial_solve_wit_4.
