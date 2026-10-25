From Coq Require Import ZArith Bool List Lia.
From DwChw Require Export MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint dw_ptr_pop(P:DwPtrMap)(p:Z):DwPtrMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::dw_ptr_pop rest p end.
Lemma dw_ptr_data_pop:forall P p,dw_ptr_present P p->
 dw_ptr_data P --||--(p # Ptr |->dw_ptr_get P p)**dw_ptr_data(dw_ptr_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold dw_ptr_present in H;contradiction.
 - unfold dw_ptr_present in H;cbn[dw_ptr_get]in H.
   cbn[dw_ptr_data dw_ptr_pop dw_ptr_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:dw_ptr_present P p).
     { unfold dw_ptr_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[dw_ptr_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions dw_ptr_data_pop.

Fixpoint dw_pop(P:DwROMap)(p:Z):DwROMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::dw_pop rest p end.
Lemma dw_data_pop:forall P p,dw_present P p->
 dw_data P --||--(p # Float |->dw_get P p)**dw_data(dw_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold dw_present in H;contradiction.
 - unfold dw_present in H;cbn[dw_get]in H.
   cbn[dw_data dw_pop dw_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:dw_present P p).
     { unfold dw_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[dw_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions dw_data_pop.
