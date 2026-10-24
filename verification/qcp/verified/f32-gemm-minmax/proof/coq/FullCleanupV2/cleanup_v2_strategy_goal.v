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

Definition cleanup_v2_strategy1 :=
  forall (q : Z) (p : Z) (x6 : fp32) (x4 : fp32) (x2 : fp32) (x0 : fp32) (x1 : fp32) (x3 : fp32) (x5 : fp32) (x7 : fp32),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s0") x0)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s1") x1)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s2") x2)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s3") x3)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s4") x4)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s5") x5)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s6") x6)) **
    ((store_float &( ((p)) # "vfloat32m4_t" ->ₛ "s7") x7))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredvfloat32m4_t q))
    ).

Definition cleanup_v2_strategy2 :=
  forall (q : Z) (p : Z) (x6 : Z) (x4 : Z) (x2 : Z) (x0 : Z) (x1 : Z) (x3 : Z) (x5 : Z) (x7 : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s0") x0)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s1") x1)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s2") x2)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s3") x3)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s4") x4)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s5") x5)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s6") x6)) **
    ((poly_store FET_int &( ((p)) # "vbool8_t" ->ₛ "s7") x7))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UndefStructPredvbool8_t q))
    ).

Module Type cleanup_v2_Strategy_Correct.

  Axiom cleanup_v2_strategy1_correctness : cleanup_v2_strategy1.
  Axiom cleanup_v2_strategy2_correctness : cleanup_v2_strategy2.

End cleanup_v2_Strategy_Correct.
