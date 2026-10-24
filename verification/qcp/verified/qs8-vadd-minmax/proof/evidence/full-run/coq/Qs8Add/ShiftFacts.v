From Coq Require Import ZArith Lia Psatz.
From Qs8Add Require Export Model.
Local Open Scope Z_scope.
Lemma qa_land1:forall x,Z.land x 1=x mod 2.
Proof. intros;change 1 with(Z.ones 1);rewrite Z.land_ones by lia;reflexivity. Qed.
Lemma qa_pow_positive:forall d,0<=d->0<2^d.
Proof. intros;apply Z.pow_pos_nonneg;lia. Qed.
Lemma qa_pow_step:forall d,1<=d->2^d=2*(2^(d-1)).
Proof. intros;replace d with((d-1)+1)at 1 by lia;rewrite Z.pow_add_r by lia;change(2^1)with 2;ring. Qed.
Lemma qa_pow_bounds31:forall d,0<=d<=31->1<=2^d<=2147483648.
Proof.
 intros d Hd;split.
 - pose proof(qa_pow_positive d ltac:(lia));lia.
 - change(2^d<=2^31);apply Z.pow_le_mono_r;lia.
Qed.
Lemma qa_pow_half:forall d,1<=d->(2^d)/2=2^(d-1).
Proof. intros;rewrite qa_pow_step by lia;replace(2*2^(d-1))with(2^(d-1)*2)by ring;rewrite Z.div_mul by lia;reflexivity. Qed.
Lemma qa_dyadic_round:forall x p,0<p->x/(2*p)+(x/p)mod 2=(x+p)/(2*p).
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
Lemma qa_rnu_positive:forall x d,1<=d<32->
 qa_rvv_rnu x d=qa_s32((x+2^(d-1))/(2^d)).
Proof.
 intros;unfold qa_rvv_rnu;rewrite qa_mask5_id by lia.
 destruct(Z.eqb_spec d 0);[lia|].
 f_equal;rewrite qa_land1,!Z.shiftr_div_pow2 by lia.
 rewrite qa_pow_step by lia;apply qa_dyadic_round;apply qa_pow_positive;lia.
Qed.
Lemma qa_rnu_floor:forall x d,0<=d<32->
 qa_rvv_rnu x d=qa_s32((x+(2^d)/2)/(2^d)).
Proof.
 intros x d Hd;destruct(Z.eq_dec d 0)as[->|Hn].
 - unfold qa_rvv_rnu,qa_mask5;change(qa_s32 x=qa_s32((x+0)/1));rewrite Z.add_0_r,Z.div_1_r;reflexivity.
 - rewrite qa_pow_half by lia;apply qa_rnu_positive;lia.
Qed.
Lemma qa_round_large:forall x d,-2147483648<=x<=2147483647->32<=d->
 (x+2^(d-1))/(2^d)=0.
Proof.
 intros x d Hx Hd.
 assert(Hp:2147483648<=2^(d-1)).
 { change(2^31<=2^(d-1));apply Z.pow_le_mono_r;lia. }
 rewrite (qa_pow_step d ltac:(lia));apply Z.div_small;lia.
Qed.
Lemma qa_left_large:forall x d,32<=d->qa_s32(Z.shiftl x d)=0.
Proof.
 intros x d Hd;rewrite Z.shiftl_mul_pow2 by lia.
 assert(Hp:2^d=2^(d-32)*2^32).
 { replace d with((d-32)+32)at 1 by lia;rewrite Z.pow_add_r by lia;reflexivity. }
 unfold qa_s32,signed_last_nbits;rewrite Hp.
 replace(x*(2^(d-32)*2^32))with((x*2^(d-32))*2^32)by ring.
 rewrite Z.mod_mul by lia;reflexivity.
Qed.
Lemma qa_shift_equiv:forall x raw,-2147483648<=x<=2147483647->
 qa_neon_shift x(qa_negword raw)=qa_repaired_shift x raw.
Proof.
 intros x raw Hx;unfold qa_neon_shift;rewrite qa_ctrl_neon;unfold qa_repaired_shift.
 set(d:=qa_ctrl raw).
 destruct(Z.leb_spec d(-32));cbn[orb].
 - destruct(Z.ltb_spec d 0);[|lia].
   rewrite Z.shiftr_div_pow2 by lia;rewrite qa_round_large by lia;reflexivity.
 - destruct(Z.leb_spec 32 d);cbn[orb].
   + destruct(Z.ltb_spec d 0);[lia|]. apply qa_left_large;lia.
   + destruct(Z.ltb_spec d 0).
     * rewrite qa_rnu_positive by lia;rewrite Z.shiftr_div_pow2 by lia;reflexivity.
     * unfold qa_rvv_sll;rewrite qa_mask5_id by lia;reflexivity.
Qed.
Lemma qa_lane_equiv:forall a b az bz ma mb raw oz lo hi,
 qa_neon_lane a b az bz ma mb raw oz lo hi=qa_rvv_lane a b az bz ma mb raw oz lo hi.
