From Coq Require Import ZArith Strings.String.
From X32Packw Require Export RawWords.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope string_scope. Local Open Scope sac.
Definition UndefStructPreduint32x2_t(p:Z):Assertion:=
(&(p # "uint32x2_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x2_t" ->ₛ "s1")) # UInt |->_.
Definition UndefStructPredvuint32m1_t(p:Z):Assertion:=
(&(p # "vuint32m1_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vuint32m1_t" ->ₛ "s3")) # UInt |->_.
Definition UndefStructPredvuint32m4_t(p:Z):Assertion:=
(&(p # "vuint32m4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s3")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s4")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s5")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s6")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s7")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s8")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s9")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s10")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s11")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s12")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s13")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s14")) # UInt |->_ **
(&(p # "vuint32m4_t" ->ₛ "s15")) # UInt |->_.
