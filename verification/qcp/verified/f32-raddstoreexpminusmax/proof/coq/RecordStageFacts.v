From Coq Require Import ZArith Strings.String.
From ExpMinusMax Require Export KernelModel Frame.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope string_scope.
Definition em_pack4(a b c d:fp32):Recordfloat32x4_t:=make_record_float32x4_t a b c d.
Lemma em_record_stage4:forall p a b c d,
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |-> a **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |-> b **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |-> c **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |-> d |--
 EX(V:Recordfloat32x4_t), “em_same_record4 V(em_pack4 a b c d)” && StructPredfloat32x4_t p V.
Proof. intros;Exists(em_pack4 a b c d);unfold StructPredfloat32x4_t,em_same_record4,em_pack4;entailer!. Qed.
Print Assumptions em_record_stage4.

Lemma em_record_stage_exact:forall p R,StructPredfloat32x4_t p R|--
 EX(V:Recordfloat32x4_t), “em_same_record4 V R” && StructPredfloat32x4_t p V.
Proof. intros;Exists R;unfold em_same_record4;entailer!. Qed.
Print Assumptions em_record_stage_exact.
