From Coq Require Import ZArith List.
From F32F16 Require Export Model IntegerModel LiteralModel.
Local Open Scope Z_scope.
Definition f16_bias (x:fp32) : Z :=
 f16_max32 (f16_and32 (f16_add32 (bits_of_fp32 (f16_abs x)) 125829120) 2139095040) 1073741824.
Definition f16_arm_core (x:fp32) : fp32 :=
 f16_arm_add (f16_arm_mul (f16_arm_mul (f16_abs x) f16_scale_hi) f16_scale_lo)
  (fp32_of_bits (f16_bias x)).
Definition f16_rvv_core (x:fp32) : fp32 :=
 f16_rvv_add (f16_rvv_mul (f16_rvv_mul (f16_abs x) f16_scale_hi) f16_scale_lo)
  (fp32_of_bits (f16_bias x)).
Definition f16_core_half (f:fp32) : Z :=
 f16_add16 (f16_and16 (f16_narrow16 (bits_of_fp32 f)) 4095)
  (f16_and16 (f16_shrn13 (bits_of_fp32 f)) 31744).
Definition f16_sign_half (x:fp32) : Z :=
 f16_and16 (f16_shrn16 (bits_of_fp32 x)) 32768.
Definition f16_arm_lane (x:fp32) : Z :=
 f16_or16
  (f16_select16 (f16_narrow16 (f16_gt32 (bits_of_fp32 (f16_abs x)) 2139095040))
   32256 (f16_core_half (f16_arm_core x)))
  (f16_sign_half x).
Definition f16_rvv_lane (x:fp32) : Z :=
 f16_or16
  (if Z.ltb 2139095040 (bits_of_fp32 (f16_abs x)) then 32256
   else f16_core_half (f16_rvv_core x))
  (f16_sign_half x).
Definition f16_values (n:Z) (xs:list fp32) : list Z :=
 firstn (Z.to_nat n) (map f16_arm_lane xs).
Definition f16_rvv_values (n:Z) (xs:list fp32) : list Z :=
 firstn (Z.to_nat n) (map f16_rvv_lane xs).
