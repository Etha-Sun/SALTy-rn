Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.MemoryModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition s8_neon_memory_strategy1 :=
  forall (m : Z) (n : Z) (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 m) ”) &&
    (“ (Z.le m n) ”) &&
    emp **
    ((CharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((CharArray.undef_full (Z.add p (Z.mul m (@sizeof_front_end_type FET_char))) (Z.sub n m)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((CharArray.undef_full q m))
    ).

Definition s8_neon_memory_strategy2 :=
  forall (q : Z) (p : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((poly_undef_store FET_char p))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar q))
    ).

Definition s8_neon_memory_strategy3 :=
  forall (i : Z) (j : Z) (k : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (i = (Z.add k j)) ”) &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add (Z.add q (Z.mul k (@sizeof_front_end_type FET_char))) (Z.mul j (@sizeof_front_end_type FET_uchar)))))
    ).

Definition s8_neon_memory_strategy4 :=
  forall (i : Z) (j : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (i = j) ”) &&
    emp **
    ((poly_undef_store FET_char (Z.add p (Z.mul i (@sizeof_front_end_type FET_char)))))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_char (Z.add q (Z.mul j (@sizeof_front_end_type FET_char)))))
    ).

Definition s8_neon_memory_strategy5 :=
  forall (i : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (i = 0) ”) &&
    emp **
    ((poly_undef_store FET_char (Z.add p (Z.mul i (@sizeof_front_end_type FET_char)))))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_char q))
    ).

Module Type s8_neon_memory_Strategy_Correct.

  Axiom s8_neon_memory_strategy1_correctness : s8_neon_memory_strategy1.
  Axiom s8_neon_memory_strategy2_correctness : s8_neon_memory_strategy2.
  Axiom s8_neon_memory_strategy3_correctness : s8_neon_memory_strategy3.
  Axiom s8_neon_memory_strategy4_correctness : s8_neon_memory_strategy4.
  Axiom s8_neon_memory_strategy5_correctness : s8_neon_memory_strategy5.

End s8_neon_memory_Strategy_Correct.
