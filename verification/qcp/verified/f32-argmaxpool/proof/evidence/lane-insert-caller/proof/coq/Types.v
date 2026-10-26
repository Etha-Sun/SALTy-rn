From Coq Require Import ZArith Strings.String.
From ArgmaxPool Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.
Definition UndefStructPredfloat32x4_t(p:Z):Assertion:=
(&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
(&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition UndefStructPredfloat32x2_t(p:Z):Assertion:=
(&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
(&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPreduint32x4_t(p:Z):Assertion:=
(&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Definition UndefStructPreduint32x2_t(p:Z):Assertion:=
(&(p # "uint32x2_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "uint32x2_t" ->ₛ "s1")) # UInt |->_.
Definition UndefStructPredvfloat32m8_t(p:Z):Assertion:=
(&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |->_ **
(&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |->_.
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
Definition UndefStructPredvbool4_t(p:Z):Assertion:=
(&(p # "vbool4_t" ->ₛ "s0")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s1")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s2")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s3")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s4")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s5")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s6")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s7")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s8")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s9")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s10")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s11")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s12")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s13")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s14")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s15")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s16")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s17")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s18")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s19")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s20")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s21")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s22")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s23")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s24")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s25")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s26")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s27")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s28")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s29")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s30")) # UInt |->_ **
(&(p # "vbool4_t" ->ₛ "s31")) # UInt |->_.
Lemma ap_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Print Assumptions ap_local_field_address.
