Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac forget_required_fields :=
 repeat multimatch goal with
 | |- context [undef_store_float ?p] =>
   multimatch goal with
   | |- context [store_float p ?v] => sep_apply (store_float_undef_store_float p v)
   end
 end.
Module CheckedNeonReassignCalls.
Lemma proof_of_test_neon_partial_solve_wit_24 : test_neon_partial_solve_wit_24.
Proof. unfold test_neon_partial_solve_wit_24. intros. csimpl. forget_required_fields. entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : test_neon_partial_solve_wit_25.
Proof. unfold test_neon_partial_solve_wit_25. intros. csimpl. forget_required_fields. entailer!. Qed.
End CheckedNeonReassignCalls.
