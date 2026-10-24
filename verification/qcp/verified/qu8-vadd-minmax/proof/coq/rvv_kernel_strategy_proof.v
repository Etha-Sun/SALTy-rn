From Coq Require Import ZArith Lia.
From Qu8Add Require Import RvvMemoryModel rvv_kernel_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvKernelStrategy : Qu8Add.rvv_kernel_strategy_goal.rvv_kernel_Strategy_Correct.
Lemma rvv_kernel_strategy1_correctness : Qu8Add.rvv_kernel_strategy_goal.rvv_kernel_strategy1.
Proof.
 pre_process_default;subst q.
 sep_apply_l_atomic(UCharArray.undef_full_split_to_undef_full p m n).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic(UCharArray.undef_full_to_undef_seg p m).
   rewrite sizeof_uchar;entailer!;apply_sepcon_adjoint;entailer!.
Qed.
End CheckedRvvKernelStrategy.
