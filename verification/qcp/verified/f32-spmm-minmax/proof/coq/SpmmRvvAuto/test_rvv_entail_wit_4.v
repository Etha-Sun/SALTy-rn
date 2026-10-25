From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_4 : test_rvv_entail_wit_4.
Proof.
 unfold test_rvv_entail_wit_4;right;intros.
 spmm_entry_normalize;rewrite ?spmm_z_get in *;spmm_normalize2.
 rewrite ?spmm_acc_zero in *.
 match goal with H:spmm_capacity ?rows ?cols ?stride ?a ?w ?d ?n ?out ?NN ?D ?A ?W |- _ =>
 multimatch goal with |- context[spmm_output_cursor out ?row stride 0] =>
 rewrite(spmm_output_cursor_bound out rows cols stride row 0 1)by lia
 end end.
 spmm_normalize2.
 match goal with |- _ |-- ?Q =>
 multimatch Q with context[spmm_output ?out ?rows ?cols ?stride ?row 0 ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
 rewrite(spmm_output_start_width out rows cols stride row width start NN D A W lo hi)
 end end.
 timeout 120 spmm_fast_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_4.
