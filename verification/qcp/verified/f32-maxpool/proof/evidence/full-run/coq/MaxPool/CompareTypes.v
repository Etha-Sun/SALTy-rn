From Coq Require Import ZArith Strings.String.
From MaxPool Require Export Types.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.
Definition UndefStructPreduint32x4_t(p:Z):Assertion:=
(&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
