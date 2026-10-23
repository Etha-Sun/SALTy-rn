From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Export PrefixFacts.
From Qu8Rsum Require Import MemoryModel VectorFacts.
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
Lemma rs_masked_u8 : forall x r i,
 0<=x<=255 -> 1<=r<16 -> 0<=i<16 ->
 rs_mul_u8 x (Znth(16-r+i)rs_onemask 0)=if Z.ltb i r then x else 0.
Proof.
 intros x r i Hx Hr Hi;rewrite rs_onemask_lane by assumption.
 destruct(Z.ltb i r);unfold rs_mul_u8.
 - replace (x*1)with x by ring;apply unsigned_last_nbits_eq;cbn;lia.
 - replace (x*0)with 0 by ring;reflexivity.
Qed.
Lemma rs_pair_u8_plain : forall a x y,
 0<=a+x+y<=65535 -> rs_pair_u8 a x y=a+x+y.
Proof. intros;unfold rs_pair_u8,rs_u16;apply unsigned_last_nbits_eq;cbn;lia. Qed.
Lemma rs_pair_u8_step_bound : forall a x y k,
 0<=k<128 -> 0<=a<=510*k -> 0<=x<=255 -> 0<=y<=255 ->
 rs_pair_u8 a x y=a+x+y /\
 0<=rs_pair_u8 a x y<=510*(k+1).
Proof. intros;rewrite rs_pair_u8_plain by nia;split;[reflexivity|nia]. Qed.
Lemma rs_pair_u16_wrap : forall a x y,
 0<=a<=4294967295 -> 0<=x<=65535 -> 0<=y<=65535 ->
 rs_pair_u16 a x y=rs_u32(a+x+y).
Proof. intros;unfold rs_pair_u16;rewrite rs_add_u32_wrap by lia;f_equal;lia. Qed.
Print Assumptions rs_onemask_lane.
Print Assumptions rs_masked_u8.
Print Assumptions rs_pair_u8_plain.
Print Assumptions rs_pair_u8_step_bound.
Print Assumptions rs_pair_u16_wrap.
