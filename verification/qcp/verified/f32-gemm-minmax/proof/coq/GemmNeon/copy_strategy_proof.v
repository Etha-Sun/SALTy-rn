From SimpleC.SL Require Import SeparationLogic.
From GemmNeon Require Import LayoutModel copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Lemma copy_strategy1_correctness : copy_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPredfloat32x4_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma copy_strategy2_correctness : copy_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPredfloat32x2_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Print Assumptions copy_strategy1_correctness.
Print Assumptions copy_strategy2_correctness.

Lemma copy_strategy3_correctness : copy_strategy3.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
Print Assumptions copy_strategy3_correctness.
