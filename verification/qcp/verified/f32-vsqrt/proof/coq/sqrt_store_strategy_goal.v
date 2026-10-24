Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpVadd.VaddBits.
Require Import Sqrt.Types Sqrt.Pack.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition sqrt_store_strategy1 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_float)))) ”) &&
    (“ (Z.lt 0 n) ”) &&
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

Module Type sqrt_store_Strategy_Correct.

  Axiom sqrt_store_strategy1_correctness : sqrt_store_strategy1.

End sqrt_store_Strategy_Correct.
