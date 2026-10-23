From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Export PrefixFacts.
From Qs8Rsum Require Import MemoryModel VectorFacts.
Import ListNotations.
Local Open Scope Z_scope.
Definition rs_onemask : list Z := repeat 1 16++repeat 0 16.
Lemma rs_onemask_lane : forall r i,
 1<=r<16 -> 0<=i<16 ->
 Znth(16-r+i)rs_onemask 0=if Z.ltb i r then 1 else 0.
Proof.
 intros r i Hr Hi;unfold rs_onemask;destruct(Z.ltb_spec i r).
 - rewrite app_Znth1 by (rewrite Zlength_correct,repeat_length;change(0<=16-r+i<16);lia).
   apply Znth_repeat_lt;change(0<=16-r+i<16);lia.
 - rewrite app_Znth2 by (rewrite Zlength_correct,repeat_length;change(16-r+i>=16);lia).
   apply Znth_repeat_lt;rewrite Zlength_correct,repeat_length;change(0<=16-r+i-16<16);lia.
Qed.
Lemma rs_masked_s8 : forall x r i,
 -128<=x<=127 -> 1<=r<16 -> 0<=i<16 ->
 rs_mul_s8 x (Znth(16-r+i)rs_onemask 0)=if Z.ltb i r then x else 0.
Proof.
 intros x r i Hx Hr Hi;rewrite rs_onemask_lane by assumption.
 destruct(Z.ltb i r);unfold rs_mul_s8.
 - replace (x*1)with x by ring;apply signed_last_nbits_eq;cbn;lia.
 - replace (x*0)with 0 by ring;reflexivity.
Qed.
Lemma rs_pair_s8_plain : forall a x y,
 -32768<=a+x+y<=32767 -> rs_pair_s8 a x y=a+x+y.
Proof. intros;unfold rs_pair_s8,rs_s16;apply signed_last_nbits_eq;cbn;lia. Qed.
Lemma rs_pair_s8_step_bound : forall a x y k,
 0<=k<128 -> -256*k<=a<=254*k -> -128<=x<=127 -> -128<=y<=127 ->
 rs_pair_s8 a x y=a+x+y /\
 -256*(k+1)<=rs_pair_s8 a x y<=254*(k+1).
Proof. intros;rewrite rs_pair_s8_plain by nia;split;[reflexivity|nia]. Qed.
Lemma rs_pair_s16_wrap : forall a x y,
 -2147483648<=a<=2147483647 -> -32768<=x<=32767 -> -32768<=y<=32767 ->
 rs_pair_s16 a x y=rs_s32(a+x+y).
Proof. intros;unfold rs_pair_s16;rewrite rs_add_s32_wrap by lia;f_equal;lia. Qed.
Print Assumptions rs_onemask_lane.
Print Assumptions rs_masked_s8.
Print Assumptions rs_pair_s8_plain.
Print Assumptions rs_pair_s8_step_bound.
Print Assumptions rs_pair_s16_wrap.
