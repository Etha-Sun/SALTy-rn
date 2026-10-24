From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition qa_s8(x:Z):Z:=signed_last_nbits x 8.
Definition qa_s16(x:Z):Z:=signed_last_nbits x 16.
Definition qa_s32(x:Z):Z:=signed_last_nbits x 32.
Definition qa_u32(x:Z):Z:=unsigned_last_nbits x 32.
Definition qa_negword(raw:Z):Z:=qa_s32(qa_u32(0-qa_u32 raw)).
Definition qa_ctrl(raw:Z):Z:=qa_s8(qa_u32(0-qa_u32 raw)).
Definition qa_sat16(x:Z):Z:=if x <? -32768 then -32768 else if 32767 <? x then 32767 else x.
Definition qa_sat8(x:Z):Z:=if x <? -128 then -128 else if 127 <? x then 127 else x.
Definition qa_usat8(x:Z):Z:=if x <? 0 then 0 else if 255 <? x then 255 else x.
Definition qa_clamp(x lo hi:Z):Z:=Z.min(Z.max x lo)hi.
Definition qa_pow2(d:Z):Z:=2^d.
Definition qa_floor(x p:Z):Z:=x/p.
(* Signed low-byte count, mathematical shift and final word truncation.
   For signed32 data, ShiftSat does not change these low32 results. *)
Definition qa_neon_shift(x word:Z):Z:=
 let d:=qa_s8 word in qa_s32(if d <? 0 then Z.shiftr(x+2^(-d-1))(-d) else Z.shiftl x d).
Definition qa_mask5(d:Z):Z:=Z.land d 31.
Definition qa_rvv_rnu(x raw:Z):Z:=let d:=qa_mask5 raw in
 qa_s32(if d =? 0 then x else Z.shiftr x d + Z.land(Z.shiftr x(d-1))1).
Definition qa_rvv_sll(x raw:Z):Z:=qa_s32(Z.shiftl x(qa_mask5 raw)).
Definition qa_repaired_shift(x raw:Z):Z:=let d:=qa_ctrl raw in
 if (d <=? -32)||(32 <=? d) then 0 else
 if d <? 0 then qa_rvv_rnu x(-d) else qa_rvv_sll x d.
Definition qa_neon_mul(a b:Z):Z:=qa_s32(a*b).
Definition qa_rvv_mul(a b:Z):Z:=qa_s32(a*b).
Definition qa_neon_mla(a b c:Z):Z:=qa_s32(a+qa_s32(b*c)).
Definition qa_rvv_macc(a b c:Z):Z:=qa_s32(a+b*c).
Definition qa_neon_add16(a b:Z):Z:=qa_sat16(a+b).
Definition qa_rvv_add16(a b:Z):Z:=qa_sat16(a+b).
Definition qa_neon_acc(a b az bz ma mb:Z):Z:=
 qa_neon_mla(qa_neon_mul(qa_s16(a-az))ma)(qa_s16(b-bz))mb.
Definition qa_rvv_acc(a b az bz ma mb:Z):Z:=
 qa_rvv_macc(qa_rvv_mul(qa_s16(a-az))ma)mb(qa_s16(b-bz)).
Definition qa_neon_lane(a b az bz ma mb raw oz lo hi:Z):Z:=
 qa_clamp(qa_sat8(qa_neon_add16(qa_sat16(qa_neon_shift(qa_neon_acc a b az bz ma mb)(qa_negword raw)))oz))lo hi.
Definition qa_rvv_lane(a b az bz ma mb raw oz lo hi:Z):Z:=
 qa_clamp(qa_sat8(qa_rvv_add16(qa_sat16(qa_repaired_shift(qa_rvv_acc a b az bz ma mb)raw))oz))lo hi.
