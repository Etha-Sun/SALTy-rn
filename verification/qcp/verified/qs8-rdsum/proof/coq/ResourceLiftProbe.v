From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import ResourceLift.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_map_fact_framed : forall M(P Q:Assertion),
 P ** rd_mem M ** Q |--
 “forall q,rd_present M q ->0<=q<=18446744073709551615” && (P ** rd_mem M ** Q).
Proof. intros;rd_map_ranges_owned;entailer!. Qed.
Print Assumptions rd_map_fact_framed.
