From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import RvvSupport NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_96_pure:rvv_goal.test_rvv_partial_solve_wit_96_pure.
Proof.
 unfold test_rvv_partial_solve_wit_96_pure;left;intros.
 unfold derivable1,andp,coq_prop;intros;rewrite sizeof_char in *.
 unfold qs8_min in *;repeat apply conj;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_96_pure.
