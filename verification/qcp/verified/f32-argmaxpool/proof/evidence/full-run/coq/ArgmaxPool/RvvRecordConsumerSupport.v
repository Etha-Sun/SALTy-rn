From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export BorrowedConsumerSupport RvvVectorRecords.
Import Snaive_C_Rules64. Local Open Scope sac.
Ltac aprr_frame := unfold ArgmaxPool.RvvVectorRecords.StructPredvfloat32m8_t,
 ArgmaxPool.RvvVectorRecords.StructPredvbool4_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvfloat32m8_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvbool4_t;
 unfold ap_record_gt32,ap_record_merge32,ap_record_mask32 in *;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 cbn [vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vbool4_t_s0 vbool4_t_s1 vbool4_t_s2 vbool4_t_s3 vbool4_t_s4 vbool4_t_s5 vbool4_t_s6 vbool4_t_s7 vbool4_t_s8 vbool4_t_s9 vbool4_t_s10 vbool4_t_s11 vbool4_t_s12 vbool4_t_s13 vbool4_t_s14 vbool4_t_s15 vbool4_t_s16 vbool4_t_s17 vbool4_t_s18 vbool4_t_s19 vbool4_t_s20 vbool4_t_s21 vbool4_t_s22 vbool4_t_s23 vbool4_t_s24 vbool4_t_s25 vbool4_t_s26 vbool4_t_s27 vbool4_t_s28 vbool4_t_s29 vbool4_t_s30 vbool4_t_s31] in *;apb_frame.
