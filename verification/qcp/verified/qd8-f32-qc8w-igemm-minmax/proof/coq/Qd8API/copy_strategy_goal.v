Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qd8API.ApiModel Qd8API.Layouts.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition copy_strategy1 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredint8x8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_char &( ((p)) # "int8x8_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "int8x8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "int8x8_t" ->ₛ "s0")))
    ).

Definition copy_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredint16x8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x8_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "int16x8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "int16x8_t" ->ₛ "s0")))
    ).

Definition copy_strategy3 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredint16x4_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((p)) # "int16x4_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x4_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x4_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_short &( ((p)) # "int16x4_t" ->ₛ "s3")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "int16x4_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "int16x4_t" ->ₛ "s0")))
    ).

Definition copy_strategy4 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredint32x4_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((p)) # "int32x4_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_int &( ((p)) # "int32x4_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_int &( ((p)) # "int32x4_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_int &( ((p)) # "int32x4_t" ->ₛ "s3")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "int32x4_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "int32x4_t" ->ₛ "s0")))
    ).

Definition copy_strategy5 :=
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

Definition copy_strategy6 :=
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

Definition copy_strategy7 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvint8mf2_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_char &( ((p)) # "vint8mf2_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "vint8mf2_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_char &( ((q)) # "vint8mf2_t" ->ₛ "s0")))
    ).

Definition copy_strategy8 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvint16m1_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_short &( ((p)) # "vint16m1_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "vint16m1_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_short &( ((q)) # "vint16m1_t" ->ₛ "s0")))
    ).

Definition copy_strategy9 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvint32m2_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_int &( ((p)) # "vint32m2_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vint32m2_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vint32m2_t" ->ₛ "s0")))
    ).

Definition copy_strategy10 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvfloat32m2_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m2_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m2_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m2_t" ->ₛ "s0")))
    ).

Definition copy_strategy11 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvbool16_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool16_t" ->ₛ "s7")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool16_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool16_t" ->ₛ "s0")))
    ).

Definition copy_strategy12 :=
  forall (i : Z) (j : Z) (p : Z) (q : Z) (m : Z) (n : Z) (l : (@list fp32)),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    (“ (i = j) ”) &&
    emp **
    ((qd8_write_state p n i l))
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
      ((qd8_write_state q m j r))
      ).

Module Type copy_Strategy_Correct.

  Axiom copy_strategy1_correctness : copy_strategy1.
  Axiom copy_strategy2_correctness : copy_strategy2.
  Axiom copy_strategy3_correctness : copy_strategy3.
  Axiom copy_strategy4_correctness : copy_strategy4.
  Axiom copy_strategy5_correctness : copy_strategy5.
  Axiom copy_strategy6_correctness : copy_strategy6.
  Axiom copy_strategy7_correctness : copy_strategy7.
  Axiom copy_strategy8_correctness : copy_strategy8.
  Axiom copy_strategy9_correctness : copy_strategy9.
  Axiom copy_strategy10_correctness : copy_strategy10.
  Axiom copy_strategy11_correctness : copy_strategy11.
  Axiom copy_strategy12_correctness : copy_strategy12.

End copy_Strategy_Correct.
