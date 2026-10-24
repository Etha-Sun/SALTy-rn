From Coq Require Import ZArith Lia Psatz.
From Qu8Add Require Export Model.
Local Open Scope Z_scope.
Lemma qu_land1:forall x,Z.land x 1=x mod 2.
Proof. intros;change 1 with(Z.ones 1);rewrite Z.land_ones by lia;reflexivity. Qed.
Lemma qu_pow_positive:forall d,0<=d->0<2^d.
Proof. intros;apply Z.pow_pos_nonneg;lia. Qed.
Lemma qu_pow_step:forall d,1<=d->2^d=2*(2^(d-1)).
Proof. intros;replace d with((d-1)+1)at 1 by lia;rewrite Z.pow_add_r by lia;change(2^1)with 2;ring. Qed.
Lemma qu_pow_bounds31:forall d,0<=d<=31->1<=2^d<=2147483648.
Proof.
 intros d Hd;split.
 - pose proof(qu_pow_positive d ltac:(lia));lia.
 - change(2^d<=2^31);apply Z.pow_le_mono_r;lia.
Qed.
Lemma qu_pow_half:forall d,1<=d->(2^d)/2=2^(d-1).
Proof. intros;rewrite qu_pow_step by lia;replace(2*2^(d-1))with(2^(d-1)*2)by ring;rewrite Z.div_mul by lia;reflexivity. Qed.
Lemma qu_dyadic_round:forall x p,0<p->x/(2*p)+(x/p)mod 2=(x+p)/(2*p).
Proof.
 intros x p Hp.
 remember(x/p)as q eqn:Hq;remember(x mod p)as r eqn:Hr.
 remember(q/2)as k eqn:Hk;remember(q mod 2)as b eqn:Hb.
 pose proof(Z.div_mod x p ltac:(lia))as Hx;rewrite <-Hq,<-Hr in Hx.
 pose proof(Z.mod_pos_bound x p Hp)as Hrbound;rewrite <-Hr in Hrbound.
 pose proof(Z.div_mod q 2 ltac:(lia))as Hqp;rewrite <-Hk,<-Hb in Hqp.
 pose proof(Z.mod_pos_bound q 2 ltac:(lia))as Hbnd;rewrite <-Hb in Hbnd.
 rewrite Hqp in Hx.
 assert(Hu:x/(2*p)=k).
 { symmetry;apply Z.div_unique with(r:=p*b+r);[left;nia|nia]. }
 rewrite Hu;apply Z.div_unique with(r:=r+p*(1-b));[left;nia|nia].
Qed.
Lemma qu_rnu_positive:forall x d,1<=d<32->
 qu_rvv_rnu x d=qu_s32((x+2^(d-1))/(2^d)).
Proof.
 intros;unfold qu_rvv_rnu;rewrite qu_mask5_id by lia.
 destruct(Z.eqb_spec d 0);[lia|].
 f_equal;rewrite qu_land1,!Z.shiftr_div_pow2 by lia.
 rewrite qu_pow_step by lia;apply qu_dyadic_round;apply qu_pow_positive;lia.
Qed.
Lemma qu_rnu_floor:forall x d,0<=d<32->
 qu_rvv_rnu x d=qu_s32((x+(2^d)/2)/(2^d)).
Proof.
 intros x d Hd;destruct(Z.eq_dec d 0)as[->|Hn].
 - unfold qu_rvv_rnu,qu_mask5;change(qu_s32 x=qu_s32((x+0)/1));rewrite Z.add_0_r,Z.div_1_r;reflexivity.
 - rewrite qu_pow_half by lia;apply qu_rnu_positive;lia.
Qed.
Lemma qu_round_large:forall x d,-2147483648<=x<=2147483647->32<=d->
 (x+2^(d-1))/(2^d)=0.
Proof.
 intros x d Hx Hd.
 assert(Hp:2147483648<=2^(d-1)).
 { change(2^31<=2^(d-1));apply Z.pow_le_mono_r;lia. }
 rewrite (qu_pow_step d ltac:(lia));apply Z.div_small;lia.
Qed.
Lemma qu_left_large:forall x d,32<=d->qu_s32(Z.shiftl x d)=0.
Proof.
 intros x d Hd;rewrite Z.shiftl_mul_pow2 by lia.
 assert(Hp:2^d=2^(d-32)*2^32).
 { replace d with((d-32)+32)at 1 by lia;rewrite Z.pow_add_r by lia;reflexivity. }
 unfold qu_s32,signed_last_nbits;rewrite Hp.
 replace(x*(2^(d-32)*2^32))with((x*2^(d-32))*2^32)by ring.
 rewrite Z.mod_mul by lia;reflexivity.
Qed.
Lemma qu_shift_equiv:forall x raw,-2147483648<=x<=2147483647->
 qu_neon_shift x(qu_negword raw)=qu_repaired_shift x raw.
