Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpVadd.VaddBits.
Require Import QcpNeon.NeonBridge.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition neon_bridge_strategy1 :=
  forall (n : Z) (p : Z) (q : Z) (l : (@list fp32)),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 4 n) ”) &&
    emp **
    ((FloatArray.full p n l))
    |--
    (
    TT &&
    emp **
    ((FloatArray.seg p 4 n ( fp32_slice 4 n l)))
    ) ** (
    ALL (x3 : fp32) (__default_fp32 : fp32) (x1 : fp32) (x0 : fp32) (x2 : fp32),
      TT &&
      (“ (x0 = (Znth 0 l __default_fp32)) ”) &&
      (“ (x1 = (Znth 1 l __default_fp32)) ”) &&
      (“ (x2 = (Znth 2 l __default_fp32)) ”) &&
      (“ (x3 = (Znth 3 l __default_fp32)) ”) &&
      emp -*
      TT &&
      emp **
      ((store_float (Z.add q (Z.mul 0 (@sizeof_front_end_type FET_float))) x0)) **
      ((store_float (Z.add q (Z.mul 1 (@sizeof_front_end_type FET_float))) x1)) **
      ((store_float (Z.add q (Z.mul 2 (@sizeof_front_end_type FET_float))) x2)) **
      ((store_float (Z.add q (Z.mul 3 (@sizeof_front_end_type FET_float))) x3))
      ).

Definition neon_bridge_strategy2 :=
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

Definition neon_bridge_strategy3 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 4 n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_seg p 4 n))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float (Z.add q (Z.mul 0 (@sizeof_front_end_type FET_float))))) **
    ((poly_undef_store FET_float (Z.add q (Z.mul 1 (@sizeof_front_end_type FET_float))))) **
    ((poly_undef_store FET_float (Z.add q (Z.mul 2 (@sizeof_front_end_type FET_float))))) **
    ((poly_undef_store FET_float (Z.add q (Z.mul 3 (@sizeof_front_end_type FET_float)))))
    ).

Definition neon_bridge_strategy4 :=
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

Module Type neon_bridge_Strategy_Correct.

  Axiom neon_bridge_strategy1_correctness : neon_bridge_strategy1.
  Axiom neon_bridge_strategy2_correctness : neon_bridge_strategy2.
  Axiom neon_bridge_strategy3_correctness : neon_bridge_strategy3.
  Axiom neon_bridge_strategy4_correctness : neon_bridge_strategy4.

End neon_bridge_Strategy_Correct.
