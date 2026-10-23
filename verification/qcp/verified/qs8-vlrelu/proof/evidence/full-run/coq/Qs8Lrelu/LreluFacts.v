From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export LreluModel.
Local Open Scope Z_scope.
Lemma qlr_neon_mask_canonical : forall a b,qlr_neon_mask a b=0 \/ qlr_neon_mask a b=65535.
Proof. intros;unfold qlr_neon_mask;destruct(Z.ltb a b);auto. Qed.
Lemma qlr_rvv_mask_canonical : forall a b,qlr_rvv_mask a b=0 \/ qlr_rvv_mask a b=1.
Proof. intros;unfold qlr_rvv_mask;destruct(Z.ltb a b);auto. Qed.
Lemma qlr_neon_mask_range : forall a b,0<=qlr_neon_mask a b<=65535.
Proof. intros;pose proof(qlr_neon_mask_canonical a b);lia. Qed.
Lemma qlr_rvv_mask_range : forall a b,0<=qlr_rvv_mask a b<=1.
Proof. intros;pose proof(qlr_rvv_mask_canonical a b);lia. Qed.
Lemma qlr_choose_neon_range : forall m a b,-32768<=a<=32767 -> -32768<=b<=32767 -> -32768<=qlr_choose_neon m a b<=32767.
Proof. intros;unfold qlr_choose_neon;destruct(Z.eqb m 65535);assumption. Qed.
Lemma qlr_choose_rvv_range : forall m a b,-32768<=a<=32767 -> -32768<=b<=32767 -> -32768<=qlr_choose_rvv m a b<=32767.
Proof. intros;unfold qlr_choose_rvv;destruct(Z.eqb m 1);assumption. Qed.
Lemma qlr_mask_choice_equiv : forall d p n,
 qlr_choose_neon(qlr_neon_mask d 0)p n=qlr_choose_rvv(qlr_rvv_mask d 0)p n.
Proof. intros;unfold qlr_choose_neon,qlr_choose_rvv,qlr_neon_mask,qlr_rvv_mask;destruct(Z.ltb d 0);reflexivity. Qed.
Lemma qlr_neon_expression_exact : forall x z pm nm o,qlr_neon_expression x z pm nm o=qlr_neon_lane x z pm nm o.
Proof. intros;unfold qlr_neon_expression,qlr_neon_lane,qcv_neon_lane,qlr_selected_raw,qlr_neon_mask,qlr_choose_neon;destruct(Z.ltb(qcv_subw(qcv_s16 z)x)0);reflexivity. Qed.
Lemma qlr_rvv_expression_exact : forall x z pm nm o,qlr_rvv_expression x z pm nm o=qlr_rvv_lane x z pm nm o.
Proof. intros;unfold qlr_rvv_expression,qlr_rvv_lane,qcv_rvv_lane,qlr_selected_raw,qlr_rvv_mask,qlr_choose_rvv,qcv_subw;destruct(Z.ltb(qcv_s16(qcv_s16 z-x))0);reflexivity. Qed.
Lemma qlr_lane_equiv : forall x z pm nm o,qlr_neon_lane x z pm nm o=qlr_rvv_lane x z pm nm o.
Proof. intros;unfold qlr_neon_lane,qlr_rvv_lane;apply qcv_lane_equiv. Qed.
Lemma qlr_seed_cast : forall m,signed_last_nbits(0-unsigned_last_nbits m 32)16=qcv_seed m.
Proof. intros;unfold qcv_seed;rewrite signed_unsigned_revolutive_less by lia;reflexivity. Qed.
Lemma qlr_lane_range : forall x z pm nm o,-128<=qlr_neon_lane x z pm nm o<=127.
Proof. intros;unfold qlr_neon_lane,qcv_neon_lane;apply qcv_sat8_range. Qed.
Print Assumptions qlr_neon_mask_canonical.
Print Assumptions qlr_rvv_mask_canonical.
Print Assumptions qlr_neon_mask_range.
Print Assumptions qlr_rvv_mask_range.
Print Assumptions qlr_choose_neon_range.
Print Assumptions qlr_choose_rvv_range.
Print Assumptions qlr_mask_choice_equiv.
Print Assumptions qlr_neon_expression_exact.
Print Assumptions qlr_rvv_expression_exact.
Print Assumptions qlr_lane_equiv.
Print Assumptions qlr_seed_cast.
Print Assumptions qlr_lane_range.
