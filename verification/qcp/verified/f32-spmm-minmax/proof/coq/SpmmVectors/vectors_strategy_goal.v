Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import SpmmSpec.TupleMemory.
Require Import GemmSpec.FmaModel.
Require Import SpmmSpec.Model SpmmSpec.Vectors.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition vectors_strategy1 :=
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

Definition vectors_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvfloat32m8_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s7"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s8"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s9"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s10"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s11"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s12"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s13"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s14"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s15"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s16"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s17"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s18"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s19"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s20"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s21"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s22"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s23"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s24"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s25"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s26"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s27"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s28"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s29"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s30"))) **
    ((poly_undef_store FET_float &( ((p)) # "vfloat32m8_t" ->ₛ "s31")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m8_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_float &( ((q)) # "vfloat32m8_t" ->ₛ "s0")))
    ).

Definition vectors_strategy3 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UndefStructPredvbool4_t p))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s0"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s1"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s2"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s3"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s4"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s5"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s6"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s7"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s8"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s9"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s10"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s11"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s12"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s13"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s14"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s15"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s16"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s17"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s18"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s19"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s20"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s21"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s22"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s23"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s24"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s25"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s26"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s27"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s28"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s29"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s30"))) **
    ((poly_undef_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s31")))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool4_t" ->ₛ "s0"))) -*
    TT &&
    emp **
    ((poly_undef_store FET_int &( ((q)) # "vbool4_t" ->ₛ "s0")))
    ).

Definition vectors_strategy4 :=
  forall (q : Z) (p : Z) (x0 : fp32) (x1 : fp32),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((store_float &( ((p)) # "float32x2_t" ->ₛ "s0") x0)) **
    ((store_float &( ((p)) # "float32x2_t" ->ₛ "s1") x1))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredfloat32x2_t q))
    ).

Definition vectors_strategy5 :=
  forall (q : Z) (p : Z) (x2 : fp32) (x0 : fp32) (x1 : fp32) (x3 : fp32),
    TT &&
    (“ (q = p) ”) &&
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
    ((UndefStructPredfloat32x4_t q))
    ).

Definition vectors_strategy6 :=
  forall (q : Z) (p : Z) (x30 : fp32) (x28 : fp32) (x26 : fp32) (x24 : fp32) (x22 : fp32) (x20 : fp32) (x18 : fp32) (x16 : fp32) (x14 : fp32) (x12 : fp32) (x10 : fp32) (x8 : fp32) (x6 : fp32) (x4 : fp32) (x2 : fp32) (x0 : fp32) (x1 : fp32) (x3 : fp32) (x5 : fp32) (x7 : fp32) (x9 : fp32) (x11 : fp32) (x13 : fp32) (x15 : fp32) (x17 : fp32) (x19 : fp32) (x21 : fp32) (x23 : fp32) (x25 : fp32) (x27 : fp32) (x29 : fp32) (x31 : fp32),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s0") x0)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s1") x1)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s2") x2)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s3") x3)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s4") x4)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s5") x5)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s6") x6)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s7") x7)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s8") x8)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s9") x9)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s10") x10)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s11") x11)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s12") x12)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s13") x13)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s14") x14)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s15") x15)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s16") x16)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s17") x17)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s18") x18)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s19") x19)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s20") x20)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s21") x21)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s22") x22)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s23") x23)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s24") x24)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s25") x25)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s26") x26)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s27") x27)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s28") x28)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s29") x29)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s30") x30)) **
    ((store_float &( ((p)) # "vfloat32m8_t" ->ₛ "s31") x31))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredvfloat32m8_t q))
    ).

Definition vectors_strategy7 :=
  forall (q : Z) (p : Z) (x30 : Z) (x28 : Z) (x26 : Z) (x24 : Z) (x22 : Z) (x20 : Z) (x18 : Z) (x16 : Z) (x14 : Z) (x12 : Z) (x10 : Z) (x8 : Z) (x6 : Z) (x4 : Z) (x2 : Z) (x0 : Z) (x1 : Z) (x3 : Z) (x5 : Z) (x7 : Z) (x9 : Z) (x11 : Z) (x13 : Z) (x15 : Z) (x17 : Z) (x19 : Z) (x21 : Z) (x23 : Z) (x25 : Z) (x27 : Z) (x29 : Z) (x31 : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s0") x0)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s1") x1)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s2") x2)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s3") x3)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s4") x4)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s5") x5)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s6") x6)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s7") x7)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s8") x8)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s9") x9)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s10") x10)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s11") x11)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s12") x12)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s13") x13)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s14") x14)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s15") x15)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s16") x16)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s17") x17)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s18") x18)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s19") x19)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s20") x20)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s21") x21)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s22") x22)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s23") x23)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s24") x24)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s25") x25)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s26") x26)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s27") x27)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s28") x28)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s29") x29)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s30") x30)) **
    ((poly_store FET_int &( ((p)) # "vbool4_t" ->ₛ "s31") x31))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredvbool4_t q))
    ).

Module Type vectors_Strategy_Correct.

  Axiom vectors_strategy1_correctness : vectors_strategy1.
  Axiom vectors_strategy2_correctness : vectors_strategy2.
  Axiom vectors_strategy3_correctness : vectors_strategy3.
  Axiom vectors_strategy4_correctness : vectors_strategy4.
  Axiom vectors_strategy5_correctness : vectors_strategy5.
  Axiom vectors_strategy6_correctness : vectors_strategy6.
  Axiom vectors_strategy7_correctness : vectors_strategy7.

End vectors_Strategy_Correct.
