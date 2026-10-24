From Coq Require Import ZArith Lia.
From Qu8Add Require Export RvvActiveModel RvvLaneFacts.
Local Open Scope Z_scope.
Lemma qu_active_subu_range : forall i vl a b,0<=qu_active_subu i vl a b<=65535.
Proof. intros;unfold qu_active_subu,qu_udiff,qu_u16;destruct(Z.ltb_spec i vl);[pose proof(unsigned_Lastnbits_range(a-b)16 ltac:(lia));cbn in H;lia|lia]. Qed.
Lemma qu_active_mul_range : forall i vl a b,-2147483648<=qu_active_mul i vl a b<=2147483647.
Proof. intros;unfold qu_active_mul,qu_rvv_mul;destruct(Z.ltb_spec i vl);[apply qu_s32_range|lia]. Qed.
Lemma qu_active_macc_range : forall i vl a c b,-2147483648<=qu_active_macc i vl a c b<=2147483647.
Proof. intros;unfold qu_active_macc,qu_rvv_macc;destruct(Z.ltb_spec i vl);[apply qu_s32_range|lia]. Qed.
Lemma qu_active_rnu_range : forall i vl a d,-2147483648<=qu_active_rnu i vl a d<=2147483647.
Proof. intros;unfold qu_active_rnu,qu_rvv_rnu;destruct(Z.ltb_spec i vl);[apply qu_s32_range|lia]. Qed.
Lemma qu_active_sll_range : forall i vl a d,-2147483648<=qu_active_sll i vl a d<=2147483647.
Proof. intros;unfold qu_active_sll,qu_rvv_sll;destruct(Z.ltb_spec i vl);[apply qu_s32_range|lia]. Qed.
Lemma qu_active_clip16_range : forall i vl a,-32768<=qu_active_clip16 i vl a<=32767.
Proof. intros;unfold qu_active_clip16;destruct(Z.ltb_spec i vl);[apply qu_sat16_range|lia]. Qed.
Lemma qu_active_add_range : forall i vl a b,-32768<=qu_active_add i vl a b<=32767.
Proof. intros;unfold qu_active_add,qu_rvv_add16;destruct(Z.ltb_spec i vl);[apply qu_sat16_range|lia]. Qed.
Lemma qu_active_sext_range : forall i vl a,-2147483648<=a<=2147483647 -> -2147483648<=qu_active_sext i vl a<=2147483647.
Proof. intros;unfold qu_active_sext;destruct(Z.ltb_spec i vl);lia. Qed.
Lemma qu_active_mov_range : forall i vl b,-2147483648<=b<=2147483647 -> -2147483648<=qu_active_mov i vl b<=2147483647.
Proof. intros;unfold qu_active_mov;destruct(Z.ltb_spec i vl);lia. Qed.
Lemma qu_active_max16_range : forall i vl a,-32768<=a<=32767 -> 0<=qu_active_max16 i vl a<=32767.
Proof. intros;unfold qu_active_max16;destruct(Z.ltb_spec i vl);[apply qu_max16zero_range;assumption|lia]. Qed.
Lemma qu_active_clipu8_range : forall i vl a,0<=a -> 0<=qu_active_clipu8 i vl a<=255.
Proof. intros;unfold qu_active_clipu8,qu_uclip8;destruct(Z.ltb_spec i vl);[pose proof(Z.le_min_l a 255);pose proof(Z.le_min_r a 255);pose proof(Z.min_glb a 255 0);lia|lia]. Qed.
Lemma qu_active_max_range : forall i vl a b,0<=a<=255 ->0<=b<=255 ->0<=qu_active_max i vl a b<=255.
Proof. intros;unfold qu_active_max;destruct(Z.ltb_spec i vl);[apply qu_umax_range;assumption|lia]. Qed.
Lemma qu_active_min_range : forall i vl a b,0<=a<=255 ->0<=b<=255 ->0<=qu_active_min i vl a b<=255.
Proof. intros;unfold qu_active_min;destruct(Z.ltb_spec i vl);[apply qu_umin_range;assumption|lia]. Qed.

Print Assumptions qu_active_subu_range.
Print Assumptions qu_active_mul_range.
Print Assumptions qu_active_macc_range.
Print Assumptions qu_active_rnu_range.
Print Assumptions qu_active_sll_range.
Print Assumptions qu_active_clip16_range.
Print Assumptions qu_active_add_range.
Print Assumptions qu_active_sext_range.
Print Assumptions qu_active_mov_range.
Print Assumptions qu_active_max16_range.
Print Assumptions qu_active_clipu8_range.
Print Assumptions qu_active_max_range.
Print Assumptions qu_active_min_range.
