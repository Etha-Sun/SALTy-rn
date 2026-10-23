Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qs8I8Cvt.Model.
Require Import Qs8I8Cvt.Types.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition signed_tail_strategy1 :=
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

Definition signed_tail_strategy2 :=
  forall (q : Z) (p : Z) (i : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))) ”) &&
    emp **
    ((poly_undef_store FET_char (Z.add p (Z.mul i (@sizeof_front_end_type FET_char)))))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar q)) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar q))
    ).

Module Type signed_tail_Strategy_Correct.

  Axiom signed_tail_strategy1_correctness : signed_tail_strategy1.
  Axiom signed_tail_strategy2_correctness : signed_tail_strategy2.

End signed_tail_Strategy_Correct.
