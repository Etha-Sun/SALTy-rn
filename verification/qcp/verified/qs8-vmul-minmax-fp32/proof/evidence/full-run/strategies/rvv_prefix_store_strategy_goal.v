Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Require Import Qs8Mul.VectorValues.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_prefix_store_strategy1 :=
  forall (r : Z) (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (Z.le 0 r) ”) &&
    (“ (Z.le r n) ”) &&
    emp **
    ((CharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((CharArray.undef_full (Z.add p (Z.mul r (@sizeof_front_end_type FET_char))) (Z.sub n r)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((CharArray.undef_full q r))
    ).

Module Type rvv_prefix_store_Strategy_Correct.

  Axiom rvv_prefix_store_strategy1_correctness : rvv_prefix_store_strategy1.

End rvv_prefix_store_Strategy_Correct.
