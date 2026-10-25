From Coq Require Import ZArith List Lia.
From X32Packw Require Import ObservationFacts observe_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedObserve : X32Packw.observe_goal.VC_Correct.
Lemma proof_of_pw_read_output_entail_wit_1:pw_read_output_entail_wit_1.
Proof. unfold pw_read_output_entail_wit_1.
 right;intros;exact(proj1(pw_output_exact_loan W O p_pre x PreH2 PreH3 PreH4)).
Qed.
Lemma proof_of_pw_read_output_return_wit_1:pw_read_output_return_wit_1.
Proof. unfold pw_read_output_return_wit_1.
 first[left|idtac];intros;pose proof(proj2(pw_output_exact_loan W O p_pre x PreH2 PreH3 PreH4))as Hp;sep_apply Hp;entailer!.
Qed.
End CheckedObserve.
Module ObserveExact : X32Packw.observe_goal.VC_Correct := CheckedObserve.
Print Assumptions CheckedObserve.proof_of_pw_read_output_entail_wit_1.
Print Assumptions CheckedObserve.proof_of_pw_read_output_return_wit_1.
