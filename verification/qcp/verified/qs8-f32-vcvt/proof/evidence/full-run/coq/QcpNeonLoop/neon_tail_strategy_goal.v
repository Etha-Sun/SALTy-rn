Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpVadd.VaddBits.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition neon_tail_strategy1 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 2 n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_seg p 2 n))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float (Z.add q (Z.mul 0 (@sizeof_front_end_type FET_float))))) **
    ((poly_undef_store FET_float (Z.add q (Z.mul 1 (@sizeof_front_end_type FET_float)))))
    ).

Definition neon_tail_strategy2 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 1 n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_seg p 1 n))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float q))
    ).

Definition neon_tail_strategy3 :=
  forall (lo : Z) (hi : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul lo (@sizeof_front_end_type FET_float)))) ”) &&
    (“ (Z.lt lo hi) ”) &&
    emp **
    ((FloatArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_seg p (Z.add lo 1) hi))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float q))
    ).

Module Type neon_tail_Strategy_Correct.

  Axiom neon_tail_strategy1_correctness : neon_tail_strategy1.
  Axiom neon_tail_strategy2_correctness : neon_tail_strategy2.
  Axiom neon_tail_strategy3_correctness : neon_tail_strategy3.

End neon_tail_Strategy_Correct.
