From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Export ProgramFacts RvvMemoryFacts RvvModel LreluFacts LreluActiveModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qlr_active_chain(i vl x z pm nm o:Z):Z :=
 let d:=qcv_active_rsub i vl(qcv_active_sext i vl x)(qcv_s16 z)in
 qcv_active_clip8 i vl(qcv_active_add i vl(qcv_active_clip15 i vl
 (qcv_active_mul i vl(qcv_active_shl7 i vl d)
 (qlr_active_merge(qlr_active_splat(qcv_seed nm)i vl)(qcv_seed pm)(qlr_active_mask d 0 i vl)i vl)))(qcv_s16 o)).
Lemma qlr_active_mask_range : forall a b i vl,0<=qlr_active_mask a b i vl<=1.
Proof. intros;unfold qlr_active_mask;destruct(Z.ltb i vl);[apply qlr_rvv_mask_range|lia]. Qed.
Lemma qlr_active_chain_exact : forall i vl x z pm nm o,i<vl ->
 qlr_active_chain i vl x z pm nm o=qlr_neon_lane x z pm nm o.
Proof.
 intros;unfold qlr_active_chain,qcv_active_clip8,qcv_active_add,qcv_active_clip15,qcv_active_mul,qcv_active_shl7,qcv_active_rsub,qcv_active_sext,qlr_active_splat,qlr_active_mask,qlr_active_merge.
 destruct(Z.ltb_spec i vl);[|lia].
 change(qlr_rvv_expression x z pm nm o=qlr_neon_lane x z pm nm o).
 rewrite qlr_rvv_expression_exact;apply eq_sym;apply qlr_lane_equiv.
Qed.
Definition qlr_rvv_result(k vl z pm nm o:Z)(A:list Z):list Z :=
 map(fun i=>qlr_active_chain(Z.of_nat i)vl(s8_read_lane(Z.of_nat i)vl k A)z pm nm o)(seq 0 32).
Lemma qlr_rvv_result_prefix : forall k vl z pm nm o A,
 0<=k -> 0<=vl<=32 -> k+vl<=Zlength A ->
 s8_rvv_prefix vl(qlr_rvv_result k vl z pm nm o A)=qlr_chunk k vl z pm nm o A.
Proof.
 intros k vl z pm nm o A Hk Hvl Hb;unfold qlr_rvv_result.
 rewrite s8_rvv_prefix_map_seq by assumption.
 apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,seq_length,qlr_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,seq_length in Hi.
   rewrite s8_rvv_map_seq_nth by assumption.
   cbn[Nat.add].
   rewrite qlr_active_chain_exact by lia.
   rewrite s8_rvv_read_lane_active by lia.
   rewrite <-(Nat2Z.id i) at 2.
   change(qlr_neon_lane(Znth(k+Z.of_nat i)A 0)z pm nm o=Znth(Z.of_nat i)(qlr_chunk k vl z pm nm o A)0).
   rewrite qlr_chunk_nth by lia;reflexivity.
Qed.
Print Assumptions qlr_active_mask_range.
Print Assumptions qlr_active_chain_exact.
Print Assumptions qlr_rvv_result_prefix.
