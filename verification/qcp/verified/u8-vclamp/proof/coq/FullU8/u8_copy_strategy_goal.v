Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import FullU8.Layout.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition u8_copy_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPreduint8x8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_uchar &( ((p)) # "uint8x8_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((q)) # "uint8x8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((q)) # "uint8x8_t" ->ₛ "s0")))
    ).

Definition u8_copy_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPreduint8x16_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s7"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_uchar &( ((&( ((p)) # "uint8x16_t" ->ₛ "high"))) # "uint8x8_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((&( ((q)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar &( ((&( ((q)) # "uint8x16_t" ->ₛ "low"))) # "uint8x8_t" ->ₛ "s0")))
    ).

Module Type u8_copy_Strategy_Correct.

  Axiom u8_copy_strategy1_correctness : u8_copy_strategy1.
  Axiom u8_copy_strategy2_correctness : u8_copy_strategy2.

End u8_copy_Strategy_Correct.
