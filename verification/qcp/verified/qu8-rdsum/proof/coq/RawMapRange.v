From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export LoopResourceFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* Syntax-head search only; existing SL keep lemmas retain the entire P. *)
Ltac rd_raw_head t := lazymatch t with ?f ?x=>rd_raw_head f|_=>t end.
Ltac rd_raw_check_mem P :=
 let hd:=rd_raw_head P in let hm:=rd_raw_head constr:(rd_mem)in
 first[constr_eq hd hm
 |let hs:=rd_raw_head constr:(sepcon)in constr_eq hd hs;
  lazymatch P with ?op ?A ?B=>first[rd_raw_check_mem A|rd_raw_check_mem B]end].
Ltac rd_raw_range_path R :=
 lazymatch goal with |-?P|--_=>
 let hd:=rd_raw_head P in let hm:=rd_raw_head constr:(rd_mem)in
 tryif constr_eq hd hm then apply rd_inner_mem_range_keep else
 let hs:=rd_raw_head constr:(sepcon)in constr_eq hd hs;
 lazymatch P with ?op ?A ?B=>
 tryif rd_raw_check_mem A then
  (apply(rd_inner_pure_keep_left R A B);rd_raw_range_path R)
 else(apply(rd_inner_pure_keep_right R A B);rd_raw_range_path R)
 end end.
Ltac rd_raw_capture_ranges name :=
 lazymatch goal with |-?P|--?Q=>
 match P with context[rd_mem ?Map]=>
 let R:=constr:(forall p,rd_present Map p ->0<=rd_get Map p<=255)in
 eapply(derivable1_trans P(“R” && P)Q);
 [rd_raw_range_path R|Intros_p name]
 end end.
