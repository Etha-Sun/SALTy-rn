From Coq Require Import ZArith Lia.
From Qs8Add Require Export RvvActiveModel.
Local Open Scope Z_scope.
Lemma qa_active_sub_range : forall i vl a b, -32768<=qa_active_sub i vl a b<=32767.
Proof. intros;unfold qa_active_sub;destruct(Z.ltb_spec i vl);[apply qa_s16_range|lia]. Qed.
Lemma qa_active_mul_range : forall i vl a b, -2147483648<=qa_active_mul i vl a b<=2147483647.
Proof. intros;unfold qa_active_mul,qa_rvv_mul;destruct(Z.ltb_spec i vl);[apply qa_s32_range|lia]. Qed.
Lemma qa_active_macc_range : forall i vl a c b, -2147483648<=qa_active_macc i vl a c b<=2147483647.
Proof. intros;unfold qa_active_macc,qa_rvv_macc;destruct(Z.ltb_spec i vl);[apply qa_s32_range|lia]. Qed.
Lemma qa_active_rnu_range : forall i vl a d, -2147483648<=qa_active_rnu i vl a d<=2147483647.
Proof. intros;unfold qa_active_rnu,qa_rvv_rnu;destruct(Z.ltb_spec i vl);[apply qa_s32_range|lia]. Qed.
Lemma qa_active_sll_range : forall i vl a d, -2147483648<=qa_active_sll i vl a d<=2147483647.
Proof. intros;unfold qa_active_sll,qa_rvv_sll;destruct(Z.ltb_spec i vl);[apply qa_s32_range|lia]. Qed.
Lemma qa_active_clip16_range : forall i vl a, -32768<=qa_active_clip16 i vl a<=32767.
Proof. intros;unfold qa_active_clip16;destruct(Z.ltb_spec i vl);[apply qa_sat16_range|lia]. Qed.
Lemma qa_active_add_range : forall i vl a b, -32768<=qa_active_add i vl a b<=32767.
Proof. intros;unfold qa_active_add,qa_rvv_add16;destruct(Z.ltb_spec i vl);[apply qa_sat16_range|lia]. Qed.
Lemma qa_active_clip8_range : forall i vl a, -128<=qa_active_clip8 i vl a<=127.
Proof. intros;unfold qa_active_clip8;destruct(Z.ltb_spec i vl);[apply qa_sat8_range|lia]. Qed.
Lemma qa_active_sext_range : forall i vl a,
 -2147483648<=a<=2147483647 -> -2147483648<=qa_active_sext i vl a<=2147483647.
Proof. intros;unfold qa_active_sext;destruct(Z.ltb_spec i vl);lia. Qed.
Lemma qa_active_mov_range : forall i vl b,
 -2147483648<=b<=2147483647 -> -2147483648<=qa_active_mov i vl b<=2147483647.
Proof. intros;unfold qa_active_mov;destruct(Z.ltb_spec i vl);lia. Qed.
Lemma qa_active_max_range : forall i vl a b,
 -128<=a<=127 -> -128<=b<=127 -> -128<=qa_active_max i vl a b<=127.
Proof. intros;unfold qa_active_max;destruct(Z.ltb_spec i vl);[apply qa_max_range;assumption|lia]. Qed.
Lemma qa_active_min_range : forall i vl a b,
 -128<=a<=127 -> -128<=b<=127 -> -128<=qa_active_min i vl a b<=127.
Proof. intros;unfold qa_active_min;destruct(Z.ltb_spec i vl);[apply qa_min_range;assumption|lia]. Qed.
Print Assumptions qa_active_sub_range.
Print Assumptions qa_active_mul_range.
Print Assumptions qa_active_macc_range.
Print Assumptions qa_active_rnu_range.
Print Assumptions qa_active_sll_range.
Print Assumptions qa_active_clip16_range.
Print Assumptions qa_active_add_range.
Print Assumptions qa_active_clip8_range.
Print Assumptions qa_active_sext_range.
Print Assumptions qa_active_mov_range.
Print Assumptions qa_active_max_range.
Print Assumptions qa_active_min_range.
