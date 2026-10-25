From Coq Require Import ZArith Strings.String.
From X32Transpose Require Export WordModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope string_scope. Local Open Scope sac.
Definition UndefStructPreduint32x2_t(p:Z):Assertion:=
(&(p # "uint32x2_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x2_t" ->ₛ "s1")) # UInt |->_.
Definition UndefStructPredvuint32m8_t(p:Z):Assertion:=
(&(p # "vuint32m8_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s3")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s4")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s5")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s6")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s7")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s8")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s9")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s10")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s11")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s12")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s13")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s14")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s15")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s16")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s17")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s18")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s19")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s20")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s21")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s22")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s23")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s24")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s25")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s26")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s27")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s28")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s29")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s30")) # UInt |->_ **
(&(p # "vuint32m8_t" ->ₛ "s31")) # UInt |->_.
Definition xt_tuple_slot(p i:Z):Z:=(&(p # "uint32x2x2_t" ->ₛ "val"))+i*sizeof(struct "uint32x2_t").
Definition UndefStructPreduint32x2x2_t(p:Z):Assertion:=UndefStructPreduint32x2_t(xt_tuple_slot p 0) ** UndefStructPreduint32x2_t(xt_tuple_slot p 1).
