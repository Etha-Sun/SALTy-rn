From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import rvv_unit_goal FastFrame RvvBounds MemoryModel RvvLastWordPart00.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque UIntArray.full rd_mem rd_partial rd_acc32 rd_out_lane.
Lemma proof_of_test_rvv_partial_solve_wit_43:
 Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_43.
Proof.
 unfold Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_43,
 Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_43_aux;intros.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;
 [rd_last_word_pure channels_pre channels vl PreH6 PreH7|sepcon_assoc_change;fast_cancel].
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_43.
