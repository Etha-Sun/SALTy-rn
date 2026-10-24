From Coq Require Import ZArith Lia.
From SimpleC.SL Require Export SeparationLogic.
From Qd8Cast Require Import IntegerFold.
Local Open Scope Z_scope.
Definition signed32_view (bits:Z) := signed_last_nbits bits 32.
Lemma signed32_view_range : forall bits,
 0<=bits<=4294967295 -> -2147483648<=signed32_view bits<=2147483647.
Proof.
 intros bits Hbits;unfold signed32_view,signed_last_nbits.
 change (let v:=Z.modulo bits 4294967296 in
  -2147483648 <= (if Z_lt_dec v 2147483648 then v else v-4294967296) <=2147483647).
 rewrite Z.mod_small by lia;cbn zeta;destruct(Z_lt_dec bits 2147483648);lia.
Qed.
Lemma signed32_view_matches_fold : forall bits,
 0<=bits<=4294967295 -> signed32_view bits=IntegerFold.signed32 bits.
Proof.
 intros bits Hbits;unfold signed32_view,signed_last_nbits,IntegerFold.signed32,IntegerFold.modulus.
 change ((if Z_lt_dec (Z.modulo bits 4294967296) 2147483648 then Z.modulo bits 4294967296 else Z.modulo bits 4294967296-4294967296)=
  (if bits <? 2147483648 then bits else bits-4294967296)).
 rewrite Z.mod_small by lia.
 destruct(Z_lt_dec bits 2147483648);destruct(bits <? 2147483648)eqn:E;auto;
 [apply Z.ltb_ge in E|apply Z.ltb_lt in E];lia.
Qed.
Lemma signed32_view_low : forall bits,
 0<=bits<=2147483647 -> signed32_view bits=bits.
Proof.
 intros;rewrite signed32_view_matches_fold by lia.
 unfold IntegerFold.signed32;destruct(bits <? 2147483648)eqn:E;auto.
 apply Z.ltb_ge in E;lia.
Qed.
Lemma signed32_view_high : forall bits,
 2147483648<=bits<=4294967295 -> signed32_view bits=bits-4294967296.
Proof.
 intros;rewrite signed32_view_matches_fold by lia.
 unfold IntegerFold.signed32,IntegerFold.modulus.
 destruct(bits <? 2147483648)eqn:E;auto;apply Z.ltb_lt in E;lia.
Qed.
Lemma erased_cast_witness_false :
 ~ (forall bits, 0<=bits<=4294967295 -> bits=signed32_view bits).
Proof.
 intro H;specialize(H 4294967295 ltac:(lia)).
 rewrite signed32_view_high in H by lia;lia.
Qed.
Lemma signed32_view_after_dot : forall acc terms,
 signed32_view (IntegerFold.wrap32 (IntegerFold.dot32 acc terms))=
 IntegerFold.signed32 (IntegerFold.wrap32 (acc+IntegerFold.sum_products terms)).
Proof.
 intros;rewrite signed32_view_matches_fold by
  (pose proof(IntegerFold.wrap32_range(IntegerFold.dot32 acc terms));unfold IntegerFold.modulus in *;lia).
 rewrite IntegerFold.dot32_as_single_mod;reflexivity.
Qed.
Print Assumptions signed32_view_matches_fold.
Print Assumptions signed32_view_after_dot.
Print Assumptions erased_cast_witness_false.
