From Coq Require Import ZArith List String Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPreduint8x8_t(p:Z):Assertion :=
 (&(p # "uint8x8_t" ->ₛ "s0")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s1")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s2")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s3")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s4")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s5")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s6")) # UChar |->_ **
 (&(p # "uint8x8_t" ->ₛ "s7")) # UChar |->_ .
Definition UndefStructPreduint8x16_t(p:Z):Assertion :=
 (&(p # "uint8x16_t" ->ₛ "s0")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s1")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s2")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s3")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s4")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s5")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s6")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s7")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s8")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s9")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s10")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s11")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s12")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s13")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s14")) # UChar |->_ **
 (&(p # "uint8x16_t" ->ₛ "s15")) # UChar |->_ .
Definition u8_ptr_modulus:Z:=18446744073709551616.
