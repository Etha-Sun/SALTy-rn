From X32Transpose Require Import RvvAutomation TreeFrame.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedRvvCopy.
Lemma proof_of_test_rvv_partial_solve_wit_18:X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof.
 unfold X32Transpose.rvv_unit_goal.test_rvv_partial_solve_wit_18;intros.
 repeat progress rewrite<-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[solve[assumption]|split].
 - unfold UndefStructPredvuint32m8_t;rewrite ?xt_rvv_local_field_address;opaque_leaves;xt_tree_cancel.
Qed.
End CheckedRvvCopy.
Print Assumptions CheckedRvvCopy.proof_of_test_rvv_partial_solve_wit_18.
