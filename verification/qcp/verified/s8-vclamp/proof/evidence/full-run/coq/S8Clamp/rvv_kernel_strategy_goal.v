Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import S8Clamp.Types.
Require Import S8Clamp.MemoryModel.
Require Import S8Clamp.ProgramModel.
Require Import S8Clamp.RvvKernelModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_kernel_strategy1 :=
  forall (m : Z) (n : Z) (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 m) ”) &&
    (“ (Z.le m n) ”) &&
    emp **
    ((CharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((CharArray.undef_full (Z.add p (Z.mul m (@sizeof_front_end_type FET_char))) (Z.sub n m)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((CharArray.undef_full q m))
    ).

Module Type rvv_kernel_Strategy_Correct.

  Axiom rvv_kernel_strategy1_correctness : rvv_kernel_strategy1.

End rvv_kernel_Strategy_Correct.
