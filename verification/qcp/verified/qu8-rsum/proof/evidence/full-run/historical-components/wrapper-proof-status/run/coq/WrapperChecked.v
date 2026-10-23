From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import RvvProgramModel FastFrame ByteStrategy public_wrapper_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapper : Qu8Rsum.public_wrapper_goal.VC_Correct.
Include Qu8Rsum.ByteStrategy.CheckedByteArrays.
Lemma proof_of_equivalent_return_wit_1 : Qu8Rsum.public_wrapper_goal.equivalent_return_wit_1.
Proof. unfold Qu8Rsum.public_wrapper_goal.equivalent_return_wit_1;try left;intros;subst;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[entailer!;try congruence;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_1_pure;try left;intros;subst;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[entailer!;try congruence;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_1, Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_1_aux;try left;intros;subst;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[entailer!;try congruence;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_2_pure;try left;intros;subst;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[entailer!;try congruence;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_2, Qu8Rsum.public_wrapper_goal.equivalent_partial_solve_wit_2_aux;try left;intros;subst;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[entailer!;try congruence;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
End CheckedWrapper.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
