From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Layout u8_copy_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <:u8_copy_Strategy_Correct.
Lemma u8_copy_strategy1_correctness:u8_copy_strategy1.
Proof. pre_process_default;subst q;unfold UndefStructPreduint8x8_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
Lemma u8_copy_strategy2_correctness:u8_copy_strategy2.
Proof. pre_process_default;subst q;unfold UndefStructPreduint8x16_t;entailer!;apply_sepcon_adjoint;entailer!. Qed.
End Checked.
Print Assumptions Checked.u8_copy_strategy1_correctness.
Print Assumptions Checked.u8_copy_strategy2_correctness.
