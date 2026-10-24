From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmemory02 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_6:rvv_goal.test_rvv_which_implies_wit_6.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_6;left;intros.
 subst a0;rewrite ?sizeof_float;prop_apply FloatArray.full_Zlength;Intros.
 assert(E:Znth ((kc_pre-k)÷4) (input_window Blocks Refs (kc_pre÷4) ((ks_pre-p)÷8)) __default_fp32 = Znth ((kc_pre-k)÷4) (input_window Blocks Refs (kc_pre÷4) ((ks_pre-p)÷8)) fp32_zero).
 { apply Znth_indep;lia. }
 rewrite E;igemm_borrow;igemm_restore;entailer!.

Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_6.
