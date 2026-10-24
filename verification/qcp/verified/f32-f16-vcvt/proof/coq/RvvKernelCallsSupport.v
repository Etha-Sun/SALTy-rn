From Coq Require Import ZArith Lia List.
From F32F16 Require Export RvvKernelSupport RvvStages RvvNamedCore
 RvvNamedFacts RvvNamedPack RvvStagesPack RvvFloatStagesFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Stop at a separation-logic entailment before introducing its semantic heap.
   In particular, never use an unguarded [left] on an entailment whose RHS is
   an assertion disjunction. This only selects a genuine outer Prop disjunct. *)
Ltac f16_rvv_intro_binders :=
 lazymatch goal with
 | |- ?P |-- ?Q => idtac
 | |- forall x : ?T, _ => intro; f16_rvv_intro_binders
 | |- ?P \/ ?Q => first[left;f16_rvv_intro_binders|right;f16_rvv_intro_binders]
 | _ => idtac
 end.
Ltac f16_rvv_delta_stage_once :=
 first[
 match goal with |- context[f16_stage_20]=>unfold f16_stage_20 end
 |match goal with |- context[f16_stage_19]=>unfold f16_stage_19 end
 |match goal with |- context[f16_stage_18]=>unfold f16_stage_18 end
 |match goal with |- context[f16_stage_17]=>unfold f16_stage_17 end
 |match goal with |- context[f16_stage_16]=>unfold f16_stage_16 end
 |match goal with |- context[f16_stage_15]=>unfold f16_stage_15 end
 |match goal with |- context[f16_stage_14]=>unfold f16_stage_14 end
 |match goal with |- context[f16_stage_13]=>unfold f16_stage_13 end
 |match goal with |- context[f16_stage_12]=>unfold f16_stage_12 end
 |match goal with |- context[f16_stage_11]=>unfold f16_stage_11 end
 |match goal with |- context[f16_stage_10]=>unfold f16_stage_10 end
 |match goal with |- context[f16_stage_9]=>unfold f16_stage_9 end
 |match goal with |- context[f16_stage_8]=>unfold f16_stage_8 end
 |match goal with |- context[f16_stage_7]=>unfold f16_stage_7 end
 |match goal with |- context[f16_stage_6]=>unfold f16_stage_6 end
 |match goal with |- context[f16_stage_5]=>unfold f16_stage_5 end
 |match goal with |- context[f16_stage_4]=>unfold f16_stage_4 end
 |match goal with |- context[f16_stage_3]=>unfold f16_stage_3 end
 |match goal with |- context[f16_stage_2]=>unfold f16_stage_2 end
 |match goal with |- context[f16_stage_1]=>unfold f16_stage_1 end
 |match goal with |- context[f16_stage_0]=>unfold f16_stage_0 end].
Ltac f16_rvv_call_finish :=
 f16_rvv_intro_binders;f16_rvv_prepare;
 first[solve[apply derivable1_refl]|solve[f16_rvv_finish]
 |solve[f16_rvv_which]].
