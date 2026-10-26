From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APBlockMainControlSupport NeonKernelCallFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Literal equalities from this actual path only; no change to memory maps. *)
Ltac apbm_call_frame:=apb_intro;apkc_normalize_state;
 first[solve[apbmc_frame]|apk_fold_float_values;apbmc_frame].
