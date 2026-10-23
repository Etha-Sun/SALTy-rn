Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpRvv32.RvvLoopModel.
Require Import QcpRvv32.RvvStoreModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_loop_strategy1 :=
  forall (count : Z) (lo : Z) (hi : Z),
    TT &&
    (“ (lo = 0) ”) &&
    (“ (hi = 0) ”) &&
    (“ (count = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (b : (@list fp32)) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.seg p lo hi ( vadd_values count a b)))
      ).

Definition rvv_loop_strategy2 :=
  forall (hi : Z) (n : Z) (p : Z) (q : Z) (lo : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = 0) ”) &&
    (“ (hi = n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.undef_seg q lo hi))
    ).

Module Type rvv_loop_Strategy_Correct.

  Axiom rvv_loop_strategy1_correctness : rvv_loop_strategy1.
  Axiom rvv_loop_strategy2_correctness : rvv_loop_strategy2.

End rvv_loop_Strategy_Correct.
