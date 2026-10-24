From Coq Require Import ZArith Lia.
From Qu8Add Require Export UnsignedModel.
Local Open Scope Z_scope.
Definition qu_umin(a b:Z):Z := Z.min a b.
Definition qu_umax(a b:Z):Z := Z.max a b.
Definition qu_max16zero(x:Z):Z := Z.max x 0.
Lemma qu_umin_range : forall a b,0<=a<=255 -> 0<=b<=255 -> 0<=qu_umin a b<=255.
Proof. intros;unfold qu_umin;lia. Qed.
Lemma qu_umax_range : forall a b,0<=a<=255 -> 0<=b<=255 -> 0<=qu_umax a b<=255.
Proof. intros;unfold qu_umax;lia. Qed.
Lemma qu_max16zero_range : forall x,-32768<=x<=32767 -> 0<=qu_max16zero x<=32767.
Proof. intros;unfold qu_max16zero;lia. Qed.
