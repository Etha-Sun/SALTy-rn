From Coq Require Import ZArith Lia List.
From F32F16 Require Import RvvStages ArrayMemory.
Local Open Scope Z_scope.
Lemma f16_staged_packet_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a ->
 f16_take vl (f16_pack32
 (f16_stage_20 0 vl a)
 (f16_stage_20 1 vl a)
 (f16_stage_20 2 vl a)
 (f16_stage_20 3 vl a)
 (f16_stage_20 4 vl a)
 (f16_stage_20 5 vl a)
 (f16_stage_20 6 vl a)
 (f16_stage_20 7 vl a)
 (f16_stage_20 8 vl a)
 (f16_stage_20 9 vl a)
 (f16_stage_20 10 vl a)
 (f16_stage_20 11 vl a)
 (f16_stage_20 12 vl a)
 (f16_stage_20 13 vl a)
 (f16_stage_20 14 vl a)
 (f16_stage_20 15 vl a)
 (f16_stage_20 16 vl a)
 (f16_stage_20 17 vl a)
 (f16_stage_20 18 vl a)
 (f16_stage_20 19 vl a)
 (f16_stage_20 20 vl a)
 (f16_stage_20 21 vl a)
 (f16_stage_20 22 vl a)
 (f16_stage_20 23 vl a)
 (f16_stage_20 24 vl a)
 (f16_stage_20 25 vl a)
 (f16_stage_20 26 vl a)
 (f16_stage_20 27 vl a)
 (f16_stage_20 28 vl a)
 (f16_stage_20 29 vl a)
 (f16_stage_20 30 vl a)
 (f16_stage_20 31 vl a))=f16_rvv_values vl a.
Proof. intros;repeat rewrite f16_staged_result;apply f16_pipeline_packed_prefix;assumption. Qed.
Lemma f16_staged_packet_from_values : forall (vl:Z)(a:list fp32)(c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31:Z),
 0<=vl<=32 -> vl<=Zlength a ->
 c0=f16_stage_20 0 vl a ->
 c1=f16_stage_20 1 vl a ->
 c2=f16_stage_20 2 vl a ->
 c3=f16_stage_20 3 vl a ->
 c4=f16_stage_20 4 vl a ->
 c5=f16_stage_20 5 vl a ->
 c6=f16_stage_20 6 vl a ->
 c7=f16_stage_20 7 vl a ->
 c8=f16_stage_20 8 vl a ->
 c9=f16_stage_20 9 vl a ->
 c10=f16_stage_20 10 vl a ->
 c11=f16_stage_20 11 vl a ->
 c12=f16_stage_20 12 vl a ->
 c13=f16_stage_20 13 vl a ->
 c14=f16_stage_20 14 vl a ->
 c15=f16_stage_20 15 vl a ->
 c16=f16_stage_20 16 vl a ->
 c17=f16_stage_20 17 vl a ->
 c18=f16_stage_20 18 vl a ->
 c19=f16_stage_20 19 vl a ->
 c20=f16_stage_20 20 vl a ->
 c21=f16_stage_20 21 vl a ->
 c22=f16_stage_20 22 vl a ->
 c23=f16_stage_20 23 vl a ->
 c24=f16_stage_20 24 vl a ->
 c25=f16_stage_20 25 vl a ->
 c26=f16_stage_20 26 vl a ->
 c27=f16_stage_20 27 vl a ->
 c28=f16_stage_20 28 vl a ->
 c29=f16_stage_20 29 vl a ->
 c30=f16_stage_20 30 vl a ->
 c31=f16_stage_20 31 vl a ->
 f16_take vl (f16_pack32 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31)=f16_rvv_values vl a.
Proof. intros;subst;apply f16_staged_packet_prefix;assumption. Qed.
Print Assumptions f16_staged_packet_prefix.
Print Assumptions f16_staged_packet_from_values.
