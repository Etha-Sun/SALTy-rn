From Coq Require Import ZArith.
From ArgmaxPool Require Export VectorRecords RvvVectorRecords.
Import Snaive_C_Rules64. Local Open Scope sac.

(* Value forgetting keeps every permission at its original field address.
   It is usable only after that C object's final read in the relevant scope. *)
Ltac ap_forget_cells := lazymatch goal with
 | |- sepcon _ _ |-- sepcon _ _ =>
   apply derivable1_sepcon_mono;[ap_forget_cells|ap_forget_cells]
 | |- _ => first[apply store_float_undef_store_float|apply store_uint_undef_store_uint]
 end.
Lemma ap_forget_float4:forall p v,
 ArgmaxPool.VectorRecords.StructPredfloat32x4_t p v |--
 ArgmaxPool.VectorRecords.UndefStructPredfloat32x4_t p.
Proof. intros;unfold ArgmaxPool.VectorRecords.StructPredfloat32x4_t,
 ArgmaxPool.VectorRecords.UndefStructPredfloat32x4_t;ap_forget_cells. Qed.
Lemma ap_forget_uint4:forall p v,
 ArgmaxPool.VectorRecords.StructPreduint32x4_t p v |--
 ArgmaxPool.VectorRecords.UndefStructPreduint32x4_t p.
Proof. intros;unfold ArgmaxPool.VectorRecords.StructPreduint32x4_t,
 ArgmaxPool.VectorRecords.UndefStructPreduint32x4_t;ap_forget_cells. Qed.
Lemma ap_forget_float32:forall p v,
 ArgmaxPool.RvvVectorRecords.StructPredvfloat32m8_t p v |--
 ArgmaxPool.RvvVectorRecords.UndefStructPredvfloat32m8_t p.
Proof. intros;unfold ArgmaxPool.RvvVectorRecords.StructPredvfloat32m8_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvfloat32m8_t;ap_forget_cells. Qed.
Lemma ap_forget_bool32:forall p v,
 ArgmaxPool.RvvVectorRecords.StructPredvbool4_t p v |--
 ArgmaxPool.RvvVectorRecords.UndefStructPredvbool4_t p.
Proof. intros;unfold ArgmaxPool.RvvVectorRecords.StructPredvbool4_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvbool4_t;ap_forget_cells. Qed.
Print Assumptions ap_forget_float4.
Print Assumptions ap_forget_uint4.
Print Assumptions ap_forget_float32.
Print Assumptions ap_forget_bool32.
