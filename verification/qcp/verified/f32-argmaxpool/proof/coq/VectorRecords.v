From Coq Require Import ZArith Strings.String.
From ArgmaxPool Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.

(* Faithful binary32 records. The tool's automatic float record emitter uses
   R/Int; that output is retained as a rejected diagnostic, never imported. *)
Record Recordfloat32x4_t : Type := make_record_float32x4_t {
 float32x4_t_s0:fp32; float32x4_t_s1:fp32;
 float32x4_t_s2:fp32; float32x4_t_s3:fp32
}.
Record Recorduint32x4_t : Type := make_record_uint32x4_t {
 uint32x4_t_s0:Z; uint32x4_t_s1:Z;
 uint32x4_t_s2:Z; uint32x4_t_s3:Z
}.
Definition StructPredfloat32x4_t(p:Z)(v:Recordfloat32x4_t):Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |-> v.(float32x4_t_s0) **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |-> v.(float32x4_t_s1) **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |-> v.(float32x4_t_s2) **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |-> v.(float32x4_t_s3).
Definition UndefStructPredfloat32x4_t(p:Z):Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_ .
Definition StructPreduint32x4_t(p:Z)(v:Recorduint32x4_t):Assertion :=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |-> v.(uint32x4_t_s0) **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |-> v.(uint32x4_t_s1) **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |-> v.(uint32x4_t_s2) **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |-> v.(uint32x4_t_s3).
Definition UndefStructPreduint32x4_t(p:Z):Assertion :=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_ .
Definition ap_record_mask4(m:Recorduint32x4_t):Prop :=
 ap_bool_mask m.(uint32x4_t_s0) /\ ap_bool_mask m.(uint32x4_t_s1) /\
 ap_bool_mask m.(uint32x4_t_s2) /\ ap_bool_mask m.(uint32x4_t_s3).
Definition ap_record_select4(m:Recorduint32x4_t)(a b:Recordfloat32x4_t):Recordfloat32x4_t :=
 make_record_float32x4_t
  (ap_select_f32 m.(uint32x4_t_s0) a.(float32x4_t_s0) b.(float32x4_t_s0))
  (ap_select_f32 m.(uint32x4_t_s1) a.(float32x4_t_s1) b.(float32x4_t_s1))
  (ap_select_f32 m.(uint32x4_t_s2) a.(float32x4_t_s2) b.(float32x4_t_s2))
  (ap_select_f32 m.(uint32x4_t_s3) a.(float32x4_t_s3) b.(float32x4_t_s3)).
Definition ap_record_same4(a b:Recordfloat32x4_t):Prop := a=b.

Lemma ap_record_same4_fields:forall a b,ap_record_same4 a b ->
 ap_same_bits a.(float32x4_t_s0) b.(float32x4_t_s0) /\
 ap_same_bits a.(float32x4_t_s1) b.(float32x4_t_s1) /\
 ap_same_bits a.(float32x4_t_s2) b.(float32x4_t_s2) /\
 ap_same_bits a.(float32x4_t_s3) b.(float32x4_t_s3).
Proof. intros a b H;unfold ap_record_same4 in H;subst b;repeat split;reflexivity. Qed.
Print Assumptions ap_record_same4_fields.
