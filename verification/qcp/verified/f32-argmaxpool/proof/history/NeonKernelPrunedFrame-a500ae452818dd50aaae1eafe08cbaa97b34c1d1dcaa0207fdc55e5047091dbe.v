From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelAllCallFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* Each cell remains an arbitrary Assertion in the unchanged SEP goal.
   Coq's ordinary [clear] rejects hypotheses needed by the goal or another
   retained declaration; no spatial resource is removed. *)
Ltac apkpr_clear_context:=repeat match goal with H:?T|-_=>
 tryif unify T Assertion then fail 0 else clear H end.
Ltac apkpr_spatial:=
 unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t,
 UndefStructPredfloat32x2_t,UndefStructPreduint32x2_t;
 rewrite ?ap_local_field_address;
 match goal with|-?P|--?Q=>let leaves:=All_listasrts P in apkcf_leaves leaves end;
 apkpr_clear_context;sepcon_assoc_change;fast_cancel.
Ltac apkpr_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apkra_pure]|apply _derivable1_andp_intros;[apkra_pure|apkpr_spatial]|apkpr_spatial].
Ltac apkpr_goal:=apb_intro;rewrite ?ap_uint_cell_bytes,?ap_float_cell_bytes in *;
 apkc_normalize_state;apkra_prepare;
 first[solve[exfalso;lia]|solve[apkpr_frame]|apk_fold_float_values;apkpr_frame].
