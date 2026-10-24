From Coq Require Import ZArith Lia List.
From F32F16 Require Import RvvNamedCore RvvNamedFacts ArrayMemory.
Local Open Scope Z_scope.
(* A value-preserving packet bridge. All 32 equalities are Coq equality,
   never numerical fp32_eq; the active prefix uses explicit length bounds. *)
Lemma f16_named_packet_prefix : forall (vl:Z)(a:list fp32)(c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31:fp32),
 0<=vl<=32 -> vl<=Zlength a ->
 c0 = f16_rvv_named_core 0 vl a ->
 c1 = f16_rvv_named_core 1 vl a ->
 c2 = f16_rvv_named_core 2 vl a ->
 c3 = f16_rvv_named_core 3 vl a ->
 c4 = f16_rvv_named_core 4 vl a ->
 c5 = f16_rvv_named_core 5 vl a ->
 c6 = f16_rvv_named_core 6 vl a ->
 c7 = f16_rvv_named_core 7 vl a ->
 c8 = f16_rvv_named_core 8 vl a ->
 c9 = f16_rvv_named_core 9 vl a ->
 c10 = f16_rvv_named_core 10 vl a ->
 c11 = f16_rvv_named_core 11 vl a ->
 c12 = f16_rvv_named_core 12 vl a ->
 c13 = f16_rvv_named_core 13 vl a ->
 c14 = f16_rvv_named_core 14 vl a ->
 c15 = f16_rvv_named_core 15 vl a ->
 c16 = f16_rvv_named_core 16 vl a ->
 c17 = f16_rvv_named_core 17 vl a ->
 c18 = f16_rvv_named_core 18 vl a ->
 c19 = f16_rvv_named_core 19 vl a ->
 c20 = f16_rvv_named_core 20 vl a ->
 c21 = f16_rvv_named_core 21 vl a ->
 c22 = f16_rvv_named_core 22 vl a ->
 c23 = f16_rvv_named_core 23 vl a ->
 c24 = f16_rvv_named_core 24 vl a ->
 c25 = f16_rvv_named_core 25 vl a ->
 c26 = f16_rvv_named_core 26 vl a ->
 c27 = f16_rvv_named_core 27 vl a ->
 c28 = f16_rvv_named_core 28 vl a ->
 c29 = f16_rvv_named_core 29 vl a ->
 c30 = f16_rvv_named_core 30 vl a ->
 c31 = f16_rvv_named_core 31 vl a ->
 f16_take vl (f16_pack32
 (f16_rvv_after_named_core 0 vl a c0)
 (f16_rvv_after_named_core 1 vl a c1)
 (f16_rvv_after_named_core 2 vl a c2)
 (f16_rvv_after_named_core 3 vl a c3)
 (f16_rvv_after_named_core 4 vl a c4)
 (f16_rvv_after_named_core 5 vl a c5)
 (f16_rvv_after_named_core 6 vl a c6)
 (f16_rvv_after_named_core 7 vl a c7)
 (f16_rvv_after_named_core 8 vl a c8)
 (f16_rvv_after_named_core 9 vl a c9)
 (f16_rvv_after_named_core 10 vl a c10)
 (f16_rvv_after_named_core 11 vl a c11)
 (f16_rvv_after_named_core 12 vl a c12)
 (f16_rvv_after_named_core 13 vl a c13)
 (f16_rvv_after_named_core 14 vl a c14)
 (f16_rvv_after_named_core 15 vl a c15)
 (f16_rvv_after_named_core 16 vl a c16)
 (f16_rvv_after_named_core 17 vl a c17)
 (f16_rvv_after_named_core 18 vl a c18)
 (f16_rvv_after_named_core 19 vl a c19)
 (f16_rvv_after_named_core 20 vl a c20)
 (f16_rvv_after_named_core 21 vl a c21)
 (f16_rvv_after_named_core 22 vl a c22)
 (f16_rvv_after_named_core 23 vl a c23)
 (f16_rvv_after_named_core 24 vl a c24)
 (f16_rvv_after_named_core 25 vl a c25)
 (f16_rvv_after_named_core 26 vl a c26)
 (f16_rvv_after_named_core 27 vl a c27)
 (f16_rvv_after_named_core 28 vl a c28)
 (f16_rvv_after_named_core 29 vl a c29)
 (f16_rvv_after_named_core 30 vl a c30)
 (f16_rvv_after_named_core 31 vl a c31)) = f16_rvv_values vl a.
Proof.
 intros; subst.
 repeat rewrite f16_pipeline_from_named_core.
 change (f16_take vl (f16_pipeline_packed vl a)=f16_rvv_values vl a).
 apply f16_pipeline_packed_prefix; assumption.
Qed.
Print Assumptions f16_named_packet_prefix.
