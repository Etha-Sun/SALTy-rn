From Coq Require Import ZArith Lia.
From Qs8Add Require Export Types ShiftFacts.
Local Open Scope Z_scope.
Definition qa_min (a b:Z):Z := Z.min a b.
Definition qa_max (a b:Z):Z := Z.max a b.
Lemma qa_min_range : forall a b,-128<=a<=127 -> -128<=b<=127 -> -128<=qa_min a b<=127.
Proof. intros;unfold qa_min;lia. Qed.
Lemma qa_max_range : forall a b,-128<=a<=127 -> -128<=b<=127 -> -128<=qa_max a b<=127.
Proof. intros;unfold qa_max;lia. Qed.
