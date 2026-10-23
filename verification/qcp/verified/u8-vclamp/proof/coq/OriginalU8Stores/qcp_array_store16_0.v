From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout ModeFacts full10_goal.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac finish := rewrite ?sizeof_uchar; repeat apply derivable1s_truep_intros;
 first [solve [apply derivable1s_coq_prop_r; rewrite ?Zlength_cons, ?Zlength_nil; lia] |
        opaque_leaves; sepcon_assoc_change; fast_cancel | entailer!].
Lemma proof_of_qcp_array_store16_0_return_wit_1 : full10_goal.qcp_array_store16_0_return_wit_1.
Proof. unfold full10_goal.qcp_array_store16_0_return_wit_1; right; intros; rewrite ?sizeof_uchar; repeat rewrite Zlength_cons; rewrite ?Zlength_nil; rewrite ?Z.mul_1_r, ?Z.add_0_r; entailer!. Qed.
Lemma proof_of_qcp_array_store16_0_partial_solve_wit_1 : full10_goal.qcp_array_store16_0_partial_solve_wit_1.
Proof. pre_process_default; do 2 (rewrite UCharArray.undef_seg_unfold by lia); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; rewrite ?Z.mul_1_r, ?Z.add_0_r; replace (0 + 1 + 1 + 1 + 1)%Z with 4%Z in * by lia; replace (0 + 1 + 1 + 1)%Z with 3%Z in * by lia; replace (0 + 1 + 1)%Z with 2%Z in * by lia; replace (0 + 1)%Z with 1%Z in * by lia; finish. Qed.
Print Assumptions proof_of_qcp_array_store16_0_return_wit_1.
Print Assumptions proof_of_qcp_array_store16_0_partial_solve_wit_1.
