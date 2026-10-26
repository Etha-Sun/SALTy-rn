From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelPureFacts MemoryFacts guard_probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma apg_lookup:forall P base,ap_ptr_window P base 9->ap_ptr_present P(base+64) /\ (base+64<>0).
Proof. intros P base [Hp[Hn Hcells]]. split;[replace(base+64)with(base+8*8)by ring;apply Hcells;lia|lia]. Qed.
Lemma apg_old_missing_guard_counter:forall p,app_read_cursor p 1 0 8+8<>app_read_cursor p 1 0 9.
Proof. intro p;unfold app_read_cursor,app_remaining;cbn;lia. Qed.
Ltac apg_prepare:=
 try match goal with H:ap_ptr_window ?P ?base 9|-_=>pose proof(apg_lookup P base H)as[Hcell Hpos]end;
 rewrite ?sizeof_ptr in *;try change Arch64.ptr_size_Z with 8 in *.
Ltac apg_props:=repeat first[solve[assumption|reflexivity|lia|congruence]|split].
Ltac apg_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply apb_pure_right;apg_props
 | |-?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[apg_pure|apg_pure]
 end.
Ltac apg_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apg_pure]|apply _derivable1_andp_intros;[apg_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]|opaque_leaves;sepcon_assoc_change;fast_cancel].
Module Checked : ArgmaxPool.guard_probe_goal.VC_Correct.
Lemma proof_of_ap_read_table_entail_wit_1:ArgmaxPool.guard_probe_goal.ap_read_table_entail_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_read_table_entail_wit_1;right;apb_intro;match goal with Hp:ap_ptr_present ?P ?p|-_=>exact(proj1(ap_ptr_data_pop P p Hp))end. Qed.
Lemma proof_of_ap_read_table_return_wit_1:ArgmaxPool.guard_probe_goal.ap_read_table_return_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_read_table_return_wit_1;right;apb_intro;match goal with Hp:ap_ptr_present ?P ?p|-_=>exact(proj2(ap_ptr_data_pop P p Hp))end. Qed.
Lemma proof_of_ap_guard_cut_probe_safety_wit_1:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_1;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_safety_wit_2:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_2.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_2;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_safety_wit_3:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_3.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_safety_wit_3;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_entail_wit_1:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_entail_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_entail_wit_1;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_return_wit_1:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_return_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_return_wit_1;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_return_wit_2:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_return_wit_2.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_return_wit_2;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_partial_solve_wit_1_pure:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_partial_solve_wit_1_pure.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_partial_solve_wit_1_pure;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
Lemma proof_of_ap_guard_cut_probe_partial_solve_wit_1:ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_partial_solve_wit_1.
Proof. unfold ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_partial_solve_wit_1,ArgmaxPool.guard_probe_goal.ap_guard_cut_probe_partial_solve_wit_1_aux;apb_intro;apg_prepare;try subst p_pre;try subst k_pre;apg_frame. Qed.
End Checked.
Module Strict : ArgmaxPool.guard_probe_goal.VC_Correct := Checked.
Print Assumptions Strict.proof_of_ap_read_table_entail_wit_1.
Print Assumptions Strict.proof_of_ap_read_table_return_wit_1.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_safety_wit_1.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_safety_wit_2.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_safety_wit_3.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_entail_wit_1.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_return_wit_1.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_return_wit_2.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_partial_solve_wit_1_pure.
Print Assumptions Strict.proof_of_ap_guard_cut_probe_partial_solve_wit_1.
Print Assumptions apg_old_missing_guard_counter.
