Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import GemmRvv.Model.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition copy_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvfloat32m4_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m4_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m4_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m4_t" ->ₛ "s0")))
    ).

Definition copy_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvbool8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool8_t" ->ₛ "s0")))
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
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.undef_full q m))
    ).

Definition copy_strategy4 :=
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
  Axiom copy_strategy4_correctness : copy_strategy4.

End copy_Strategy_Correct.
