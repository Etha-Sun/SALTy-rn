From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Add Require Import Types signed_tail_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedSignedTailStrategy <: Qs8Add.signed_tail_strategy_goal.signed_tail_Strategy_Correct.
Lemma signed_tail_strategy1_correctness : Qs8Add.signed_tail_strategy_goal.signed_tail_strategy1.
Proof. pre_process_default; subst q; unfold UndefStructPreduint8x8_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
Lemma signed_tail_strategy2_correctness : Qs8Add.signed_tail_strategy_goal.signed_tail_strategy2.
Proof. pre_process_default; cbn [sizeof_front_end_type]; entailer!. change ((p+i*1) # UChar |->_ |-- (p+i*1) # UChar |->_ ** (q # UChar |->_ -* q # UChar |->_)). entailer!; apply_sepcon_adjoint; entailer!. Qed.
End CheckedSignedTailStrategy.
