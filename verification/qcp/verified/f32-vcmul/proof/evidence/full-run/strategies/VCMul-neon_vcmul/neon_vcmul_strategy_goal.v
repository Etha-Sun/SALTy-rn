Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import VCMul.ComplexModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition neon_vcmul_strategy1 :=
  forall (count : Z) (length : Z),
    TT &&
    (“ (length = 0) ”) &&
    (“ (count = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (n : Z) (b : (@list fp32)) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full p length ( complex_real_prefix count n a b)))
      ).

Definition neon_vcmul_strategy2 :=
  forall (count : Z) (length : Z),
    TT &&
    (“ (length = 0) ”) &&
    (“ (count = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (n : Z) (b : (@list fp32)) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full p length ( complex_imag_prefix count n a b)))
      ).

Definition neon_vcmul_strategy3 :=
  forall (n : Z) (total : Z) (q : Z) (p : Z) (r : Z) (k : Z) (count : Z) (b : (@list fp32)) (a : (@list fp32)),
    TT &&
    (“ (p = r) ”) &&
    (“ (q = (Z.add p (Z.mul k (@sizeof_front_end_type FET_float)))) ”) &&
    (“ (k = n) ”) &&
    (“ (total = n) ”) &&
    (“ (count = (Z.mul 2 k)) ”) &&
    (“ (Z.le 0 n) ”) &&
    emp **
    ((FloatArray.full p k ( complex_real_prefix k n a b))) **
    ((FloatArray.full q k ( complex_imag_prefix k n a b)))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.full r count ( vcmul_values total a b)))
    ).

Module Type neon_vcmul_Strategy_Correct.

  Axiom neon_vcmul_strategy1_correctness : neon_vcmul_strategy1.
  Axiom neon_vcmul_strategy2_correctness : neon_vcmul_strategy2.
  Axiom neon_vcmul_strategy3_correctness : neon_vcmul_strategy3.

End neon_vcmul_Strategy_Correct.
