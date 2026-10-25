From Coq Require Import ZArith Lia.
From Qs8Mul Require Import Types FastFrame store_probe_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedProbe : Qs8Mul.store_probe_goal.VC_Correct.
Lemma proof_of_qm_store_probe_return_wit_1 : Qs8Mul.store_probe_goal.qm_store_probe_return_wit_1.
Proof. unfold Qs8Mul.store_probe_goal.qm_store_probe_return_wit_1;intros;first[apply derivable1_refl|fast_cancel]. Qed.
Lemma proof_of_qm_store_probe_partial_solve_wit_1 : Qs8Mul.store_probe_goal.qm_store_probe_partial_solve_wit_1.
Proof. unfold Qs8Mul.store_probe_goal.qm_store_probe_partial_solve_wit_1;intros;first[apply derivable1_refl|fast_cancel]. Qed.
End CheckedProbe.
Module ExactCheckedProbe : Qs8Mul.store_probe_goal.VC_Correct := CheckedProbe.
Print Assumptions CheckedProbe.proof_of_qm_store_probe_return_wit_1.
Print Assumptions CheckedProbe.proof_of_qm_store_probe_partial_solve_wit_1.
