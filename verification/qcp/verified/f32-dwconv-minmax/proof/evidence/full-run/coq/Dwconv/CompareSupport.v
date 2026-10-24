From Coq Require Import ZArith Lia.
From Dwconv Require Export KernelRetrySupport PublicModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_compare_value_fact :=
 multimatch goal with
 | H : dw_observed_pair ?A ?B ?p ?q,
   Hx : dw_initialized ?A ?p ?x,
   Hy : dw_initialized ?B ?q ?y |- _ =>
   let Hsame:=fresh "Hsame"in pose proof(dw_observed_pair_values A B p q x y H Hx Hy)as Hsame
 end.
Ltac dw_compare_finish :=
 lazymatch goal with |- _ \/ _=>left|_=>idtac end;
 dw_prepare;try dw_compare_value_fact;dw_address_units;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia]|dw_frame].
