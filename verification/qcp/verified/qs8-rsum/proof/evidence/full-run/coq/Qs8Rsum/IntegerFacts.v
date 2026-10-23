From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From Qs8Rsum Require Import Model.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rs_mod32_period : forall x k,
 (x+k*4294967296) mod 4294967296=x mod 4294967296.
Proof. intros;rewrite Z.mod_add by lia;reflexivity. Qed.
Lemma rs_s32_period : forall x k,rs_s32(x+k*4294967296)=rs_s32 x.
Proof. intros;unfold rs_s32,signed_last_nbits;change (2^32) with 4294967296;rewrite rs_mod32_period;reflexivity. Qed.
Lemma rs_u32_period : forall x k,rs_u32(x+k*4294967296)=rs_u32 x.
Proof. intros;unfold rs_u32,unsigned_last_nbits;change (2^32) with 4294967296;apply rs_mod32_period. Qed.
Lemma rs_s32_bound : forall x,-2147483648<=rs_s32 x<=2147483647.
Proof. intros;pose proof(signed_Lastnbits_range x 32 ltac:(lia));unfold rs_s32;change (-2147483648<=signed_last_nbits x 32<2147483648)in H;lia. Qed.
Lemma rs_u32_bound : forall x,0<=rs_u32 x<=4294967295.
Proof. intros;pose proof(unsigned_Lastnbits_range x 32 ltac:(lia));unfold rs_u32;change (0<=unsigned_last_nbits x 32<4294967296)in H;lia. Qed.
Lemma rs_s32_in_range : forall x,-2147483648<=x<=2147483647 -> rs_s32 x=x.
Proof. intros;unfold rs_s32;apply signed_last_nbits_eq;cbn;lia. Qed.
Lemma rs_u32_in_range : forall x,0<=x<=4294967295 -> rs_u32 x=x.
Proof. intros;unfold rs_u32;apply unsigned_last_nbits_eq;cbn;lia. Qed.
Lemma rs_add_s32_wrap : forall a b,-2147483648<=a<=2147483647 -> -2147483648<=b<=2147483647 -> rs_add_s32 a b=rs_s32(a+b).
Proof.
 intros a b Ha Hb;unfold rs_add_s32;destruct(Z.gtb_spec(a+b)2147483647);[|destruct(Z.ltb_spec(a+b)(-2147483648))].
 - rewrite <- (rs_s32_in_range (a+b-4294967296)) by lia.
   replace (a+b-4294967296) with (a+b+(-1)*4294967296) by ring;apply rs_s32_period.
 - rewrite <- (rs_s32_in_range (a+b+4294967296)) by lia.
   replace (a+b+4294967296) with (a+b+1*4294967296) by ring;apply rs_s32_period.
 - symmetry;apply rs_s32_in_range;lia.
Qed.
Lemma rs_add_u32_wrap : forall a b,0<=a<=4294967295 -> 0<=b<=4294967295 -> rs_add_u32 a b=rs_u32(a+b).
Proof.
 intros a b Ha Hb;unfold rs_add_u32;destruct(Z.gtb_spec(a+b)4294967295).
 - rewrite <- (rs_u32_in_range (a+b-4294967296)) by lia.
   replace (a+b-4294967296) with (a+b+(-1)*4294967296) by ring;apply rs_u32_period.
 - symmetry;apply rs_u32_in_range;lia.
Qed.
Lemma rs_s32_add_l : forall a b,rs_s32(rs_s32 a+b)=rs_s32(a+b).
Proof. intros;unfold rs_s32;apply signed_signed_add_l;lia. Qed.
Lemma rs_s32_add_r : forall a b,rs_s32(a+rs_s32 b)=rs_s32(a+b).
Proof. intros;unfold rs_s32;apply signed_signed_add_r;lia. Qed.
Lemma rs_u32_add_l : forall a b,rs_u32(rs_u32 a+b)=rs_u32(a+b).
Proof. intros;unfold rs_u32;apply unsigned_unsigned_add_l;lia. Qed.
Lemma rs_u32_add_r : forall a b,rs_u32(a+rs_u32 b)=rs_u32(a+b).
Proof. intros;unfold rs_u32;apply unsigned_unsigned_add_r;lia. Qed.
Lemma rs_sum_app : forall A B,rs_sum(A++B)=rs_sum A+rs_sum B.
Proof. intros A B;unfold rs_sum;induction A;simpl;lia. Qed.
Fixpoint rs_fold_s32(a:Z)(L:list Z):Z := match L with []=>a|x::xs=>rs_fold_s32(rs_add_s32 a x)xs end.
Fixpoint rs_fold_u32(a:Z)(L:list Z):Z := match L with []=>a|x::xs=>rs_fold_u32(rs_add_u32 a x)xs end.
Lemma rs_fold_s32_sum : forall L a,Forall(fun x=>-2147483648<=x<=2147483647)L -> -2147483648<=a<=2147483647 -> rs_fold_s32 a L=rs_s32(a+rs_sum L).
Proof.
 induction L as[|x xs IH];intros a HL Ha.
 - cbn[rs_fold_s32 rs_sum fold_right];rewrite Z.add_0_r;symmetry;apply rs_s32_in_range;exact Ha.
 - inversion HL;subst;cbn[rs_fold_s32];rewrite IH by (try assumption;rewrite rs_add_s32_wrap by assumption;apply rs_s32_bound).
   rewrite rs_add_s32_wrap by assumption;rewrite rs_s32_add_l;cbn[rs_sum fold_right app];f_equal;unfold rs_sum;lia.
Qed.
Lemma rs_fold_u32_sum : forall L a,Forall(fun x=>0<=x<=4294967295)L -> 0<=a<=4294967295 -> rs_fold_u32 a L=rs_u32(a+rs_sum L).
Proof.
 induction L as[|x xs IH];intros a HL Ha.
 - cbn[rs_fold_u32 rs_sum fold_right];rewrite Z.add_0_r;symmetry;apply rs_u32_in_range;exact Ha.
 - inversion HL;subst;cbn[rs_fold_u32];rewrite IH by (try assumption;rewrite rs_add_u32_wrap by assumption;apply rs_u32_bound).
   rewrite rs_add_u32_wrap by assumption;rewrite rs_u32_add_l;cbn[rs_sum fold_right app];f_equal;unfold rs_sum;lia.
Qed.
Print Assumptions rs_mod32_period.
Print Assumptions rs_s32_period.
Print Assumptions rs_u32_period.
Print Assumptions rs_s32_bound.
Print Assumptions rs_u32_bound.
Print Assumptions rs_s32_in_range.
Print Assumptions rs_u32_in_range.
Print Assumptions rs_add_s32_wrap.
Print Assumptions rs_add_u32_wrap.
Print Assumptions rs_s32_add_l.
Print Assumptions rs_s32_add_r.
Print Assumptions rs_u32_add_l.
Print Assumptions rs_u32_add_r.
Print Assumptions rs_sum_app.
Print Assumptions rs_fold_s32_sum.
Print Assumptions rs_fold_u32_sum.
