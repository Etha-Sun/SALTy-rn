From Coq Require Import ZArith List.
From SimpleC.SL Require Export Mem SeparationLogic.
From Flocq.IEEE754 Require Import Binary.
Local Open Scope Z_scope.
Definition sqrt_same_bits (a b:fp32) : Prop := a=b.
Definition sqrt_abs_bits (u:Z) : Z := Z.land u 2147483647.
Definition sqrt_nan_bits (u:Z) : Z := if Z.ltb 2139095040 (sqrt_abs_bits u) then 1 else 0.
Definition sqrt_snan_bits (u:Z) : Z := if Z.eqb (sqrt_nan_bits u) 1 then if Z.eqb (Z.land u 4194304) 0 then 1 else 0 else 0.
Definition sqrt_quiet (x:fp32) : fp32 := fp32_of_bits (Z.lor (bits_of_fp32 x) 4194304).
(* The shared mathematical operation is Flocq binary32 correctly rounded sqrt;
   the ISA-specific functions below have distinct NaN processing. *)
Definition sqrt_core (x:fp32) : fp32 :=
 Binary.Bsqrt 24 128 eq_refl eq_refl fp32_unary_nan BinarySingleNaN.mode_NE x.
Definition sqrt_arm (x:fp32) : fp32 :=
 if Z.eqb (sqrt_nan_bits (bits_of_fp32 x)) 1 then sqrt_quiet x else
 if Binary.is_nan 24 128 (sqrt_core x) then fp32_of_bits 2143289344 else sqrt_core x.
Definition sqrt_rvv (x:fp32) : fp32 :=
 if Binary.is_nan 24 128 (sqrt_core x) then fp32_of_bits 2143289344 else sqrt_core x.
Definition sqrt_arm_values (n:Z)(a:list fp32):list fp32 := firstn (Z.to_nat n)(map sqrt_arm a).
Definition sqrt_rvv_values (n:Z)(a:list fp32):list fp32 := firstn (Z.to_nat n)(map sqrt_rvv a).
Definition sqrt_same_value (x y:fp32) : Prop := fp32_eq x y \/ (fp32_isNaN x /\ fp32_isNaN y).
Definition sqrt_outputs_related := Forall2 sqrt_same_value.
