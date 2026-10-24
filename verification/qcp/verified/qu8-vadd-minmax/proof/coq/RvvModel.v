From Coq Require Import ZArith Lia.
From Qu8Add Require Export Types ShiftFacts.
Local Open Scope Z_scope.
Definition qu_vl(n:Z):Z := Z.min n 32.
Lemma qu_vl_bounds : forall n,0<=n -> 0<=qu_vl n<=32 /\ qu_vl n<=n /\ (0<n -> 0<qu_vl n).
Proof. intros n H;unfold qu_vl;destruct(Z_le_dec n 32);[rewrite Z.min_l|rewrite Z.min_r];lia. Qed.
