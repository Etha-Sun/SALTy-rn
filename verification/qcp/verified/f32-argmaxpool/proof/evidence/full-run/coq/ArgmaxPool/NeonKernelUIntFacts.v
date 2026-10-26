From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelPureAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma ap_uint_cell_bytes:sizeof(UINT)=4.
Proof. reflexivity. Qed.
Ltac apkru_pure_goal:=rewrite ?ap_uint_cell_bytes in *;apkra_pure_goal.
Print Assumptions ap_uint_cell_bytes.
