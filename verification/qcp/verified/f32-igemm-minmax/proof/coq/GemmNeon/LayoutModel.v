From Coq Require Import ZArith String.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion :=
(&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion :=
(&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
