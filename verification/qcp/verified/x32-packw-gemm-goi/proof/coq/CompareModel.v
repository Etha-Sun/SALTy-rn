From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From AUXLib Require Import ListLib.
Local Open Scope Z_scope.
Definition words_prefix (X Y:list Z) (k:Z) :=
 forall j,0<=j<k -> Znth j X 0=Znth j Y 0.
Definition words_same (X Y:list Z) : Prop := X=Y.
Definition words_different (X Y:list Z) : Prop := X<>Y.
Lemma words_prefix_empty : forall X Y,words_prefix X Y 0.
Proof. unfold words_prefix;intros;lia. Qed.
Lemma words_prefix_next : forall X Y i,
 words_prefix X Y i -> Znth i X 0=Znth i Y 0 -> words_prefix X Y (i+1).
Proof.
 unfold words_prefix;intros X Y i Hprefix Heq j Hj.
 destruct (Z_lt_dec j i);[apply Hprefix;lia|assert(j=i)by lia;subst;exact Heq].
Qed.
Lemma words_prefix_complete : forall X Y n,
 Zlength X=n -> Zlength Y=n -> words_prefix X Y n -> words_same X Y.
Proof.
 intros X Y n Hx Hy Hprefix;unfold words_same.
 apply (nth_ext X Y 0 0).
 - rewrite Zlength_correct in Hx,Hy;lia.
 - intros i Hi.
   pose proof(Hprefix (Z.of_nat i) ltac:(rewrite Zlength_correct in Hx;lia))as Heq.
   unfold Znth in Heq;rewrite Nat2Z.id in Heq;exact Heq.
Qed.
Lemma words_different_at : forall X Y i,
 Znth i X 0<>Znth i Y 0 -> words_different X Y.
Proof. unfold words_different;intros X Y i Hneq Heq;subst;contradiction. Qed.
Print Assumptions words_prefix_complete.
Print Assumptions words_different_at.

Lemma constant_one_wrong : ~ (1=1 /\ words_same (0::nil) (1::nil) \/ 1=0 /\ words_different (0::nil) (1::nil)).
Proof. unfold words_same,words_different;intros [[_ H]|[H _]];discriminate. Qed.
Print Assumptions constant_one_wrong.

Print Assumptions words_prefix_empty.

Print Assumptions words_prefix_next.
