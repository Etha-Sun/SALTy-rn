From Coq Require Import ZArith Bool List Lia.
From ExpMinusMax Require Export MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint em_pop(P:EMMap)(p:Z):EMMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::em_pop rest p end.
Lemma em_data_pop:forall P p,em_present P p->
 em_data P --||--(p # Float |->em_get P p)**em_data(em_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold em_present in H;contradiction.
 - unfold em_present in H;cbn[em_get]in H.
   cbn[em_data em_pop em_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:em_present P p).
     { unfold em_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[em_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions em_data_pop.
