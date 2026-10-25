From Qs8Mul Require Import Model qm_exact_undef_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedExactUndef : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_Strategy_Correct.
Lemma qm_exact_undef_strategy1_correctness : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_strategy1.
Proof. pre_process_default;entailer!. Qed.
Lemma qm_exact_undef_strategy2_correctness : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_strategy2.
Proof. pre_process_default;entailer!. Qed.
Lemma qm_exact_undef_strategy3_correctness : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_strategy3.
Proof. pre_process_default;entailer!. Qed.
Lemma qm_exact_undef_strategy4_correctness : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_strategy4.
Proof. pre_process_default;entailer!. Qed.
End CheckedExactUndef.
Module ExactUndefGate : Qs8Mul.qm_exact_undef_strategy_goal.qm_exact_undef_Strategy_Correct := CheckedExactUndef.
Print Assumptions ExactUndefGate.qm_exact_undef_strategy1_correctness.
Print Assumptions ExactUndefGate.qm_exact_undef_strategy2_correctness.
Print Assumptions ExactUndefGate.qm_exact_undef_strategy3_correctness.
Print Assumptions ExactUndefGate.qm_exact_undef_strategy4_correctness.
