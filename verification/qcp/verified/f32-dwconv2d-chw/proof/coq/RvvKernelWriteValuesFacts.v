From Coq Require Import ZArith List Lia.
From DwChw Require Import OutputInterface.
Import ListNotations. Local Open Scope Z_scope.

Lemma dw_write_values_frame:forall xs O p q,
 (forall n,(n<length xs)%nat->q<>p+4*Z.of_nat n)->
 dw_write_values O p xs q=O q.
Proof.
 induction xs as[|v xs IH];intros O p q Haway;cbn[dw_write_values];[reflexivity|].
 rewrite IH.
 - unfold dw_output_put,dw_put.
   destruct(Z.eqb_spec q p);[specialize(Haway 0%nat ltac:(cbn;lia));cbn in Haway;lia|reflexivity].
 - intros n Hn Eq;apply(Haway(S n)ltac:(cbn;lia)).
   rewrite Nat2Z.inj_succ;lia.
Qed.

Lemma dw_write_values_nth:forall xs O p n,
 (n<length xs)%nat->
 dw_write_values O p xs(p+4*Z.of_nat n)=Some(nth n xs fp32_zero).
Proof.
 induction xs as[|v xs IH];intros O p n Hn;[cbn in Hn;lia|].
 destruct n as[|n].
 - cbn[dw_write_values nth].
   rewrite dw_write_values_frame.
   + replace(p+4*Z.of_nat 0)with p by lia.
     unfold dw_output_put,dw_put;rewrite Z.eqb_refl;reflexivity.
   + intros k Hk Eq;lia.
 - cbn[dw_write_values nth].
   replace(p+4*Z.of_nat(S n))with((p+4)+4*Z.of_nat n)by(rewrite Nat2Z.inj_succ;lia).
   apply IH;cbn in Hn;lia.
Qed.

Print Assumptions dw_write_values_frame.
Print Assumptions dw_write_values_nth.
