From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export CallerOrigin.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* The lift adds only a logical consequence.  Both claims are proved on the
   original whole assertion by inspecting the subheap owned by rd_mem. *)
Ltac rd_map_ranges_owned :=
 lazymatch goal with |- ?P |-- ?Q =>
 match P with context[rd_mem ?M]=>
 let Facts:=constr:((forall q,rd_present M q ->0<=q<=18446744073709551615) /\
 (forall q,rd_present M q ->-128<=rd_get M q<=127))in
 let HLift:=fresh "HMapLift"in
 assert(HLift:P |-- “Facts”)by(rd_pure_resources;auto);
 eapply(derivable1_trans P(“Facts” && P)Q);
 [apply _derivable1_andp_intros;[exact HLift|apply derivable1_refl]|
 let HF:=fresh "HMapFacts"in Intros_p HF;let HA:=fresh "HMapAddress"in let HR:=fresh "HMapRange"in destruct HF as[HA HR]]
 end end.
