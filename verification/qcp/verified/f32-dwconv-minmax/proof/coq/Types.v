From Coq Require Import ZArith Strings.String.
From Dwconv Require Export Model.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope string_scope.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion:=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion:=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPredvfloat32m4_t(p:Z):Assertion:=
 (&(p # "vfloat32m4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s3")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s4")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s5")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s6")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s7")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s8")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s9")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s10")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s11")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s12")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s13")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s14")) # Float |->_ **
 (&(p # "vfloat32m4_t" ->ₛ "s15")) # Float |->_.
Definition UndefStructPredvbool8_t(p:Z):Assertion:=
 (&(p # "vbool8_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s3")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s4")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s5")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s6")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s7")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s8")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s9")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s10")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s11")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s12")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s13")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s14")) # Int |->_ **
 (&(p # "vbool8_t" ->ₛ "s15")) # Int |->_.
