From Coq Require Import ZArith.
From Qd8Public Require Export CandidateLogic.
Local Open Scope Z_scope.
Definition qd8_ret_one (r:Z) : Prop := r=1.
Lemma qd8_ret_one_exact : forall r, qd8_ret_one r <-> r=1.
Proof. reflexivity. Qed.
Print Assumptions qd8_ret_one_exact.
