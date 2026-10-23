From Coq Require Export ZArith Lia Psatz.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qs8Lrelu Require Export ScalarFacts scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qcv_numbers := idtac.
Ltac qcv_divfacts :=
 repeat match goal with
 | |- context [Z.div ?a ?d] =>
   let q:=fresh "quotient" in let E:=fresh "quotient_eq" in
   pose proof (Z.div_mod a d ltac:(lia));
   pose proof (Z.mod_pos_bound a d ltac:(lia));
   remember (a/d) as q eqn:E in *
 end.
Ltac qcv_finish := qcv_numbers; try (repeat rewrite Z.quot_div_nonneg in * by lia); try qcv_divfacts; try congruence; try lia; try ring; try nia.
