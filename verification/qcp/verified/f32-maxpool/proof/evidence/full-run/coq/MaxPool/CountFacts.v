From Coq Require Import ZArith Lia.
From MaxPool Require Import Model.
Local Open Scope Z_scope.
Lemma mp_remaining_nonnegative:forall k,0<=mp_remaining k.
Proof. intro k;unfold mp_remaining;destruct(Z.ltb_spec 9 k);lia. Qed.
Lemma mp_remaining_small:forall k,k<=9->mp_remaining k=0.
Proof. intros k H;unfold mp_remaining;destruct(Z.ltb_spec 9 k);lia. Qed.
Lemma mp_remaining_large:forall k,9<k->mp_remaining k=k-9.
Proof. intros k H;unfold mp_remaining;destruct(Z.ltb_spec 9 k);lia. Qed.
Lemma mp_remaining_bounded:forall k,0<=k<=18446744073709551615->0<=mp_remaining k<=18446744073709551615.
Proof. intros k H;unfold mp_remaining;destruct(Z.ltb_spec 9 k);lia. Qed.
Lemma mp_remaining_decreases:forall k,0<k->mp_remaining k<k.
Proof. intros k H;unfold mp_remaining;destruct(Z.ltb_spec 9 k);lia. Qed.
Lemma mp_remaining_consumed:forall k,0<=k->k=Z.min k 9+mp_remaining k.
Proof. intros k H;unfold mp_remaining;destruct(Z.ltb_spec 9 k);[rewrite Z.min_r|rewrite Z.min_l];lia. Qed.
Lemma mp_vl_positive_bounded:forall avl vl,0<avl->mp_vl_allowed avl vl->0<vl<=32 /\ vl<=avl.
Proof.
 intros avl vl Ha H;unfold mp_vl_allowed in H;destruct H as[(H1&H2)|[(H1&H2)|H]];try lia.
 pose proof(Z.div_mod(avl+1)2 ltac:(lia));pose proof(Z.mod_pos_bound(avl+1)2 ltac:(lia));lia.
Qed.
Lemma mp_vl_progress:forall avl vl,0<avl->mp_vl_allowed avl vl->0<=avl-vl<avl.
Proof. intros;pose proof(mp_vl_positive_bounded avl vl H H0);lia. Qed.
