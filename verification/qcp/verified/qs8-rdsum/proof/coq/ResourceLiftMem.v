From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_only_mem_facts :=
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with H:sepcon ?P ?Q ?h |- _ =>
  let h1:=fresh "subheap"in let h2:=fresh "subheap"in let HJ:=fresh "HJoin"in
  let HP:=fresh "HOwned"in let HQ:=fresh "HOwned"in destruct H as[h1[h2[HJ[HP HQ]]]]
 end;
 match goal with HM:rd_mem ?M ?h |- _=>
 split;intros q Hpresent;
 [exact(rd_mem_addresses M h HM q Hpresent)|exact(rd_mem_range M h HM q Hpresent)]
 end.
Ltac rd_mem_facts_owned :=
 lazymatch goal with |- ?P |-- ?Q =>
 match P with context[rd_mem ?M]=>
 let Facts:=constr:((forall q,rd_present M q ->0<=q<=18446744073709551615) /\
 (forall q,rd_present M q ->-128<=rd_get M q<=127))in
 let HLift:=fresh "HMapLift"in assert(HLift:P |-- “Facts”)by(rd_only_mem_facts);
 eapply(derivable1_trans P(“Facts” && P)Q);
 [apply _derivable1_andp_intros;[exact HLift|apply derivable1_refl]|
 let HF:=fresh "HMapFacts"in Intros_p HF;let HA:=fresh "HMapAddress"in let HR:=fresh "HMapRange"in destruct HF as[HA HR]]
 end end.
Lemma rd_mem_facts_same_frame : forall M(P Q:Assertion),
 P ** rd_mem M ** Q |--
 “forall q,rd_present M q ->0<=q<=18446744073709551615” && (P ** rd_mem M ** Q).
Proof. intros;rd_mem_facts_owned;apply _derivable1_andp_intros;[unfold derivable1,coq_prop;auto|apply derivable1_refl]. Qed.
Print Assumptions rd_mem_facts_same_frame.
