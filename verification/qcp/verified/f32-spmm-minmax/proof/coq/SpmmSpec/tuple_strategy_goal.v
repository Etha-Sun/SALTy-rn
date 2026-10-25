Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import SpmmSpec.TupleMemory.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition tuple_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = &( ((p)) # "float32x4x2_t" ->ₛ "val")) ”) &&
    emp **
    ((UndefStructPredfloat32x4x2_t p))
    |--
    (
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2))
    ) ** (
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full q 2)) -*
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full q 2))
    ).

Definition tuple_strategy2 :=
  forall (p : Z) (L : (@list Recordfloat32x4_t)),
    TT &&
    emp **
    ((Structfloat32x4_tArray.full p 2 L))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (K : (@list Recordfloat32x4_t)),
      TT &&
      (“ (L = K) ”) &&
      emp -*
      TT &&
      emp **
      ((Structfloat32x4_tArray.full p 2 K))
      ).

Definition tuple_strategy3 :=
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

Definition tuple_strategy4 :=
  forall (p : Z) (L : (@list Recordfloat32x4_t)),
    TT &&
    emp **
    ((Structfloat32x4_tArray.full p 2 L))
    |--
    (
    TT &&
    emp **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") ( f0 ( tuple_at 0 L)))) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s1") ( f1 ( tuple_at 0 L)))) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s2") ( f2 ( tuple_at 0 L)))) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s3") ( f3 ( tuple_at 0 L)))) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") ( f0 ( tuple_at 1 L)))) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s1") ( f1 ( tuple_at 1 L)))) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s2") ( f2 ( tuple_at 1 L)))) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s3") ( f3 ( tuple_at 1 L))))
    ) ** (
    ALL (v : fp32),
      TT &&
      emp **
      ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") v)) -*
      TT &&
      emp **
      ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") v))
      ).

Definition tuple_strategy5 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z),
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2)) -*
    TT &&
    emp **
    ((UndefStructPredfloat32x4x2_t p))
    ).

Definition tuple_strategy6 :=
  forall (p : Z) (L : (@list Recordfloat32x4_t)),
    TT &&
    emp **
    ((Structfloat32x4_tArray.full p 2 L))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full p 2))
    ).

Definition tuple_strategy7 :=
  forall (x2 : fp32) (x0 : fp32) (x1 : fp32) (x3 : fp32) (p : Z),
    TT &&
    emp **
    ((store_float &( ((p)) # "float32x4_t" ->ₛ "s0") x0)) **
    ((store_float &( ((p)) # "float32x4_t" ->ₛ "s1") x1)) **
    ((store_float &( ((p)) # "float32x4_t" ->ₛ "s2") x2)) **
    ((store_float &( ((p)) # "float32x4_t" ->ₛ "s3") x3))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredfloat32x4_t p))
    ).

Definition tuple_strategy8 :=
  forall (x12 : fp32) (x10 : fp32) (x02 : fp32) (x00 : fp32) (x01 : fp32) (x03 : fp32) (x11 : fp32) (x13 : fp32) (p : Z),
    TT &&
    emp **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") x00)) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s1") x01)) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s2") x02)) **
    ((store_float &( (((Z.add p (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s3") x03)) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") x10)) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s1") x11)) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s2") x12)) **
    ((store_float &( (((Z.add p (Z.mul 1 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s3") x13))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full p 2))
    ).

Definition tuple_strategy11 :=
  forall (p : Z) (V : Recordfloat32x4x2_t),
    TT &&
    emp **
    ((StructPredfloat32x4x2_t p V))
    |--
    (
    TT &&
    emp **
    ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 ( tuple_values V)))
    ) ** (
    ALL (K : (@list Recordfloat32x4_t)),
      TT &&
      emp **
      ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 K)) -*
      TT &&
      emp **
      ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 K))
      ).

Definition tuple_strategy13 :=
  forall (p : Z) (V : Recordfloat32x4x2_t),
    TT &&
    emp **
    ((StructPredfloat32x4x2_t p V))
    |--
    (
    TT &&
    emp **
    ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 ( tuple_values V)))
    ) ** (
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2)) -*
    TT &&
    emp **
    ((Structfloat32x4_tArray.undef_full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2))
    ).

Definition tuple_strategy14 :=
  forall (p : Z) (V : Recordfloat32x4x2_t),
    TT &&
    emp **
    ((StructPredfloat32x4x2_t p V))
    |--
    (
    TT &&
    emp **
    ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 ( tuple_values V)))
    ) ** (
    ALL (v : fp32),
      TT &&
      emp **
      ((store_float &( (((Z.add &( ((p)) # "float32x4x2_t" ->ₛ "val") (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") v)) -*
      TT &&
      emp **
      ((store_float &( (((Z.add &( ((p)) # "float32x4x2_t" ->ₛ "val") (Z.mul 0 (@sizeof_front_end_type (FET_alias ("float32x4_t"))))))) # "float32x4_t" ->ₛ "s0") v))
      ).

Definition tuple_strategy12 :=
  forall (p : Z) (L : (@list Recordfloat32x4_t)),
    TT &&
    emp **
    ((Structfloat32x4_tArray.full &( ((p)) # "float32x4x2_t" ->ₛ "val") 2 L))
    |--
    (
    TT &&
    emp **
    ((StructPredfloat32x4x2_t p ( tuple_record L)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Module Type tuple_Strategy_Correct.

  Axiom tuple_strategy1_correctness : tuple_strategy1.
  Axiom tuple_strategy2_correctness : tuple_strategy2.
  Axiom tuple_strategy3_correctness : tuple_strategy3.
  Axiom tuple_strategy4_correctness : tuple_strategy4.
  Axiom tuple_strategy5_correctness : tuple_strategy5.
  Axiom tuple_strategy6_correctness : tuple_strategy6.
  Axiom tuple_strategy7_correctness : tuple_strategy7.
  Axiom tuple_strategy8_correctness : tuple_strategy8.
  Axiom tuple_strategy11_correctness : tuple_strategy11.
  Axiom tuple_strategy13_correctness : tuple_strategy13.
  Axiom tuple_strategy14_correctness : tuple_strategy14.
  Axiom tuple_strategy12_correctness : tuple_strategy12.

End tuple_Strategy_Correct.
