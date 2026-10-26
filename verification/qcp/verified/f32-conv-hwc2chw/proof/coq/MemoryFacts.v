From Coq Require Import ZArith Bool List Lia.
From HwcConv Require Export MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint hc_ptr_pop(P:HwcPtrMap)(p:Z):HwcPtrMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::hc_ptr_pop rest p end.
Lemma hc_ptr_data_pop:forall P p,hc_ptr_present P p->
 hc_ptr_data P --||--(p # Ptr |->hc_ptr_get P p)**hc_ptr_data(hc_ptr_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold hc_ptr_present in H;contradiction.
 - unfold hc_ptr_present in H;cbn[hc_ptr_get]in H.
   cbn[hc_ptr_data hc_ptr_pop hc_ptr_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:hc_ptr_present P p).
     { unfold hc_ptr_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[hc_ptr_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions hc_ptr_data_pop.

Fixpoint hc_pop(P:HwcROMap)(p:Z):HwcROMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::hc_pop rest p end.
Lemma hc_data_pop:forall P p,hc_present P p->
 hc_data P --||--(p # Float |->hc_get P p)**hc_data(hc_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold hc_present in H;contradiction.
 - unfold hc_present in H;cbn[hc_get]in H.
   cbn[hc_data hc_pop hc_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:hc_present P p).
     { unfold hc_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[hc_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions hc_data_pop.
