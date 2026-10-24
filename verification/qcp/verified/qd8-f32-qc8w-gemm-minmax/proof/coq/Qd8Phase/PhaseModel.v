From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qd8Phase Require Import IntegerFold.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition ptr_modulus:Z:=18446744073709551616.
Definition zget(i:Z)(xs:list Z):Z:=Znth i xs 0.
Definition step_bits(vl lane acc va vb:Z):Z:=
 if lane <? vl then IntegerFold.mac32 acc va vb else acc.
Definition init_lane(vl lane ks zp:Z):Z:=
 if lane <? vl then IntegerFold.wrap32(ks*zp) else 0.
Fixpoint lane_acc_nat(n:nat)(ks zp lane:Z)(av wv:list Z):Z:=
 match n with O=>IntegerFold.wrap32(ks*zp)
 |S n=>IntegerFold.mac32(lane_acc_nat n ks zp lane av wv)
       (zget(Z.of_nat n) av)(zget(8*Z.of_nat n+lane) wv) end.
Definition lane_acc(d ks zp lane:Z)(av wv:list Z):Z:=
 lane_acc_nat (Z.to_nat d) ks zp lane av wv.
Definition lane_value(vl d ks zp lane:Z)(av wv:list Z):Z:=
 if lane <? vl then lane_acc d ks zp lane av wv else 0.
Lemma lane_value_zero:forall vl ks zp lane av wv,
 lane_value vl 0 ks zp lane av wv=init_lane vl lane ks zp.
Proof. reflexivity. Qed.
Lemma lane_value_step:forall vl d ks zp lane av wv,
 0<=d -> step_bits vl lane (lane_value vl d ks zp lane av wv)
 (zget d av)(zget(8*d+lane) wv)=lane_value vl (d+1) ks zp lane av wv.
Proof.
 intros;unfold step_bits,lane_value;destruct(lane <? vl);[|reflexivity].
 unfold lane_acc;rewrite Z2Nat.inj_add by lia;cbn.
 rewrite Nat.add_1_r;cbn;rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma lane_acc_nat_range:forall n ks zp lane av wv,
 0<=lane_acc_nat n ks zp lane av wv<=4294967295.
Proof.
 intros;destruct n.
 - change(0<=IntegerFold.wrap32(ks*zp)<=4294967295).
   pose proof(IntegerFold.wrap32_range(ks*zp));unfold IntegerFold.modulus in *;lia.
 - change(0<=IntegerFold.wrap32(lane_acc_nat n ks zp lane av wv+zget(Z.of_nat n) av*zget(8*Z.of_nat n+lane) wv)<=4294967295).
   pose proof(IntegerFold.wrap32_range(lane_acc_nat n ks zp lane av wv+zget(Z.of_nat n) av*zget(8*Z.of_nat n+lane) wv));unfold IntegerFold.modulus in *;lia.
Qed.
Lemma lane_value_range:forall vl d ks zp lane av wv,
 0<=lane_value vl d ks zp lane av wv<=4294967295.
Proof.
 intros;unfold lane_value,lane_acc;destruct(lane <? vl);[apply lane_acc_nat_range|lia].
Qed.
Lemma init_lane_range:forall vl lane ks zp,
 0<=init_lane vl lane ks zp<=4294967295.
Proof. intros;rewrite <-(@lane_value_zero vl ks zp lane nil nil);apply lane_value_range. Qed.
Print Assumptions lane_value_step.

Fixpoint lane_sum_nat(n:nat)(lane:Z)(av wv:list Z):Z:=
 match n with O=>0 |S n=>lane_sum_nat n lane av wv+
 zget(Z.of_nat n) av*zget(8*Z.of_nat n+lane) wv end.
Lemma lane_acc_sum:forall n ks zp lane av wv,
 lane_acc_nat n ks zp lane av wv=
 IntegerFold.wrap32(ks*zp+lane_sum_nat n lane av wv).
Proof.
 induction n;intros.
 - cbn [lane_acc_nat lane_sum_nat];rewrite Z.add_0_r;reflexivity.
 - cbn [lane_acc_nat lane_sum_nat];rewrite IHn.
   unfold IntegerFold.mac32,IntegerFold.wrap32.
   rewrite Z.add_mod_idemp_l by(unfold IntegerFold.modulus;lia).
   f_equal;ring.
Qed.
Lemma lane_value_active_sum:forall vl d ks zp lane av wv,
 lane<vl -> lane_value vl d ks zp lane av wv=
 IntegerFold.wrap32(ks*zp+lane_sum_nat(Z.to_nat d) lane av wv).
Proof.
 intros;unfold lane_value;assert((lane <? vl)=true) by(apply Z.ltb_lt;assumption);rewrite H0;apply lane_acc_sum.
Qed.
Print Assumptions lane_acc_sum.
Print Assumptions lane_value_active_sum.

Lemma init_lane_step:forall vl lane ks zp av wv,
 step_bits vl lane (init_lane vl lane ks zp) (zget 0 av)(zget lane wv)=
 lane_value vl 1 ks zp lane av wv.
Proof.
 intros;pose proof(lane_value_step vl 0 ks zp lane av wv ltac:(lia)) as H.
 rewrite lane_value_zero in H;cbn in H;exact H.
Qed.
Lemma phase_char_range:forall p v,
 store_char p v |-- “ -128<=v<=127 ”.
Proof.
 intros;prop_apply(valid_store_char p v);Intros.
 change Byte.min_signed with(-128) in *;change Byte.max_signed with 127 in *;entailer!.
Qed.
