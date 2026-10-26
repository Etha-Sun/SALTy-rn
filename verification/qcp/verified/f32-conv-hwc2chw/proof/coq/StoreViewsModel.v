From Coq Require Import List ZArith.
From HwcConv Require Export VectorRecords OutputMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition hc_low2 (R:Recordfloat32x2_t)(A:Recordfloat32x4_t):Prop :=
 R=make_record_float32x2_t A.(float32x4_t_s0) A.(float32x4_t_s1).
Definition hc_high2 (R:Recordfloat32x2_t)(A:Recordfloat32x4_t):Prop :=
 R=make_record_float32x2_t A.(float32x4_t_s2) A.(float32x4_t_s3).
Definition hc_store2 (O:HwcOutput)(p:Z)(A:Recordfloat32x2_t):HwcOutput:=
 hc_output_put (hc_output_put O p A.(float32x2_t_s0)) (p+4) A.(float32x2_t_s1).
Definition hc_store_low2 (O:HwcOutput)(p:Z)(A:Recordfloat32x4_t):HwcOutput:=
 hc_store2 O p (make_record_float32x2_t A.(float32x4_t_s0) A.(float32x4_t_s1)).
Definition hc_store_high2 (O:HwcOutput)(p:Z)(A:Recordfloat32x4_t):HwcOutput:=
 hc_store2 O p (make_record_float32x2_t A.(float32x4_t_s2) A.(float32x4_t_s3)).
(* These are views of original, fixed-width vget_low/high and vst1_f32.
   The C wrappers composing two instructions remain ordinary checked bodies.
   All unaddressed Some/None entries are preserved by hc_output_put. *)
