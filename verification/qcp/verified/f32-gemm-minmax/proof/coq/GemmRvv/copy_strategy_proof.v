From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import Model copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <:copy_Strategy_Correct.
Lemma copy_strategy1_correctness:copy_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredvfloat32m4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy2_correctness:copy_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPredvbool8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy3_correctness:copy_strategy3.
Proof. pre_process_default;subst q;subst m;sep_apply (FloatArray.full_to_undef_full p n l);entailer!. Qed.
Lemma copy_strategy4_correctness:copy_strategy4.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
End Checked.
Print Assumptions Checked.copy_strategy1_correctness.
Print Assumptions Checked.copy_strategy2_correctness.
Print Assumptions Checked.copy_strategy3_correctness.
Print Assumptions Checked.copy_strategy4_correctness.
