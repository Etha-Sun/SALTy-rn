From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelUIntFacts NeonKernelCompactFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac apka_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apkra_pure]|apply _derivable1_andp_intros;[apkra_pure|apkcf_spatial]|apkcf_spatial].
Ltac apka_call_goal:=apb_intro;rewrite ?ap_uint_cell_bytes in *;
 apkc_normalize_state;apkra_prepare;
 first[solve[exfalso;lia]|solve[apka_frame]|apk_fold_float_values;apka_frame].
