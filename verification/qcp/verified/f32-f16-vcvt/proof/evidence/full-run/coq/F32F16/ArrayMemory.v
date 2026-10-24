From Coq Require Import ZArith Lia List.
From F32F16 Require Export ProgramModel ProgramFacts RvvResult.
From QcpRvv32 Require Export RvvLoopMemory.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma f16_ushort_prefix_append : forall p k r (P Q:list Z),0<=k -> 0<=r ->
 UShortArray.seg p 0 k P ** UShortArray.full(p+k*sizeof(USHORT))r Q |-- UShortArray.seg p 0(k+r)(P++Q).
Proof.
 intros p k r P Q Hk Hr.
 sep_apply(UShortArray.full_to_seg(p+k*sizeof(USHORT))r Q).
 rewrite <- (UShortArray.seg_shift p k 0 r Q).
 replace(k+0)with k by lia.
 assert(Hbound:0<=k<=k+r)by lia.
 sep_apply(UShortArray.seg_merge_to_seg p 0 k(k+r) P Q Hbound).
 entailer!.
Qed.
Lemma f16_ushort_prefix_finish : forall p n (P:list Z),
 UShortArray.seg p 0 n P ** UShortArray.undef_seg p n n |-- UShortArray.full p n P.
Proof. intros;rewrite UShortArray.undef_seg_empty;sep_apply(UShortArray.seg_to_full p 0 n P);replace(p+0*sizeof(USHORT))with p by lia;rewrite Z.sub_0_r;entailer!. Qed.
Definition f16_pipeline_packed(vl:Z)(a:list fp32):list Z:=
 f16_pack32
 (f16_pipeline 0 vl a)
 (f16_pipeline 1 vl a)
 (f16_pipeline 2 vl a)
 (f16_pipeline 3 vl a)
 (f16_pipeline 4 vl a)
 (f16_pipeline 5 vl a)
 (f16_pipeline 6 vl a)
 (f16_pipeline 7 vl a)
 (f16_pipeline 8 vl a)
 (f16_pipeline 9 vl a)
 (f16_pipeline 10 vl a)
 (f16_pipeline 11 vl a)
 (f16_pipeline 12 vl a)
 (f16_pipeline 13 vl a)
 (f16_pipeline 14 vl a)
 (f16_pipeline 15 vl a)
 (f16_pipeline 16 vl a)
 (f16_pipeline 17 vl a)
 (f16_pipeline 18 vl a)
 (f16_pipeline 19 vl a)
 (f16_pipeline 20 vl a)
 (f16_pipeline 21 vl a)
 (f16_pipeline 22 vl a)
 (f16_pipeline 23 vl a)
 (f16_pipeline 24 vl a)
 (f16_pipeline 25 vl a)
 (f16_pipeline 26 vl a)
 (f16_pipeline 27 vl a)
 (f16_pipeline 28 vl a)
 (f16_pipeline 29 vl a)
 (f16_pipeline 30 vl a)
 (f16_pipeline 31 vl a).
Lemma f16_pipeline_packed_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a -> f16_take vl(f16_pipeline_packed vl a)=f16_rvv_values vl a.
Proof. exact f16_pipeline_prefix. Qed.
Print Assumptions f16_ushort_prefix_append.
Print Assumptions f16_ushort_prefix_finish.
Print Assumptions f16_pipeline_packed_prefix.
