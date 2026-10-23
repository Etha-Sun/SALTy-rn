From SimpleC.SL Require Import Mem SeparationLogic.
From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export LreluKernelSupport LreluRvvKernelFacts KernelArrayFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qlr_rvv_mask_math :=
 repeat multimatch goal with
 | |- ?P |-- ?Q =>
   multimatch Q with context[qlr_active_mask ?a ?b ?i ?vl]=>
    tryif match goal with H:0<=qlr_active_mask a b i vl<=1 |- _=>idtac end
    then fail 0 else pose proof(qlr_active_mask_range a b i vl)
   end
 end.
Ltac qlr_rvv_close := qlr_rvv_mask_math;
 first[solve[qcv_neon_bit_close]|qcv_rvv_split_output].
