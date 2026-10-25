From Coq Require Import ZArith Lia.
From Qs8Mul Require Export NeonCallStoreTailFacts.
Import Snaive_C_Rules64.
Local Open Scope sac.

(* Preserve every surrounding heap assertion structurally.  This avoids
   generic SepApply search reducing the large unrelated floating expressions. *)
Ltac qm_store_prefix_path split_rule:=
 lazymatch goal with|-?P|--_=>lazymatch P with
 |CharArray.undef_full ?p ?n=>apply(split_rule p n);lia
 |?A**?B=>first[
   eapply derivable1_sepcon_mono;[qm_store_prefix_path split_rule|apply derivable1_refl]
  |eapply derivable1_sepcon_mono;[apply derivable1_refl|qm_store_prefix_path split_rule]]
 end end.
Ltac qm_store_fast_split split_rule:=
 lazymatch goal with|-?P|--?Q=>
 eapply(derivable1_trans P _ Q);[qm_store_prefix_path split_rule|]end.
