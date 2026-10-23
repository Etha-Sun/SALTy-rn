From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy40_correctness : arrays_strategy40.
Proof. pre_process_default; entailer!; sep_apply UCharArray.undef_full_to_undef_seg; entailer!. Qed.
Print Assumptions arrays_strategy40_correctness.
