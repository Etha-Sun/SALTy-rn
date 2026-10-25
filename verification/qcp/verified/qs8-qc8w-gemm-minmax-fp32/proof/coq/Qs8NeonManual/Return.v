From Coq Require Import ZArith Lia.
From Qs8NeonGoals Require Import G0516.
From Qs8Gemm Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked_return:test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1;right;intros;qs8_normalize2.
 sep_apply(qs8_prefix_done c_pre nc_pre kc_pre A Ps magic offset lo hi).
 opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions checked_return.