Proof.
 intros;unfold qa_neon_lane,qa_rvv_lane;rewrite qa_acc_equiv.
 rewrite qa_shift_equiv.
 - reflexivity.
 - unfold qa_rvv_acc,qa_rvv_macc;apply qa_s32_range.
Qed.
Lemma qa_floor_negative:forall x p,0<p->-((-x+p-1)/p)=x/p.
Proof.
 intros x p Hp;apply Z.div_unique with(r:=p-1-((-x+p-1)mod p)).
 - left;pose proof(Z.mod_pos_bound(-x+p-1)p Hp);lia.
 - pose proof(Z.div_mod(-x+p-1)p ltac:(lia));ring_simplify;lia.
Qed.
Lemma qa_negword_preserves_defined_source:forall raw,
 -2147483648<raw<=2147483647 -> qa_negword raw = -raw.
Proof.
 intros raw Hr;unfold qa_negword,qa_s32,qa_u32.
 rewrite signed_unsigned_revolutive by lia;rewrite signed_unsigned_sub_r by lia.
 apply signed_last_nbits_eq;[lia|];change(-2147483648<=0-raw<2147483648);lia.
Qed.
Lemma qa_neon_left_power:forall x word,0<=qa_s8 word->
 qa_neon_shift x word=qa_s32(x*qa_pow2(qa_s8 word)).
Proof. intros;unfold qa_neon_shift,qa_pow2;destruct(Z.ltb_spec(qa_s8 word)0);[lia|];rewrite Z.shiftl_mul_pow2 by lia;reflexivity. Qed.
Lemma qa_neon_right_floor:forall x word,qa_s8 word<0->
 qa_neon_shift x word=qa_s32(qa_floor(x+qa_pow2(-qa_s8 word)/2)(qa_pow2(-qa_s8 word))).
Proof. intros;unfold qa_neon_shift,qa_pow2,qa_floor;destruct(Z.ltb_spec(qa_s8 word)0);[|lia];rewrite Z.shiftr_div_pow2 by lia;rewrite(qa_pow_half(-qa_s8 word))by lia;reflexivity. Qed.
Lemma qa_neon_left_out:forall x word,32<=qa_s8 word->qa_neon_shift x word=0.
Proof. intros;unfold qa_neon_shift;destruct(Z.ltb_spec(qa_s8 word)0);[lia|];apply qa_left_large;lia. Qed.
Lemma qa_neon_right_out:forall x word,-2147483648<=x<=2147483647->qa_s8 word<=-32->qa_neon_shift x word=0.
Proof. intros;rewrite qa_neon_right_floor by lia;unfold qa_floor,qa_pow2;rewrite(qa_pow_half(-qa_s8 word))by lia;rewrite qa_round_large by lia;reflexivity. Qed.
Lemma qa_rvv_sll_power:forall x d,0<=d<32->qa_rvv_sll x d=qa_s32(x*qa_pow2 d).
Proof. intros;unfold qa_rvv_sll,qa_pow2;rewrite qa_mask5_id by lia;rewrite Z.shiftl_mul_pow2 by lia;reflexivity. Qed.
Lemma qa_pow2_unsigned32:forall d,0<=d<=31->
 unsigned_last_nbits(Z.shiftl(unsigned_last_nbits 1 32)d)32=qa_pow2 d.
Proof.
 intros d Hd;change(unsigned_last_nbits(Z.shiftl 1 d)32=qa_pow2 d).
 rewrite Z.shiftl_mul_pow2 by lia;replace(1*2^d)with(2^d)by ring.
 unfold qa_pow2;apply unsigned_last_nbits_eq;change(0<=2^d<4294967296).
 pose proof(qa_pow_bounds31 d Hd);lia.
Qed.
Lemma qa_mul_bound31:forall a b,
 -2147483648<=a<=2147483648->-2147483648<=b<=2147483648->
 -4611686018427387904<=a*b<=4611686018427387904.
Proof.
 intros a b Ha Hb;destruct(Z_le_dec 0 a),(Z_le_dec 0 b).
 - pose proof(Z.mul_nonneg_nonneg a b ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648-a)b ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg a(-b)ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648-a)(-b)ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg(-a)b ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648+a)b ltac:(lia)ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg(-a)(-b)ltac:(lia)ltac:(lia));pose proof(Z.mul_nonneg_nonneg(2147483648+a)(-b)ltac:(lia)ltac:(lia));nia.
Qed.
Lemma qa_original_shift32_counterexample:
 qa_neon_shift 1(qa_negword 32)=0 /\ qa_rvv_rnu 1 32=1.
Proof. vm_compute;split;reflexivity. Qed.
Lemma qa_raw256_identity:forall x,qa_neon_shift x(qa_negword 256)=qa_s32 x /\ qa_repaired_shift x 256=qa_s32 x.
Proof. intros;split;reflexivity. Qed.
Lemma qa_repaired_intmin_identity:forall x,qa_neon_shift x(qa_negword(-2147483648))=qa_s32 x /\ qa_repaired_shift x(-2147483648)=qa_s32 x.
Proof. intros;split;reflexivity. Qed.
