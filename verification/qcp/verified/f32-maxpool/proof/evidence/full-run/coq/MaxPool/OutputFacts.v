From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import MemoryModel WriteFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint mp_addr_pop(W:list Z)(p:Z):list Z:=
 match W with []=>[]|q::rest=>if Z.eqb p q then rest else q::mp_addr_pop rest p end.
Lemma mp_out_ext:forall W O1 O2,
 (forall p,In p W->O1 p=O2 p)->mp_out W O1=mp_out W O2.
Proof.
 induction W;intros O1 O2 H;[reflexivity|]. cbn[mp_out]. f_equal.
 - unfold mp_out_cell;rewrite H by(left;reflexivity);reflexivity.
 - apply IHW;intros;apply H;right;assumption.
Qed.
Lemma mp_out_pop:forall W O p,In p W->
 mp_out W O --||-- mp_out_cell O p**mp_out(mp_addr_pop W p)O.
Proof.
 induction W as[|q W IH];intros O p H;[contradiction|].
 cbn[mp_out mp_addr_pop]. destruct(Z.eqb_spec p q)as[Heq|Hneq].
 - subst p;split;entailer!.
 - assert(Hin:In p W)by(destruct H;[congruence|assumption]).
   specialize(IH O p Hin);destruct IH as[Hforward Hback]. cbn[mp_out].
   split;[sep_apply Hforward|sep_apply Hback];entailer!.
Qed.
Lemma mp_out_pop_initialized:forall W O p v,In p W->O p=Some v->
 mp_out W O --||--(p # Float |->v)**mp_out(mp_addr_pop W p)O.
Proof. intros;pose proof(mp_out_pop W O p H)as Hpop;unfold mp_out_cell in Hpop;rewrite H0 in Hpop;exact Hpop. Qed.
Lemma mp_addr_pop_excludes:forall W p,NoDup W->~In p(mp_addr_pop W p).
Proof.
 induction W as[|q W IH];intros p H;[simpl;tauto|].
 inversion H as[|? ? Hnot Hnd];subst;cbn[mp_addr_pop].
 destruct(Z.eqb_spec p q)as[Heq|Hneq].
 - subst p;assumption.
 - simpl;intros[Hsame|Hin];[congruence|exact(IH p Hnd Hin)].
Qed.
Lemma mp_out_update_frame:forall W O p v,~In p W->
 mp_out W(mp_put O p v)=mp_out W O.
Proof.
 intros;apply mp_out_ext;intros q Hq;apply mp_put_other;intro Heq;subst q;contradiction.
Qed.
Lemma mp_out_update_cell:forall O p v,mp_out_cell(mp_put O p v)p=(p # Float |->v).
Proof. intros;unfold mp_out_cell;rewrite mp_put_same;reflexivity. Qed.
Lemma mp_out_writeback:forall W O p v,In p W->NoDup W->
 (p # Float |->v)**mp_out(mp_addr_pop W p)O|--mp_out W(mp_put O p v).
Proof.
 intros W O p v Hin Hnd.
 pose proof(proj2(mp_out_pop W(mp_put O p v)p Hin))as Hback.
 rewrite mp_out_update_cell in Hback.
 rewrite mp_out_update_frame in Hback by(apply mp_addr_pop_excludes;assumption).
 exact Hback.
Qed.
