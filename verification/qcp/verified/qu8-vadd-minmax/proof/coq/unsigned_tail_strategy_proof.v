From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Add Require Import Types unsigned_tail_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedUnsignedTailStrategy <: Qu8Add.unsigned_tail_strategy_goal.unsigned_tail_Strategy_Correct.
Lemma unsigned_tail_strategy1_correctness : Qu8Add.unsigned_tail_strategy_goal.unsigned_tail_strategy1.
Proof. pre_process_default; subst q; unfold UndefStructPreduint8x8_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
Lemma unsigned_tail_strategy2_correctness : Qu8Add.unsigned_tail_strategy_goal.unsigned_tail_strategy2.
Proof. pre_process_default; cbn [sizeof_front_end_type]; entailer!. change ((p+i*1) # UChar |->_ |-- (p+i*1) # UChar |->_ ** (q # UChar |->_ -* q # UChar |->_)). entailer!; apply_sepcon_adjoint; entailer!. Qed.
End CheckedUnsignedTailStrategy.
