From Coq Require Import ZArith List Lia.
From X32Packw Require Import RvvAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_rvv_odd_partial_solve_wit_4_pure:pw_rvv_odd_partial_solve_wit_4_pure.
Proof. unfold pw_rvv_odd_partial_solve_wit_4_pure.
 first [right;intros;pw_rvv_auto|left;intros;pw_rvv_auto|intros;pw_rvv_auto].
Qed.
Print Assumptions checked_pw_rvv_odd_partial_solve_wit_4_pure.
