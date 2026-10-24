From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition qu_s8(x:Z):Z:=signed_last_nbits x 8.
Definition qu_s16(x:Z):Z:=signed_last_nbits x 16.
Definition qu_s32(x:Z):Z:=signed_last_nbits x 32.
Definition qu_u32(x:Z):Z:=unsigned_last_nbits x 32.
Definition qu_negword(raw:Z):Z:=qu_s32(qu_u32(0-qu_u32 raw)).
Definition qu_ctrl(raw:Z):Z:=qu_s8(qu_u32(0-qu_u32 raw)).
Definition qu_sat16(x:Z):Z:=if x <? -32768 then -32768 else if 32767 <? x then 32767 else x.
Definition qu_sat8(x:Z):Z:=if x <? -128 then -128 else if 127 <? x then 127 else x.
Definition qu_usat8(x:Z):Z:=if x <? 0 then 0 else if 255 <? x then 255 else x.
Definition qu_clamp(x lo hi:Z):Z:=Z.min(Z.max x lo)hi.
Definition qu_pow2(d:Z):Z:=2^d.
Definition qu_floor(x p:Z):Z:=x/p.
(* Signed low-byte count, mathematical shift and final word truncation.
   For signed32 data, ShiftSat does not change these low32 results. *)
Definition qu_neon_shift(x word:Z):Z:=
 let d:=qu_s8 word in qu_s32(if d <? 0 then Z.shiftr(x+2^(-d-1))(-d) else Z.shiftl x d).
Definition qu_mask5(d:Z):Z:=Z.land d 31.
Definition qu_rvv_rnu(x raw:Z):Z:=let d:=qu_mask5 raw in
 qu_s32(if d =? 0 then x else Z.shiftr x d + Z.land(Z.shiftr x(d-1))1).
Definition qu_rvv_sll(x raw:Z):Z:=qu_s32(Z.shiftl x(qu_mask5 raw)).
Definition qu_repaired_shift(x raw:Z):Z:=let d:=qu_ctrl raw in
 if (d <=? -32)||(32 <=? d) then 0 else
 if d <? 0 then qu_rvv_rnu x(-d) else qu_rvv_sll x d.
Definition qu_neon_mul(a b:Z):Z:=qu_s32(a*b).
Definition qu_rvv_mul(a b:Z):Z:=qu_s32(a*b).
Definition qu_neon_mla(a b c:Z):Z:=qu_s32(a+qu_s32(b*c)).
Definition qu_rvv_macc(a b c:Z):Z:=qu_s32(a+b*c).
Definition qu_neon_add16(a b:Z):Z:=qu_sat16(a+b).
Definition qu_rvv_add16(a b:Z):Z:=qu_sat16(a+b).
Lemma qu_s8_range:forall x,-128<=qu_s8 x<=127.
Proof. intros;unfold qu_s8;pose proof(signed_Lastnbits_range x 8 ltac:(lia));change(-128<=signed_last_nbits x 8<128)in H;lia. Qed.
Lemma qu_s16_range:forall x,-32768<=qu_s16 x<=32767.
Proof. intros;unfold qu_s16;pose proof(signed_Lastnbits_range x 16 ltac:(lia));change(-32768<=signed_last_nbits x 16<32768)in H;lia. Qed.
Lemma qu_s32_range:forall x,-2147483648<=qu_s32 x<=2147483647.
Proof. intros;unfold qu_s32;pose proof(signed_Lastnbits_range x 32 ltac:(lia));change(-2147483648<=signed_last_nbits x 32<2147483648)in H;lia. Qed.
Lemma qu_s32_id:forall x,-2147483648<=x<=2147483647->qu_s32 x=x.
Proof. intros;unfold qu_s32;apply signed_last_nbits_eq;[lia|];change(-2147483648<=x<2147483648);lia. Qed.
Lemma qu_s8_id:forall x,-128<=x<=127->qu_s8 x=x.
Proof. intros;unfold qu_s8;apply signed_last_nbits_eq;[lia|];change(-128<=x<128);lia. Qed.
Lemma qu_s16_id:forall x,-32768<=x<=32767->qu_s16 x=x.
Proof. intros;unfold qu_s16;apply signed_last_nbits_eq;[lia|];change(-32768<=x<32768);lia. Qed.
Lemma qu_ctrl_low:forall raw,qu_ctrl raw=qu_s8(-raw).
Proof.
 intros;unfold qu_ctrl,qu_s8,qu_u32;rewrite signed_unsigned_revolutive_less by lia.
 rewrite <-(signed_unsigned_sub_r 0(unsigned_last_nbits raw 32)8 ltac:(lia)).
 rewrite unsigned_revolutive_less by lia;rewrite signed_unsigned_sub_r by lia;reflexivity.
Qed.
Lemma qu_ctrl_neon:forall raw,qu_s8(qu_negword raw)=qu_ctrl raw.
Proof. intros;unfold qu_s8,qu_negword,qu_s32,qu_ctrl;rewrite signed_revolutive_less by lia;reflexivity. Qed.
Lemma qu_ctrl_range:forall raw,-128<=qu_ctrl raw<=127.
Proof. intros;unfold qu_ctrl;apply qu_s8_range. Qed.
Lemma qu_mask5_id:forall d,0<=d<32->qu_mask5 d=d.
Proof.
 intros;unfold qu_mask5;change 31 with(Z.ones 5);rewrite Z.land_ones by lia.
 change(d mod 32=d);apply Z.mod_small;lia.
Qed.
Lemma qu_sat16_range:forall x,-32768<=qu_sat16 x<=32767.
Proof. intros;unfold qu_sat16;destruct(Z.ltb_spec x(-32768));[lia|];destruct(Z.ltb_spec 32767 x);lia. Qed.
Lemma qu_sat8_range:forall x,-128<=qu_sat8 x<=127.
Proof. intros;unfold qu_sat8;destruct(Z.ltb_spec x(-128));[lia|];destruct(Z.ltb_spec 127 x);lia. Qed.
Lemma qu_mla_equiv:forall a b c,qu_neon_mla a b c=qu_rvv_macc a b c.
Proof. intros;unfold qu_neon_mla,qu_rvv_macc,qu_s32;rewrite signed_signed_add_r by lia;reflexivity. Qed.
