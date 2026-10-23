Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import FullU8.Packed32Layout.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition packed_copy_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvuint8m8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w0"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w1"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w2"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w3"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w4"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w5"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w6"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w7"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w8"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w9"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w10"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w11"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w12"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w13"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w14"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w15"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w16"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w17"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w18"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w19"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w20"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w21"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w22"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w23"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w24"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w25"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w26"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w27"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w28"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w29"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w30"))) **
    ((poly_undef_store FET_uint &( ((p)) # "vuint8m8_t" ->ₛ "w31")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uint &( ((q)) # "vuint8m8_t" ->ₛ "w0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uint &( ((q)) # "vuint8m8_t" ->ₛ "w0")))
    ).

Module Type packed_copy_Strategy_Correct.

  Axiom packed_copy_strategy1_correctness : packed_copy_strategy1.

End packed_copy_Strategy_Correct.
