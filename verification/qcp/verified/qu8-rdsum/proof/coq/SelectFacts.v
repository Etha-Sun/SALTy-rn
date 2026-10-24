From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export JoinModel NeonInitFacts.
Local Open Scope Z_scope.
Lemma rd_select_live : forall cb lane normal zero,lane<cb ->rd_select_ptr cb lane normal zero=normal.
Proof. intros;unfold rd_select_ptr;destruct(Z.ltb_spec lane cb);[reflexivity|lia]. Qed.
Lemma rd_select_zero : forall cb lane normal zero,cb<=lane ->rd_select_ptr cb lane normal zero=zero.
Proof. intros;unfold rd_select_ptr;destruct(Z.ltb_spec lane cb);[lia|reflexivity]. Qed.
Print Assumptions rd_select_live.
Print Assumptions rd_select_zero.
