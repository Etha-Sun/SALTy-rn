From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export annotated_goal NeonKernelPureAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* Every consumer is an exact field of the new block32 RVV actual goal.
   Only generic source mathematical lemmas are migrated; no old NEON goal
   or compiled profile is used. Float numeric self-equality is excluded. *)
Ltac apma_widths:=
 try change(sizeof(FLOAT))with 4 in *;try change(sizeof(UINT))with 4 in *;
 try change(sizeof(PTR))with 8 in *;
 try change(INT_MAX)with 2147483647 in *;try change(INT_MIN)with(-2147483648)in *;
 try change(UINT_MAX)with 4294967295 in *;
 try change(UINT64_MAX)with 18446744073709551615 in *.
Ltac apma_simple:=apb_intro;apma_widths;
 first[solve[apkra_prepare;apkra_pure]|solve[apk_pure]|solve[apkra_pure_goal]].
