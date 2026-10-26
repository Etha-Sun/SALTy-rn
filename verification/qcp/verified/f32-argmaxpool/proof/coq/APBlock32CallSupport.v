From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export RvvUpdateIntoProbeSupport APOptionalMemoryModel APBlock32Model APBlock32StageModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac. Local Open Scope string_scope.
Ltac apbc_prepare:=try change(INT_MAX)with 2147483647 in *;
 try change(INT_MIN)with(-2147483648)in *;
 try change(UINT_MAX)with 4294967295 in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 unfold ap_optional_output_readable,ap_optional_index_readable,ap_optional_write_window,ap_block32_previous in *.
Ltac apbc_prop:=repeat first[solve[assumption]|solve[reflexivity]|solve[tauto]|solve[lia]|split].
Ltac apbc_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply apb_pure_right;apbc_prop
 | |-?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[apbc_pure|apbc_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac apbc_frame:=unfold UndefStructPredvfloat32m8_t,UndefStructPredvuint32m8_t,UndefStructPredvbool4_t,
 UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t;
 rewrite ?ap_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apbc_pure]|apply _derivable1_andp_intros;[apbc_pure|apb_spatial]|apb_spatial].
Ltac apbc_record_frame := unfold ArgmaxPool.RvvVectorRecords.StructPredvfloat32m8_t,
 ArgmaxPool.RvvVectorRecords.StructPredvbool4_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvfloat32m8_t,
 ArgmaxPool.RvvVectorRecords.UndefStructPredvbool4_t,
 ArgmaxPool.RvvUpdateIntoModel.StructPredvuint32m8_t,
 ArgmaxPool.RvvUpdateIntoModel.UndefStructPredvuint32m8_t;
 unfold ap_record_gt32,ap_record_merge32,ap_record_mask32,ap_update_um32 in *;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 cbn [vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vuint32m8_t_s0 vuint32m8_t_s1 vuint32m8_t_s2 vuint32m8_t_s3 vuint32m8_t_s4 vuint32m8_t_s5 vuint32m8_t_s6 vuint32m8_t_s7 vuint32m8_t_s8 vuint32m8_t_s9 vuint32m8_t_s10 vuint32m8_t_s11 vuint32m8_t_s12 vuint32m8_t_s13 vuint32m8_t_s14 vuint32m8_t_s15 vuint32m8_t_s16 vuint32m8_t_s17 vuint32m8_t_s18 vuint32m8_t_s19 vuint32m8_t_s20 vuint32m8_t_s21 vuint32m8_t_s22 vuint32m8_t_s23 vuint32m8_t_s24 vuint32m8_t_s25 vuint32m8_t_s26 vuint32m8_t_s27 vuint32m8_t_s28 vuint32m8_t_s29 vuint32m8_t_s30 vuint32m8_t_s31 vbool4_t_s0 vbool4_t_s1 vbool4_t_s2 vbool4_t_s3 vbool4_t_s4 vbool4_t_s5 vbool4_t_s6 vbool4_t_s7 vbool4_t_s8 vbool4_t_s9 vbool4_t_s10 vbool4_t_s11 vbool4_t_s12 vbool4_t_s13 vbool4_t_s14 vbool4_t_s15 vbool4_t_s16 vbool4_t_s17 vbool4_t_s18 vbool4_t_s19 vbool4_t_s20 vbool4_t_s21 vbool4_t_s22 vbool4_t_s23 vbool4_t_s24 vbool4_t_s25 vbool4_t_s26 vbool4_t_s27 vbool4_t_s28 vbool4_t_s29 vbool4_t_s30 vbool4_t_s31] in *;apbc_frame.

Ltac apbc_goal:=apb_intro;apbc_prepare;first[solve[apbc_pure]|apbc_record_frame].
