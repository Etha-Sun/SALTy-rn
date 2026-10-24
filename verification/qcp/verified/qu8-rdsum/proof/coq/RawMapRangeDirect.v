From Coq Require Import ZArith.
From Qu8Rdsum Require Export RawMapRange.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* The explicitly named universally quantified Map avoids higher-order
   context matching against unrelated typed cells. No program precondition. *)
Ltac rd_capture_ranges_for Map name :=
 lazymatch goal with |-?P|--?Q=>
 let R:=constr:(forall p,rd_present Map p ->0<=rd_get Map p<=255)in
 eapply(derivable1_trans P(“R” && P)Q);
 [rd_raw_range_path R|Intros_p name]
 end.
