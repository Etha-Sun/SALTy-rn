From Coq Require Import ZArith Lia List.
From Qs8I8Cvt Require Export ProgramFacts RvvMemoryFacts RvvModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qcv_rvv_chain(i vl x z m o:Z):Z := qcv_active_clip8 i vl(qcv_active_add i vl(qcv_active_clip15 i vl(qcv_active_mul i vl(qcv_active_shl7 i vl(qcv_active_rsub i vl(qcv_active_sext i vl x)z))(qcv_seed m)))o).
Lemma qcv_active_chain : forall i vl x z m o,i<vl ->
 qcv_rvv_chain i vl x z m o=qcv_neon_lane x z m o.
Proof.
 intros;unfold qcv_rvv_chain,qcv_active_clip8,qcv_active_add,qcv_active_clip15,qcv_active_mul,qcv_active_shl7,qcv_active_rsub,qcv_active_sext.
 destruct(Z.ltb_spec i vl);[|lia].
 rewrite qcv_lane_equiv;reflexivity.
Qed.
Definition qcv_rvv_result(k vl z m o:Z)(A:list Z):list Z :=
 map(fun i=>qcv_rvv_chain(Z.of_nat i)vl(s8_read_lane(Z.of_nat i)vl k A)z m o)(seq 0 32).
Lemma qcv_rvv_result_prefix : forall k vl z m o A,
 0<=k -> 0<=vl<=32 -> k+vl<=Zlength A ->
 s8_rvv_prefix vl(qcv_rvv_result k vl z m o A)=qcv_chunk k vl z m o A.
Proof.
 intros k vl z m o A Hk Hvl Hb;unfold qcv_rvv_result.
 rewrite s8_rvv_prefix_map_seq by assumption.
 apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,seq_length,qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite map_length,seq_length in Hi.
   rewrite s8_rvv_map_seq_nth by assumption.
   cbn[Nat.add].
   rewrite qcv_active_chain by lia.
   rewrite s8_rvv_read_lane_active by lia.
   rewrite <-(Nat2Z.id i) at 2.
   change(qcv_neon_lane(Znth(k+Z.of_nat i)A 0)z m o=Znth(Z.of_nat i)(qcv_chunk k vl z m o A)0).
   rewrite qcv_chunk_nth by lia;reflexivity.
Qed.
