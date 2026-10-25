From Coq Require Import ZArith String.
From SimpleC.SL Require Export Mem SeparationLogic.
From DwChw Require Export Model.
Import Snaive_C_Rules64. Local Open Scope string_scope. Local Open Scope sac.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion :=
(&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion :=
(&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPreduint32x4_t(p:Z):Assertion :=
(&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Definition UndefStructPredvfloat32m2_t(p:Z):Assertion :=
(&(p # "vfloat32m2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s1")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s2")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s3")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s4")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s5")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s6")) # Float |->_ **
(&(p # "vfloat32m2_t" ->ₛ "s7")) # Float |->_.
