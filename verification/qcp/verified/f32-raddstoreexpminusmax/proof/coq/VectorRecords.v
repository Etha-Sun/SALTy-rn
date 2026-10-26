From Coq Require Import ZArith Lia Strings.String List.
From ExpMinusMax Require Export Model.
Import ListNotations Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.
Record Recordfloat32x4_t:Type:=make_record_float32x4_t{
 float32x4_t_s0:fp32;
 float32x4_t_s1:fp32;
 float32x4_t_s2:fp32;
 float32x4_t_s3:fp32
}.
Definition StructPredfloat32x4_t(p:Z)(v:Recordfloat32x4_t):Assertion:=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |-> v.(float32x4_t_s0) **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |-> v.(float32x4_t_s1) **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |-> v.(float32x4_t_s2) **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |-> v.(float32x4_t_s3).
Definition UndefStructPredfloat32x4_t(p:Z):Assertion:=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_.
Definition em_get_float32x4_t(v:Recordfloat32x4_t)(j:Z):fp32:=nth(Z.to_nat j)[v.(float32x4_t_s0);v.(float32x4_t_s1);v.(float32x4_t_s2);v.(float32x4_t_s3)]fp32_zero.
Definition em_make_float32x4_t(f:Z->fp32):Recordfloat32x4_t:=make_record_float32x4_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z).
Lemma em_get_make_float32x4_t:forall f j,(0<=j<4)%Z->em_get_float32x4_t(em_make_float32x4_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_float32x4_t:forall v,em_make_float32x4_t(em_get_float32x4_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recordfloat32x2_t:Type:=make_record_float32x2_t{
 float32x2_t_s0:fp32;
 float32x2_t_s1:fp32
}.
Definition StructPredfloat32x2_t(p:Z)(v:Recordfloat32x2_t):Assertion:=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |-> v.(float32x2_t_s0) **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |-> v.(float32x2_t_s1).
Definition UndefStructPredfloat32x2_t(p:Z):Assertion:=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition em_get_float32x2_t(v:Recordfloat32x2_t)(j:Z):fp32:=nth(Z.to_nat j)[v.(float32x2_t_s0);v.(float32x2_t_s1)]fp32_zero.
Definition em_make_float32x2_t(f:Z->fp32):Recordfloat32x2_t:=make_record_float32x2_t (f 0%Z) (f 1%Z).
Lemma em_get_make_float32x2_t:forall f j,(0<=j<2)%Z->em_get_float32x2_t(em_make_float32x2_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_float32x2_t:forall v,em_make_float32x2_t(em_get_float32x2_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recorduint32x4_t:Type:=make_record_uint32x4_t{
 uint32x4_t_s0:Z;
 uint32x4_t_s1:Z;
 uint32x4_t_s2:Z;
 uint32x4_t_s3:Z
}.
Definition StructPreduint32x4_t(p:Z)(v:Recorduint32x4_t):Assertion:=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |-> v.(uint32x4_t_s0) **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |-> v.(uint32x4_t_s1) **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |-> v.(uint32x4_t_s2) **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |-> v.(uint32x4_t_s3).
Definition UndefStructPreduint32x4_t(p:Z):Assertion:=
 (&(p # "uint32x4_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "uint32x4_t" ->ₛ "s3")) # UInt |->_.
Definition em_get_uint32x4_t(v:Recorduint32x4_t)(j:Z):Z:=nth(Z.to_nat j)[v.(uint32x4_t_s0);v.(uint32x4_t_s1);v.(uint32x4_t_s2);v.(uint32x4_t_s3)]0%Z.
Definition em_make_uint32x4_t(f:Z->Z):Recorduint32x4_t:=make_record_uint32x4_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z).
Lemma em_get_make_uint32x4_t:forall f j,(0<=j<4)%Z->em_get_uint32x4_t(em_make_uint32x4_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_uint32x4_t:forall v,em_make_uint32x4_t(em_get_uint32x4_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recorduint32x2_t:Type:=make_record_uint32x2_t{
 uint32x2_t_s0:Z;
 uint32x2_t_s1:Z
}.
Definition StructPreduint32x2_t(p:Z)(v:Recorduint32x2_t):Assertion:=
 (&(p # "uint32x2_t" ->ₛ "s0")) # UInt |-> v.(uint32x2_t_s0) **
 (&(p # "uint32x2_t" ->ₛ "s1")) # UInt |-> v.(uint32x2_t_s1).
Definition UndefStructPreduint32x2_t(p:Z):Assertion:=
 (&(p # "uint32x2_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "uint32x2_t" ->ₛ "s1")) # UInt |->_.
Definition em_get_uint32x2_t(v:Recorduint32x2_t)(j:Z):Z:=nth(Z.to_nat j)[v.(uint32x2_t_s0);v.(uint32x2_t_s1)]0%Z.
Definition em_make_uint32x2_t(f:Z->Z):Recorduint32x2_t:=make_record_uint32x2_t (f 0%Z) (f 1%Z).
Lemma em_get_make_uint32x2_t:forall f j,(0<=j<2)%Z->em_get_uint32x2_t(em_make_uint32x2_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_uint32x2_t:forall v,em_make_uint32x2_t(em_get_uint32x2_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recordint32x4_t:Type:=make_record_int32x4_t{
 int32x4_t_s0:Z;
 int32x4_t_s1:Z;
 int32x4_t_s2:Z;
 int32x4_t_s3:Z
}.
Definition StructPredint32x4_t(p:Z)(v:Recordint32x4_t):Assertion:=
 (&(p # "int32x4_t" ->ₛ "s0")) # Int |-> v.(int32x4_t_s0) **
 (&(p # "int32x4_t" ->ₛ "s1")) # Int |-> v.(int32x4_t_s1) **
 (&(p # "int32x4_t" ->ₛ "s2")) # Int |-> v.(int32x4_t_s2) **
 (&(p # "int32x4_t" ->ₛ "s3")) # Int |-> v.(int32x4_t_s3).
Definition UndefStructPredint32x4_t(p:Z):Assertion:=
 (&(p # "int32x4_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "int32x4_t" ->ₛ "s3")) # Int |->_.
Definition em_get_int32x4_t(v:Recordint32x4_t)(j:Z):Z:=nth(Z.to_nat j)[v.(int32x4_t_s0);v.(int32x4_t_s1);v.(int32x4_t_s2);v.(int32x4_t_s3)]0%Z.
Definition em_make_int32x4_t(f:Z->Z):Recordint32x4_t:=make_record_int32x4_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z).
Lemma em_get_make_int32x4_t:forall f j,(0<=j<4)%Z->em_get_int32x4_t(em_make_int32x4_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_int32x4_t:forall v,em_make_int32x4_t(em_get_int32x4_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recordvfloat32m4_t:Type:=make_record_vfloat32m4_t{
 vfloat32m4_t_s0:fp32;
 vfloat32m4_t_s1:fp32;
 vfloat32m4_t_s2:fp32;
 vfloat32m4_t_s3:fp32;
 vfloat32m4_t_s4:fp32;
 vfloat32m4_t_s5:fp32;
 vfloat32m4_t_s6:fp32;
 vfloat32m4_t_s7:fp32;
 vfloat32m4_t_s8:fp32;
 vfloat32m4_t_s9:fp32;
 vfloat32m4_t_s10:fp32;
 vfloat32m4_t_s11:fp32;
 vfloat32m4_t_s12:fp32;
 vfloat32m4_t_s13:fp32;
 vfloat32m4_t_s14:fp32;
 vfloat32m4_t_s15:fp32
}.
Definition StructPredvfloat32m4_t(p:Z)(v:Recordvfloat32m4_t):Assertion:=
 (&(p # "vfloat32m4_t" ->ₛ "s0")) # Float |-> v.(vfloat32m4_t_s0) **
 (&(p # "vfloat32m4_t" ->ₛ "s1")) # Float |-> v.(vfloat32m4_t_s1) **
 (&(p # "vfloat32m4_t" ->ₛ "s2")) # Float |-> v.(vfloat32m4_t_s2) **
 (&(p # "vfloat32m4_t" ->ₛ "s3")) # Float |-> v.(vfloat32m4_t_s3) **
 (&(p # "vfloat32m4_t" ->ₛ "s4")) # Float |-> v.(vfloat32m4_t_s4) **
 (&(p # "vfloat32m4_t" ->ₛ "s5")) # Float |-> v.(vfloat32m4_t_s5) **
 (&(p # "vfloat32m4_t" ->ₛ "s6")) # Float |-> v.(vfloat32m4_t_s6) **
 (&(p # "vfloat32m4_t" ->ₛ "s7")) # Float |-> v.(vfloat32m4_t_s7) **
 (&(p # "vfloat32m4_t" ->ₛ "s8")) # Float |-> v.(vfloat32m4_t_s8) **
 (&(p # "vfloat32m4_t" ->ₛ "s9")) # Float |-> v.(vfloat32m4_t_s9) **
 (&(p # "vfloat32m4_t" ->ₛ "s10")) # Float |-> v.(vfloat32m4_t_s10) **
 (&(p # "vfloat32m4_t" ->ₛ "s11")) # Float |-> v.(vfloat32m4_t_s11) **
 (&(p # "vfloat32m4_t" ->ₛ "s12")) # Float |-> v.(vfloat32m4_t_s12) **
 (&(p # "vfloat32m4_t" ->ₛ "s13")) # Float |-> v.(vfloat32m4_t_s13) **
 (&(p # "vfloat32m4_t" ->ₛ "s14")) # Float |-> v.(vfloat32m4_t_s14) **
 (&(p # "vfloat32m4_t" ->ₛ "s15")) # Float |-> v.(vfloat32m4_t_s15).
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
Definition em_get_vfloat32m4_t(v:Recordvfloat32m4_t)(j:Z):fp32:=nth(Z.to_nat j)[v.(vfloat32m4_t_s0);v.(vfloat32m4_t_s1);v.(vfloat32m4_t_s2);v.(vfloat32m4_t_s3);v.(vfloat32m4_t_s4);v.(vfloat32m4_t_s5);v.(vfloat32m4_t_s6);v.(vfloat32m4_t_s7);v.(vfloat32m4_t_s8);v.(vfloat32m4_t_s9);v.(vfloat32m4_t_s10);v.(vfloat32m4_t_s11);v.(vfloat32m4_t_s12);v.(vfloat32m4_t_s13);v.(vfloat32m4_t_s14);v.(vfloat32m4_t_s15)]fp32_zero.
Definition em_make_vfloat32m4_t(f:Z->fp32):Recordvfloat32m4_t:=make_record_vfloat32m4_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z) (f 4%Z) (f 5%Z) (f 6%Z) (f 7%Z) (f 8%Z) (f 9%Z) (f 10%Z) (f 11%Z) (f 12%Z) (f 13%Z) (f 14%Z) (f 15%Z).
Lemma em_get_make_vfloat32m4_t:forall f j,(0<=j<16)%Z->em_get_vfloat32m4_t(em_make_vfloat32m4_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z\/j=4%Z\/j=5%Z\/j=6%Z\/j=7%Z\/j=8%Z\/j=9%Z\/j=10%Z\/j=11%Z\/j=12%Z\/j=13%Z\/j=14%Z\/j=15%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_vfloat32m4_t:forall v,em_make_vfloat32m4_t(em_get_vfloat32m4_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recordvint32m4_t:Type:=make_record_vint32m4_t{
 vint32m4_t_s0:Z;
 vint32m4_t_s1:Z;
 vint32m4_t_s2:Z;
 vint32m4_t_s3:Z;
 vint32m4_t_s4:Z;
 vint32m4_t_s5:Z;
 vint32m4_t_s6:Z;
 vint32m4_t_s7:Z;
 vint32m4_t_s8:Z;
 vint32m4_t_s9:Z;
 vint32m4_t_s10:Z;
 vint32m4_t_s11:Z;
 vint32m4_t_s12:Z;
 vint32m4_t_s13:Z;
 vint32m4_t_s14:Z;
 vint32m4_t_s15:Z
}.
Definition StructPredvint32m4_t(p:Z)(v:Recordvint32m4_t):Assertion:=
 (&(p # "vint32m4_t" ->ₛ "s0")) # Int |-> v.(vint32m4_t_s0) **
 (&(p # "vint32m4_t" ->ₛ "s1")) # Int |-> v.(vint32m4_t_s1) **
 (&(p # "vint32m4_t" ->ₛ "s2")) # Int |-> v.(vint32m4_t_s2) **
 (&(p # "vint32m4_t" ->ₛ "s3")) # Int |-> v.(vint32m4_t_s3) **
 (&(p # "vint32m4_t" ->ₛ "s4")) # Int |-> v.(vint32m4_t_s4) **
 (&(p # "vint32m4_t" ->ₛ "s5")) # Int |-> v.(vint32m4_t_s5) **
 (&(p # "vint32m4_t" ->ₛ "s6")) # Int |-> v.(vint32m4_t_s6) **
 (&(p # "vint32m4_t" ->ₛ "s7")) # Int |-> v.(vint32m4_t_s7) **
 (&(p # "vint32m4_t" ->ₛ "s8")) # Int |-> v.(vint32m4_t_s8) **
 (&(p # "vint32m4_t" ->ₛ "s9")) # Int |-> v.(vint32m4_t_s9) **
 (&(p # "vint32m4_t" ->ₛ "s10")) # Int |-> v.(vint32m4_t_s10) **
 (&(p # "vint32m4_t" ->ₛ "s11")) # Int |-> v.(vint32m4_t_s11) **
 (&(p # "vint32m4_t" ->ₛ "s12")) # Int |-> v.(vint32m4_t_s12) **
 (&(p # "vint32m4_t" ->ₛ "s13")) # Int |-> v.(vint32m4_t_s13) **
 (&(p # "vint32m4_t" ->ₛ "s14")) # Int |-> v.(vint32m4_t_s14) **
 (&(p # "vint32m4_t" ->ₛ "s15")) # Int |-> v.(vint32m4_t_s15).
Definition UndefStructPredvint32m4_t(p:Z):Assertion:=
 (&(p # "vint32m4_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s3")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s4")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s5")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s6")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s7")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s8")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s9")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s10")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s11")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s12")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s13")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s14")) # Int |->_ **
 (&(p # "vint32m4_t" ->ₛ "s15")) # Int |->_.
Definition em_get_vint32m4_t(v:Recordvint32m4_t)(j:Z):Z:=nth(Z.to_nat j)[v.(vint32m4_t_s0);v.(vint32m4_t_s1);v.(vint32m4_t_s2);v.(vint32m4_t_s3);v.(vint32m4_t_s4);v.(vint32m4_t_s5);v.(vint32m4_t_s6);v.(vint32m4_t_s7);v.(vint32m4_t_s8);v.(vint32m4_t_s9);v.(vint32m4_t_s10);v.(vint32m4_t_s11);v.(vint32m4_t_s12);v.(vint32m4_t_s13);v.(vint32m4_t_s14);v.(vint32m4_t_s15)]0%Z.
Definition em_make_vint32m4_t(f:Z->Z):Recordvint32m4_t:=make_record_vint32m4_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z) (f 4%Z) (f 5%Z) (f 6%Z) (f 7%Z) (f 8%Z) (f 9%Z) (f 10%Z) (f 11%Z) (f 12%Z) (f 13%Z) (f 14%Z) (f 15%Z).
Lemma em_get_make_vint32m4_t:forall f j,(0<=j<16)%Z->em_get_vint32m4_t(em_make_vint32m4_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z\/j=4%Z\/j=5%Z\/j=6%Z\/j=7%Z\/j=8%Z\/j=9%Z\/j=10%Z\/j=11%Z\/j=12%Z\/j=13%Z\/j=14%Z\/j=15%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_vint32m4_t:forall v,em_make_vint32m4_t(em_get_vint32m4_t v)=v.
Proof. intros [];reflexivity. Qed.
Record Recordvbool8_t:Type:=make_record_vbool8_t{
 vbool8_t_s0:Z;
 vbool8_t_s1:Z;
 vbool8_t_s2:Z;
 vbool8_t_s3:Z;
 vbool8_t_s4:Z;
 vbool8_t_s5:Z;
 vbool8_t_s6:Z;
 vbool8_t_s7:Z;
 vbool8_t_s8:Z;
 vbool8_t_s9:Z;
 vbool8_t_s10:Z;
 vbool8_t_s11:Z;
 vbool8_t_s12:Z;
 vbool8_t_s13:Z;
 vbool8_t_s14:Z;
 vbool8_t_s15:Z
}.
Definition StructPredvbool8_t(p:Z)(v:Recordvbool8_t):Assertion:=
 (&(p # "vbool8_t" ->ₛ "s0")) # UInt |-> v.(vbool8_t_s0) **
 (&(p # "vbool8_t" ->ₛ "s1")) # UInt |-> v.(vbool8_t_s1) **
 (&(p # "vbool8_t" ->ₛ "s2")) # UInt |-> v.(vbool8_t_s2) **
 (&(p # "vbool8_t" ->ₛ "s3")) # UInt |-> v.(vbool8_t_s3) **
 (&(p # "vbool8_t" ->ₛ "s4")) # UInt |-> v.(vbool8_t_s4) **
 (&(p # "vbool8_t" ->ₛ "s5")) # UInt |-> v.(vbool8_t_s5) **
 (&(p # "vbool8_t" ->ₛ "s6")) # UInt |-> v.(vbool8_t_s6) **
 (&(p # "vbool8_t" ->ₛ "s7")) # UInt |-> v.(vbool8_t_s7) **
 (&(p # "vbool8_t" ->ₛ "s8")) # UInt |-> v.(vbool8_t_s8) **
 (&(p # "vbool8_t" ->ₛ "s9")) # UInt |-> v.(vbool8_t_s9) **
 (&(p # "vbool8_t" ->ₛ "s10")) # UInt |-> v.(vbool8_t_s10) **
 (&(p # "vbool8_t" ->ₛ "s11")) # UInt |-> v.(vbool8_t_s11) **
 (&(p # "vbool8_t" ->ₛ "s12")) # UInt |-> v.(vbool8_t_s12) **
 (&(p # "vbool8_t" ->ₛ "s13")) # UInt |-> v.(vbool8_t_s13) **
 (&(p # "vbool8_t" ->ₛ "s14")) # UInt |-> v.(vbool8_t_s14) **
 (&(p # "vbool8_t" ->ₛ "s15")) # UInt |-> v.(vbool8_t_s15).
Definition UndefStructPredvbool8_t(p:Z):Assertion:=
 (&(p # "vbool8_t" ->ₛ "s0")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s1")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s2")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s3")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s4")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s5")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s6")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s7")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s8")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s9")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s10")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s11")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s12")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s13")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s14")) # UInt |->_ **
 (&(p # "vbool8_t" ->ₛ "s15")) # UInt |->_.
Definition em_get_vbool8_t(v:Recordvbool8_t)(j:Z):Z:=nth(Z.to_nat j)[v.(vbool8_t_s0);v.(vbool8_t_s1);v.(vbool8_t_s2);v.(vbool8_t_s3);v.(vbool8_t_s4);v.(vbool8_t_s5);v.(vbool8_t_s6);v.(vbool8_t_s7);v.(vbool8_t_s8);v.(vbool8_t_s9);v.(vbool8_t_s10);v.(vbool8_t_s11);v.(vbool8_t_s12);v.(vbool8_t_s13);v.(vbool8_t_s14);v.(vbool8_t_s15)]0%Z.
Definition em_make_vbool8_t(f:Z->Z):Recordvbool8_t:=make_record_vbool8_t (f 0%Z) (f 1%Z) (f 2%Z) (f 3%Z) (f 4%Z) (f 5%Z) (f 6%Z) (f 7%Z) (f 8%Z) (f 9%Z) (f 10%Z) (f 11%Z) (f 12%Z) (f 13%Z) (f 14%Z) (f 15%Z).
Lemma em_get_make_vbool8_t:forall f j,(0<=j<16)%Z->em_get_vbool8_t(em_make_vbool8_t f)j=f j.
Proof. intros f j Hj;assert(Hcases:j=0%Z\/j=1%Z\/j=2%Z\/j=3%Z\/j=4%Z\/j=5%Z\/j=6%Z\/j=7%Z\/j=8%Z\/j=9%Z\/j=10%Z\/j=11%Z\/j=12%Z\/j=13%Z\/j=14%Z\/j=15%Z)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst j;reflexivity. Qed.
Lemma em_make_get_vbool8_t:forall v,em_make_vbool8_t(em_get_vbool8_t v)=v.
Proof. intros [];reflexivity. Qed.
Lemma em_local_field_address:forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Print Assumptions em_local_field_address.
