From Coq Require Export ZArith Lia String.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qu8Add Require Export Types ByteBridge unsigned_tail_goal unsigned_tail_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac qu_tail_frame := unfold UndefStructPreduint8x8_t; rewrite ?byte_typed_field_address; entailer!.
