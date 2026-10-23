From Coq Require Import ZArith String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredvuint8m8_t(p:Z):Assertion:=
(&(p # "vuint8m8_t" ->ₛ "w0")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w1")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w2")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w3")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w4")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w5")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w6")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w7")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w8")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w9")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w10")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w11")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w12")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w13")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w14")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w15")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w16")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w17")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w18")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w19")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w20")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w21")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w22")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w23")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w24")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w25")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w26")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w27")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w28")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w29")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w30")) # UInt |->_ **
(&(p # "vuint8m8_t" ->ₛ "w31")) # UInt |->_.
