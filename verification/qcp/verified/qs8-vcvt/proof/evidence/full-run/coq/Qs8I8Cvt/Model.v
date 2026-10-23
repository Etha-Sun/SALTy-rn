From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition qcv_s16 (x:Z):Z := signed_last_nbits x 16.
Definition qcv_seed (m:Z):Z := signed_last_nbits (unsigned_last_nbits (0-unsigned_last_nbits m 32) 32) 16.
Definition qcv_subw (z x:Z):Z := qcv_s16(z-x).
Definition qcv_asr15 (x:Z):Z := Z.shiftr x 15.
Definition qcv_asr16 (x:Z):Z := Z.shiftr x 16.
Definition qcv_shl7 (a:Z):Z := qcv_s16(a*128).
Definition qcv_sat16 (x:Z):Z := if x <? -32768 then -32768 else if 32767 <? x then 32767 else x.
Definition qcv_sat8 (x:Z):Z := if x <? -128 then -128 else if 127 <? x then 127 else x.
Definition qcv_neon_qrdmulh (a b:Z):Z := qcv_sat16 (Z.shiftr (2*a*b+32768) 16).
Definition qcv_rvv_mul (a b:Z):Z := a*b.
Definition qcv_rvv_rnu15 (p:Z):Z := Z.shiftr p 15 + Z.land (Z.shiftr p 14) 1.
Definition qcv_rvv_clip15 (p:Z):Z := qcv_sat16(qcv_rvv_rnu15 p).
Definition qcv_neon_add (a b:Z):Z := qcv_sat16(a+b).
Definition qcv_rvv_add (a b:Z):Z := qcv_sat16(a+b).
Definition qcv_neon_lane (x z m o:Z):Z := qcv_sat8(qcv_neon_add(qcv_neon_qrdmulh(qcv_shl7(qcv_subw z x))(qcv_seed m))o).
Definition qcv_rvv_lane (x z m o:Z):Z := qcv_sat8(qcv_rvv_add(qcv_rvv_clip15(qcv_rvv_mul(qcv_shl7(qcv_s16(z-x)))(qcv_seed m)))o).
Definition qcv_values (n z m o:Z)(A:list Z):list Z := map(fun x=>qcv_neon_lane x z m o)(firstn(Z.to_nat n)A).
Lemma qcv_s16_range : forall x,-32768<=qcv_s16 x<=32767.
Proof.
 intro x;unfold qcv_s16,signed_last_nbits.
 change(-32768<=(let u:=x mod 65536 in if zlt u 32768 then u else u-65536)<=32767).
 pose proof(Z.mod_pos_bound x 65536 ltac:(lia));cbv zeta;destruct(zlt(x mod 65536)32768);lia.
Qed.
Lemma qcv_s16_id : forall x,-32768<=x<=32767 -> qcv_s16 x=x.
Proof. intros;unfold qcv_s16;apply signed_last_nbits_eq;[lia|];change(-32768<=x<32768);lia. Qed.
Lemma qcv_seed_equiv : forall m,qcv_seed m=qcv_s16(-m).
Proof.
 intro;unfold qcv_seed,qcv_s16.
 rewrite signed_unsigned_revolutive_less by lia.
 rewrite <-(signed_unsigned_sub_r 0(unsigned_last_nbits m 32)16 ltac:(lia)).
 rewrite unsigned_revolutive_less by lia.
 rewrite signed_unsigned_sub_r by lia;reflexivity.
Qed.
Lemma qcv_sat16_range : forall x,-32768<=qcv_sat16 x<=32767.
Proof. intro;unfold qcv_sat16;destruct(Z.ltb_spec x (-32768));[lia|];destruct(Z.ltb_spec 32767 x);lia. Qed.
Lemma qcv_sat8_range : forall x,-128<=qcv_sat8 x<=127.
Proof. intro;unfold qcv_sat8;destruct(Z.ltb_spec x (-128));[lia|];destruct(Z.ltb_spec 127 x);lia. Qed.
Lemma qcv_neon_round : forall p,Z.shiftr(2*p+32768)16=(p+16384)/32768.
Proof.
 intro. rewrite Z.shiftr_div_pow2 by lia;change((2*p+32768)/65536=(p+16384)/32768).
 replace (2*p+32768) with (2*(p+16384)) by ring.
 replace 65536 with (2*32768) by reflexivity.
 symmetry;apply Z.div_unique with(r:=2*((p+16384) mod 32768)).
 - left;pose proof(Z.mod_pos_bound (p+16384) 32768 ltac:(lia));lia.
 - pose proof(Z.div_mod (p+16384) 32768 ltac:(lia));lia.
Qed.
Lemma qcv_rvv_round : forall p,qcv_rvv_rnu15 p=(p+16384)/32768.
Proof.
 intro p. unfold qcv_rvv_rnu15.
 rewrite !Z.shiftr_div_pow2 by lia.
 replace 1 with (Z.ones 1) at 1 by reflexivity.
 rewrite Z.land_ones by lia.
 change(p/32768 + (p/16384) mod 2 = (p+16384)/32768).
 pose proof(Z.div_mod p 16384 ltac:(lia)) as Hp.
 pose proof(Z.mod_pos_bound p 16384 ltac:(lia)) as Hr.
 pose proof(Z.div_mod (p/16384) 2 ltac:(lia)) as Hk.
 pose proof(Z.mod_pos_bound (p/16384) 2 ltac:(lia)) as Hb.
 assert(Hu:p/32768=(p/16384)/2).
 { symmetry;apply Z.div_unique with(r:=16384*((p/16384) mod 2)+p mod 16384);[left;lia|lia]. }
 rewrite Hu.
 apply Z.div_unique with(r:=p mod 16384+16384*(1-(p/16384)mod 2));[left;lia|lia].
Qed.
Lemma qcv_qrdmulh_equiv : forall a b,qcv_neon_qrdmulh a b=qcv_rvv_clip15(qcv_rvv_mul a b).
Proof. intros;unfold qcv_neon_qrdmulh,qcv_rvv_clip15,qcv_rvv_mul. replace (2*a*b+32768) with (2*(a*b)+32768) by ring. rewrite qcv_rvv_round,qcv_neon_round;reflexivity. Qed.
Lemma qcv_lane_equiv : forall x z m o,qcv_neon_lane x z m o=qcv_rvv_lane x z m o.
Proof. intros;unfold qcv_neon_lane,qcv_rvv_lane,qcv_subw,qcv_neon_add,qcv_rvv_add;rewrite qcv_qrdmulh_equiv;reflexivity. Qed.
