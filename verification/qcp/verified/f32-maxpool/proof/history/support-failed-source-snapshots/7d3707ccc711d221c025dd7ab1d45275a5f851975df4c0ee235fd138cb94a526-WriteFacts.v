From Coq Require Import ZArith List Lia FunctionalExtensionality.
From MaxPool Require Import MemoryModel.
Local Open Scope Z_scope.
Lemma mp_put_same:forall O p v,mp_put O p v p=Some v.
Proof. intros;unfold mp_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma mp_put_other:forall O p q v,p<>q->mp_put O p v q=O q.
Proof. intros;unfold mp_put;destruct(Z.eqb_spec q p);congruence. Qed.
Lemma mp_write_n_inside:forall count O p value i,
 0<=i<Z.of_nat count->mp_write_n O p count value(p+4*i)=Some(value i).
Proof.
 induction count;intros O p value i Hi;[simpl in Hi;lia|].
 cbn[mp_write_n]. destruct(Z.eq_dec i(Z.of_nat count))as[Heq|Hneq].
 - subst i;apply mp_put_same.
 - rewrite mp_put_other by lia. apply IHcount. rewrite Nat2Z.inj_succ in Hi;lia.
Qed.
Lemma mp_write_n_outside:forall count O p value q,
 (forall i,0<=i<Z.of_nat count->q<>p+4*i)->mp_write_n O p count value q=O q.
Proof.
 induction count;intros O p value q H;[reflexivity|].
 cbn[mp_write_n]. rewrite mp_put_other.
 - apply IHcount;intros;apply H;rewrite Nat2Z.inj_succ;lia.
 - intro Heq;apply(H(Z.of_nat count));[rewrite Nat2Z.inj_succ;lia|lia].
Qed.
Lemma mp_write_inside:forall O p count value i,
 0<=i<count->mp_write O p count value(p+4*i)=Some(value i).
Proof. intros;unfold mp_write;apply mp_write_n_inside;rewrite Z2Nat.id by lia;assumption. Qed.
Lemma mp_write_outside:forall O p count value q,
 0<=count->(forall i,0<=i<count->q<>p+4*i)->mp_write O p count value q=O q.
Proof. intros;unfold mp_write;apply mp_write_n_outside;rewrite Z2Nat.id by lia;assumption. Qed.
Lemma mp_loaded_known:forall O p v r,O p=Some v->mp_loaded O p r->r=v.
Proof. intros O p v r H;unfold mp_loaded;rewrite H;tauto. Qed.
Lemma mp_write_n_append:forall m n O p value,
 mp_write_n(mp_write_n O p n value)(p+4*Z.of_nat n)m(fun j=>value(Z.of_nat n+j))=
 mp_write_n O p(n+m)value.
Proof.
 induction m;intros n O p value.
 - rewrite Nat.add_0_r;reflexivity.
 - rewrite Nat.add_succ_r;cbn[mp_write_n]. rewrite IHm.
   rewrite Nat2Z.inj_add.
   replace(p+4*Z.of_nat n+4*Z.of_nat m)with(p+4*(Z.of_nat n+Z.of_nat m))by lia.
   reflexivity.
Qed.
Lemma mp_write_append:forall O p n m value,0<=n->0<=m->
 mp_write(mp_write O p n value)(p+4*n)m(fun j=>value(n+j))=mp_write O p(n+m)value.
Proof.
 intros O p n m value Hn Hm;unfold mp_write.
 rewrite Z2Nat.inj_add by lia.
 replace n with(Z.of_nat(Z.to_nat n))at 2 3 by(rewrite Z2Nat.id by lia;reflexivity).
 apply mp_write_n_append.
Qed.
