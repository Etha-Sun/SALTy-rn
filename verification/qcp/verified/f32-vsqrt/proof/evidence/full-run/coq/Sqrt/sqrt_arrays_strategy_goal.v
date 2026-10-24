Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpVadd.VaddBits.
Require Import Sqrt.Types Sqrt.Pack Sqrt.Borrowed.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition sqrt_arrays_strategy1 :=
  forall (m : Z) (n : Z) (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 m) ”) &&
    (“ (Z.le m n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_full (Z.add p (Z.mul m (@sizeof_front_end_type FET_float))) (Z.sub n m)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.undef_full q m))
    ).

Module Type sqrt_arrays_Strategy_Correct.

  Axiom sqrt_arrays_strategy1_correctness : sqrt_arrays_strategy1.

End sqrt_arrays_Strategy_Correct.