Proof.
 intros x raw Hx;unfold qu_neon_shift;rewrite qu_ctrl_neon;unfold qu_repaired_shift.
 set(d:=qu_ctrl raw).
 destruct(Z.leb_spec d(-32));cbn[orb].
 - destruct(Z.ltb_spec d 0);[|lia].
   rewrite Z.shiftr_div_pow2 by lia;rewrite qu_round_large by lia;reflexivity.
 - destruct(Z.leb_spec 32 d);cbn[orb].
   + destruct(Z.ltb_spec d 0);[lia|]. apply qu_left_large;lia.
   + destruct(Z.ltb_spec d 0).
     * rewrite qu_rnu_positive by lia;rewrite Z.shiftr_div_pow2 by lia;reflexivity.
     * unfold qu_rvv_sll;rewrite qu_mask5_id by lia;reflexivity.
Qed.
Lemma qu_floor_negative:forall x p,0<p->-((-x+p-1)/p)=x/p.
Proof.
 intros x p Hp;apply Z.div_unique with(r:=p-1-((-x+p-1)mod p)).
 - left;pose proof(Z.mod_pos_bound(-x+p-1)p Hp);lia.
 - pose proof(Z.div_mod(-x+p-1)p ltac:(lia));ring_simplify;lia.
Qed.
Lemma qu_negword_preserves_defined_source:forall raw,
 -2147483648<raw<=2147483647 -> qu_negword raw = -raw.
Proof.
 intros raw Hr;unfold qu_negword,qu_s32,qu_u32.
 rewrite signed_unsigned_revolutive by lia;rewrite signed_unsigned_sub_r by lia.
 apply signed_last_nbits_eq;[lia|];change(-2147483648<=0-raw<2147483648);lia.
Qed.
Lemma qu_neon_left_power:forall x word,0<=qu_s8 word->
 qu_neon_shift x word=qu_s32(x*qu_pow2(qu_s8 word)).
Proof. intros;unfold qu_neon_shift,qu_pow2;destruct(Z.ltb_spec(qu_s8 word)0);[lia|];rewrite Z.shiftl_mul_pow2 by lia;reflexivity. Qed.
Lemma qu_neon_right_floor:forall x word,qu_s8 word<0->
 qu_neon_shift x word=qu_s32(qu_floor(x+qu_pow2(-qu_s8 word)/2)(qu_pow2(-qu_s8 word))).
Proof. intros;unfold qu_neon_shift,qu_pow2,qu_floor;destruct(Z.ltb_spec(qu_s8 word)0);[|lia];rewrite Z.shiftr_div_pow2 by lia;rewrite(qu_pow_half(-qu_s8 word))by lia;reflexivity. Qed.
Lemma qu_neon_left_out:forall x word,32<=qu_s8 word->qu_neon_shift x word=0.
Proof. intros;unfold qu_neon_shift;destruct(Z.ltb_spec(qu_s8 word)0);[lia|];apply qu_left_large;lia. Qed.
Lemma qu_neon_right_out:forall x word,-2147483648<=x<=2147483647->qu_s8 word<=-32->qu_neon_shift x word=0.
Proof. intros;rewrite qu_neon_right_floor by lia;unfold qu_floor,qu_pow2;rewrite(qu_pow_half(-qu_s8 word))by lia;rewrite qu_round_large by lia;reflexivity. Qed.
Lemma qu_rvv_sll_power:forall x d,0<=d<32->qu_rvv_sll x d=qu_s32(x*qu_pow2 d).
Proof. intros;unfold qu_rvv_sll,qu_pow2;rewrite qu_mask5_id by lia;rewrite Z.shiftl_mul_pow2 by lia;reflexivity. Qed.
Lemma qu_pow2_unsigned32:forall d,0<=d<=31->
 unsigned_last_nbits(Z.shiftl(unsigned_last_nbits 1 32)d)32=qu_pow2 d.
Proof.
 intros d Hd;change(unsigned_last_nbits(Z.shiftl 1 d)32=qu_pow2 d).
 rewrite Z.shiftl_mul_pow2 by lia;replace(1*2^d)with(2^d)by ring.
 unfold qu_pow2;apply unsigned_last_nbits_eq;change(0<=2^d<4294967296).
 pose proof(qu_pow_bounds31 d Hd);lia.
Qed.
Lemma qu_mul_bound31:forall a b,
 -2147483648<=a<=2147483648->-2147483648<=b<=2147483648->
 -4611686018427387904<=a*b<=4611686018427387904.
Proof.
 intros a b Ha Hb;destruct(Z_le_dec 0 a),(Z_le_dec 0 b).
 - pose proof(Z.mul_nonneg_nonneg a b ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648-a)b ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg a(-b)ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648-a)(-b)ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg(-a)b ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648+a)b ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg(-a)(-b)ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648+a)(-b)ltac:(lia)ltac:(lia));nia.
Qed.
Lemma qu_original_shift32_counterexample:
 qu_neon_shift 1(qu_negword 32)=0 /\ qu_rvv_rnu 1 32=1.
Proof. vm_compute;split;reflexivity. Qed.
Lemma qu_raw256_identity:forall x,qu_neon_shift x(qu_negword 256)=qu_s32 x /\ qu_repaired_shift x 256=qu_s32 x.
Proof. intros;split;reflexivity. Qed.
Lemma qu_repaired_intmin_identity:forall x,qu_neon_shift x(qu_negword(-2147483648))=qu_s32 x /\ qu_repaired_shift x(-2147483648)=qu_s32 x.
Proof. intros;split;reflexivity. Qed.
