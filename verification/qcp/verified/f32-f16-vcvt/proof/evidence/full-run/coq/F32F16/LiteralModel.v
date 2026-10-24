From Coq Require Import ZArith.
From F32F16 Require Export Model.
Local Open Scope Z_scope.
Definition f16_scale_hi : fp32 := fp32_of_bits 2004877312.
Definition f16_scale_lo : fp32 := fp32_of_bits 142606336.
