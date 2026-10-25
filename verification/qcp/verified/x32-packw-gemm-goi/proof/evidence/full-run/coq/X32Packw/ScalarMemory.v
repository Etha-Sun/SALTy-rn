From Coq Require Import ZArith List Lia.
From X32Packw Require Export OutputMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Definition pw_map_nodup(F:PWMap):Prop:=NoDup F.
Definition pw_pair_eq_dec:=prod_eq_dec Z.eq_dec Z.eq_dec.
Definition pw_data_rest(F:PWMap)(p:Z):Assertion:=
 pw_data(remove pw_pair_eq_dec(p,pw_get F p)F).
Lemma pw_data_pop:forall F p,
 NoDup F->pw_present F p->
 pw_data F --||-- p#UInt|->pw_get F p **pw_data_rest F p.
Proof.
 induction F as[|[q x] F IH];intros p Hnd Hin;[unfold pw_present in Hin;contradiction|].
 inversion Hnd as[|a rest Hnot Htail];subst a rest.
 unfold pw_present in Hin;cbn[pw_get]in *.
 destruct(Z.eqb_spec p q)as[E|E].
 - subst p;unfold pw_data_rest;cbn[pw_get];rewrite Z.eqb_refl.
   cbn[remove pw_data];destruct(pw_pair_eq_dec(q,x)(q,x))as[Heq|Hneq];[|contradiction].
   rewrite notin_remove by exact Hnot;split;entailer!.
 - unfold pw_data_rest;cbn[pw_get];destruct(Z.eqb_spec p q);[contradiction|].
   cbn[remove];destruct(pw_pair_eq_dec(p,pw_get F p)(q,x))as[Heq|Hneq];[inversion Heq;contradiction|].
   assert(Hpresent:pw_present F p).
   { unfold pw_present;destruct Hin as[Heq|Hin];[inversion Heq;congruence|exact Hin]. }
   destruct(IH p Htail Hpresent)as[Hforward Hback];unfold pw_data_rest in Hforward,Hback;cbn[pw_data];split.
   + sep_apply Hforward;entailer!.
   + sep_apply Hback;entailer!.
Qed.
Definition pw_output_rest(W:list Z)(O:PWOutput)(p:Z):Assertion:=
 pw_output(remove Z.eq_dec p W)O.
Lemma pw_output_loan:forall W O p,
 NoDup W->In p W->
 pw_output W O --||--pw_output_cell p(O p)**pw_output_rest W O p.
Proof. intros;apply pw_cells_pop;assumption. Qed.
Print Assumptions pw_data_pop.
Print Assumptions pw_output_loan.