Lemma qa_s8_range:forall x,-128<=qa_s8 x<=127.
Proof. intros;unfold qa_s8;pose proof(signed_Lastnbits_range x 8 ltac:(lia));change(-128<=signed_last_nbits x 8<128)in H;lia. Qed.
Lemma qa_s16_range:forall x,-32768<=qa_s16 x<=32767.
Proof. intros;unfold qa_s16;pose proof(signed_Lastnbits_range x 16 ltac:(lia));change(-32768<=signed_last_nbits x 16<32768)in H;lia. Qed.
Lemma qa_s32_range:forall x,-2147483648<=qa_s32 x<=2147483647.
Proof. intros;unfold qa_s32;pose proof(signed_Lastnbits_range x 32 ltac:(lia));change(-2147483648<=signed_last_nbits x 32<2147483648)in H;lia. Qed.
Lemma qa_s32_id:forall x,-2147483648<=x<=2147483647->qa_s32 x=x.
Proof. intros;unfold qa_s32;apply signed_last_nbits_eq;[lia|];change(-2147483648<=x<2147483648);lia. Qed.
Lemma qa_s8_id:forall x,-128<=x<=127->qa_s8 x=x.
Proof. intros;unfold qa_s8;apply signed_last_nbits_eq;[lia|];change(-128<=x<128);lia. Qed.
Lemma qa_s16_id:forall x,-32768<=x<=32767->qa_s16 x=x.
Proof. intros;unfold qa_s16;apply signed_last_nbits_eq;[lia|];change(-32768<=x<32768);lia. Qed.
Lemma qa_ctrl_low:forall raw,qa_ctrl raw=qa_s8(-raw).
Proof.
 intros;unfold qa_ctrl,qa_s8,qa_u32;rewrite signed_unsigned_revolutive_less by lia.
 rewrite <-(signed_unsigned_sub_r 0(unsigned_last_nbits raw 32)8 ltac:(lia)).
 rewrite unsigned_revolutive_less by lia;rewrite signed_unsigned_sub_r by lia;reflexivity.
Qed.
Lemma qa_ctrl_neon:forall raw,qa_s8(qa_negword raw)=qa_ctrl raw.
Proof. intros;unfold qa_s8,qa_negword,qa_s32,qa_ctrl;rewrite signed_revolutive_less by lia;reflexivity. Qed.
Lemma qa_ctrl_range:forall raw,-128<=qa_ctrl raw<=127.
Proof. intros;unfold qa_ctrl;apply qa_s8_range. Qed.
Lemma qa_mask5_id:forall d,0<=d<32->qa_mask5 d=d.
Proof.
 intros;unfold qa_mask5;change 31 with(Z.ones 5);rewrite Z.land_ones by lia.
 change(d mod 32=d);apply Z.mod_small;lia.
Qed.
Lemma qa_sat16_range:forall x,-32768<=qa_sat16 x<=32767.
Proof. intros;unfold qa_sat16;destruct(Z.ltb_spec x(-32768));[lia|];destruct(Z.ltb_spec 32767 x);lia. Qed.
Lemma qa_sat8_range:forall x,-128<=qa_sat8 x<=127.
Proof. intros;unfold qa_sat8;destruct(Z.ltb_spec x(-128));[lia|];destruct(Z.ltb_spec 127 x);lia. Qed.
Lemma qa_mla_equiv:forall a b c,qa_neon_mla a b c=qa_rvv_macc a b c.
Proof. intros;unfold qa_neon_mla,qa_rvv_macc,qa_s32;rewrite signed_signed_add_r by lia;reflexivity. Qed.
Lemma qa_acc_equiv:forall a b az bz ma mb,qa_neon_acc a b az bz ma mb=qa_rvv_acc a b az bz ma mb.
Proof. intros;unfold qa_neon_acc,qa_rvv_acc,qa_neon_mul,qa_rvv_mul;rewrite qa_mla_equiv;unfold qa_rvv_macc;replace(qa_s16(b-bz)*mb)with(mb*qa_s16(b-bz))by ring;reflexivity. Qed.
