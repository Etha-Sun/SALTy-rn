From Coq Require Import ZArith Lia.
From Qs8Add Require Export Types ShiftFacts.
Local Open Scope Z_scope.
Definition qa_vl(n:Z):Z := Z.min n 32.
Lemma qa_vl_bounds : forall n,0<=n -> 0<=qa_vl n<=32 /\ qa_vl n<=n /\ (0<n -> 0<qa_vl n).
Proof. intros n H;unfold qa_vl;destruct(Z_le_dec n 32);[rewrite Z.min_l|rewrite Z.min_r];lia. Qed.
