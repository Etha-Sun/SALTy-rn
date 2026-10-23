From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy220_correctness : arrays_strategy220.
Proof. pre_process_default; subst q; entailer!; subst n; sep_apply UCharArray.undef_seg_to_undef_full; unfold StoreUCharAsElement.sizeA; rewrite sizeof_uchar; entailer!. Qed.
Print Assumptions arrays_strategy220_correctness.
