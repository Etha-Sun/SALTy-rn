From Coq Require Import ZArith Lia Bool.
From Qu8Rdsum Require Export LoopResourceFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* Inspect syntax heads only: never unfold a typed cell/array while looking
   for the one rd_mem resource. The existing keep lemmas retain all of P. *)
Ltac rd_raw_head t := lazymatch t with ?f ?x=>rd_raw_head f|_=>t end.
Ltac rd_raw_has_mem P :=
 let h:=rd_raw_head P in let hm:=rd_raw_head constr:(rd_mem)in
 tryif constr_eq h hm then constr:(true)else
 let hs:=rd_raw_head constr:(sepcon)in
 tryif constr_eq h hs then
  lazymatch P with ?op ?A ?B=>
   let left:=rd_raw_has_mem A in lazymatch left with true=>constr:(true)|false=>rd_raw_has_mem B end
  end
 else constr:(false).
Ltac rd_raw_range_path R :=
 lazymatch goal with |-?P|--_=>
 let h:=rd_raw_head P in let hm:=rd_raw_head constr:(rd_mem)in
 tryif constr_eq h hm then apply rd_inner_mem_range_keep else
 let hs:=rd_raw_head constr:(sepcon)in constr_eq h hs;
 lazymatch P with ?op ?A ?B=>
 let found:=rd_raw_has_mem A in
 lazymatch found with
 |true=>apply(rd_inner_pure_keep_left R A B);rd_raw_range_path R
 |false=>apply(rd_inner_pure_keep_right R A B);rd_raw_range_path R
 end end end.
Ltac rd_raw_capture_ranges name :=
 lazymatch goal with |-?P|--?Q=>
 match P with context[rd_mem ?Map]=>
 let R:=constr:(forall p,rd_present Map p ->0<=rd_get Map p<=255)in
 eapply(derivable1_trans P(“R” && P)Q);
 [rd_raw_range_path R|Intros_p name]
 end end.
