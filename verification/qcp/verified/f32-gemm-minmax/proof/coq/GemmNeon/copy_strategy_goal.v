Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import GemmNeon.LayoutModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition copy_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredfloat32x4_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((p)) # "float32x4_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_float &( ((p)) # "float32x4_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_float &( ((p)) # "float32x4_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_float &( ((p)) # "float32x4_t" ->ₛ "s3")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "float32x4_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "float32x4_t" ->ₛ "s0")))
    ).

Definition copy_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredfloat32x2_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((p)) # "float32x2_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_float &( ((p)) # "float32x2_t" ->ₛ "s1")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "float32x2_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "float32x2_t" ->ₛ "s0")))
    ).

Definition copy_strategy3 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z) (l : (@list fp32)),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((FloatArray.full p n l))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (r : (@list fp32)),
      TT &&
      (“ (l = r) ”) &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full q m r))
      ).

Module Type copy_Strategy_Correct.

  Axiom copy_strategy1_correctness : copy_strategy1.
  Axiom copy_strategy2_correctness : copy_strategy2.
  Axiom copy_strategy3_correctness : copy_strategy3.

End copy_Strategy_Correct.
