From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export RvvFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma rd_inner_pure_keep_left : forall (R:Prop)(P Q:Assertion),
 (P |-- “R” && P) -> P ** Q |-- “R” && (P ** Q).
Proof.
 intros R P Q H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - entailer!.
Qed.
Lemma rd_inner_pure_keep_right : forall (R:Prop)(P Q:Assertion),
 (Q |-- “R” && Q) -> P ** Q |-- “R” && (P ** Q).
Proof.
 intros R P Q H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[apply derivable1_refl|exact H].
 - entailer!.
Qed.
Lemma rd_inner_mem_address_keep : forall Map,
 rd_mem Map |--
 “forall p,rd_present Map p ->0<=p<=18446744073709551615” && rd_mem Map.
Proof.
 intros;apply _derivable1_andp_intros;
 [apply rd_mem_addresses|apply derivable1_refl].
Qed.

(* Follow only the spatial path to rd_mem; retain the entire original frame. *)
Ltac rd_inner_address_path :=
 lazymatch goal with |-?P|--_=>
 lazymatch P with
 |rd_mem ?Map=>apply rd_inner_mem_address_keep
 |?A ** ?B=>first[eapply rd_inner_pure_keep_left;rd_inner_address_path
                 |eapply rd_inner_pure_keep_right;rd_inner_address_path]
 end end.
Ltac rd_inner_capture_addresses name :=
 lazymatch goal with |-?P|--?Q=>
 lazymatch P with context[rd_mem ?Map]=>
 let Facts:=constr:(forall p,rd_present Map p ->0<=p<=18446744073709551615)in
 eapply(derivable1_trans P(“Facts” && P)Q);
 [rd_inner_address_path|Intros_p name]
 end end.

Lemma rd_inner_mem_range_keep : forall Map,
 rd_mem Map |--
 “forall p,rd_present Map p ->0<=rd_get Map p<=255” && rd_mem Map.
Proof.
 intros Map;apply _derivable1_andp_intros;
 [apply rd_mem_range|apply derivable1_refl].
Qed.
Ltac rd_inner_range_path :=
 lazymatch goal with |-?P|--_=>
 lazymatch P with
 |rd_mem ?Map=>apply rd_inner_mem_range_keep
 |?A ** ?B=>first[eapply rd_inner_pure_keep_left;rd_inner_range_path
                 |eapply rd_inner_pure_keep_right;rd_inner_range_path]
 end end.
Ltac rd_inner_capture_ranges name :=
 lazymatch goal with |-?P|--?Q=>
 lazymatch P with context[rd_mem ?Map]=>
 let Facts:=constr:(forall p,rd_present Map p ->0<=rd_get Map p<=255)in
 eapply(derivable1_trans P(“Facts” && P)Q);
 [rd_inner_range_path|Intros_p name]
 end end.

Print Assumptions rd_inner_pure_keep_left.
Print Assumptions rd_inner_pure_keep_right.
Print Assumptions rd_inner_mem_address_keep.
Print Assumptions rd_inner_mem_range_keep.

Ltac rd_mem_facts_owned :=
 let HA:=fresh "HMapAddress"in rd_inner_capture_addresses HA;
 let HR:=fresh "HMapRange"in rd_inner_capture_ranges HR.
