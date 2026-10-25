From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export ProgramFacts VectorValues.
Import ListNotations.
Local Open Scope Z_scope.
Local Opaque qm_lane qm_neon_lane qm_arm_add qm_arm_mul.
(* The equality observes only the active prefix. Arbitrary inactive fields of
   the original32-element list remain unconstrained. The bounded premise is
   required: no inference from total-function defaults outside the list. *)
Lemma qm_take32_values : forall n L M pa pb az bz scale oz lo hi,
 0<=n<=32 -> length L=32%nat ->
 (forall i,0<=i<n -> nth(Z.to_nat i)L 0=qm_lane M pa pb az bz scale oz lo hi i) ->
 qm_take32 n L=qm_values n M pa pb az bz scale oz lo hi.
Proof.
 intros n L M pa pb az bz scale oz lo hi Hn HL Hactive.
 assert(Hnat:(Z.to_nat n<=32)%nat).
 { change (Z.to_nat n<=Z.to_nat 32)%nat. apply (proj1(Z2Nat.inj_le n 32 ltac:(lia) ltac:(lia)));lia. }
 assert(Hlen:length(qm_take32 n L)=Z.to_nat n).
 { unfold qm_take32;rewrite firstn_length,HL,Nat.min_l by exact Hnat;reflexivity. }
 apply(@List.nth_ext Z _ _ 0 0).
 - rewrite Hlen,qm_values_length;reflexivity.
 - intros i Hi;rewrite Hlen in Hi.
   unfold qm_take32;rewrite List.nth_firstn.
   assert(E:(i<?Z.to_nat n)%nat=true)by(apply Nat.ltb_lt;exact Hi).
   rewrite E.
   assert(Hz:0<=Z.of_nat i<n)by(split;[lia|apply Nat2Z.inj_lt in Hi;rewrite Z2Nat.id in Hi by lia;exact Hi]).
   rewrite <- (Nat2Z.id i) at 1.
   rewrite Hactive by exact Hz.
   symmetry;rewrite <- (Nat2Z.id i) at 1;apply qm_values_nth;exact Hz.
Qed.
Print Assumptions qm_take32_values.
