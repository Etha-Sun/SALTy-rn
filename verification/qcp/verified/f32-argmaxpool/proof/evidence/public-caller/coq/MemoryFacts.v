From Coq Require Import ZArith Bool List Lia.
From ArgmaxPool Require Export ProgramModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint ap_ptr_pop(P:APPtrMap)(p:Z):APPtrMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::ap_ptr_pop rest p end.
Lemma ap_ptr_data_pop:forall P p,ap_ptr_present P p->
 ap_ptr_data P --||--(p # Ptr |->ap_ptr_get P p)**ap_ptr_data(ap_ptr_pop P p).
Proof.
 induction P as[|[q v]P IH];intros p H.
 - unfold ap_ptr_present in H;contradiction.
 - unfold ap_ptr_present in H;cbn[ap_ptr_get]in H.
   cbn[ap_ptr_data ap_ptr_pop ap_ptr_get].
   destruct(Z.eqb_spec p q)as[Heq|Hneq].
   + subst p;split;entailer!.
   + assert(Hin:ap_ptr_present P p).
     { unfold ap_ptr_present. destruct H as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
     specialize(IH p Hin);destruct IH as[Hforward Hback].
     cbn[ap_ptr_data].
     split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Print Assumptions ap_ptr_data_pop.
