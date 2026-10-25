From Coq Require Import ZArith Bool List Lia.
From MaxPool Require Import MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma mp_ptr_data_pop:forall P p,mp_ptr_present P p->
 mp_ptr_data P --||--(p # Ptr |->mp_ptr_get P p)**mp_ptr_data(mp_ptr_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold mp_ptr_present in H;contradiction.
 - unfold mp_ptr_present in H;cbn[mp_ptr_get]in H.
   cbn[mp_ptr_data mp_ptr_pop mp_ptr_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:mp_ptr_present P p).
     { unfold mp_ptr_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma mp_window_index:forall F p count j,
 mp_window F p count->0<=j<count->mp_present F(p+4*j).
Proof. unfold mp_window;intros F p count j[? [? H]]Hj;apply H;assumption. Qed.
Lemma mp_ptr_window_index:forall P p count j,
 mp_ptr_window P p count->0<=j<count->mp_ptr_present P(p+8*j).
Proof. unfold mp_ptr_window;intros P p count j[? [? H]]Hj;apply H;assumption. Qed.
