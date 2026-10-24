From Coq Require Import ZArith Lia List.
From F32F16 Require Import RvvStages RvvNamedCore RvvNamedFacts RvvResult.
Local Open Scope Z_scope.
Lemma f16_stage9_named_core : forall i vl a,
 f16_stage_9 i vl a=f16_rvv_named_core i vl a.
Proof.
 intros;unfold f16_stage_9,f16_stage_8,f16_stage_7,f16_stage_6,f16_stage_5,
 f16_stage_4,f16_stage_3,f16_stage_2,f16_stage_1,f16_stage_0,f16_rvv_named_core;
 reflexivity.
Qed.
Lemma f16_pipeline_from_float_stage : forall i vl a f,
 f=f16_stage_9 i vl a ->
 f16_rvv_after_named_core i vl a f=f16_pipeline i vl a.
Proof. intros;subst;rewrite f16_stage9_named_core;apply f16_pipeline_from_named_core. Qed.
Print Assumptions f16_stage9_named_core.
Print Assumptions f16_pipeline_from_float_stage.
