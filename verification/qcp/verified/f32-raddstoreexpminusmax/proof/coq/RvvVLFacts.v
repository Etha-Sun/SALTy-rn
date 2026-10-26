From Coq Require Import ZArith Lia.
From ExpMinusMax Require Import IntrinsicModel RvvMemoryDomain.
Local Open Scope Z_scope.
Lemma em_legal_vl_short_consequence:forall avl vl,
 em_legal_vl avl vl -> avl>16 \/ vl=avl.
Proof.
 unfold em_legal_vl;intros avl vl[_ H].
 destruct(Z.leb_spec avl 16);[right;exact H|left;lia].
Qed.
Lemma em_legal_vl_short_exact:forall avl vl,
 0<=avl<=16 -> (em_legal_vl avl vl <-> vl=avl).
Proof.
 intros avl vl Ha;unfold em_legal_vl.
 destruct(Z.leb_spec avl 16);[tauto|lia].
Qed.
Print Assumptions em_legal_vl_short_consequence.
Print Assumptions em_legal_vl_short_exact.
