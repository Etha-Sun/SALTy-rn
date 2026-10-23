From Coq Require Import ZArith List Reals.
From SimpleC.SL Require Import Mem SeparationLogic.
From Flocq.IEEE754 Require Import Binary.
Definition fp32_sqrt : fp32 -> fp32 :=
  Binary.Bsqrt 24 128 eq_refl eq_refl fp32_unary_nan BinarySingleNaN.mode_NE.
Definition sqrt_values (n:Z) (a:list fp32) := firstn (Z.to_nat n) (map fp32_sqrt a).
Definition same_value (x y:fp32) := fp32_eq x y \/ (fp32_isNaN x /\ fp32_isNaN y).
Definition outputs_related := Forall2 same_value.

Definition same_bits (x y:fp32) : Prop := x=y.

Definition active_sqrt (i vl:Z) (x:fp32) :=
 if Z.ltb i vl then fp32_sqrt x else fp32_of_real (0%R).
