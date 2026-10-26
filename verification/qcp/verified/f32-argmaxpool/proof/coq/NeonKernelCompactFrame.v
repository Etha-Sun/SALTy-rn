From ArgmaxPool Require Export NeonKernelCallFacts.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac apkcf_leaves l:=lazymatch l with
 | nil=>idtac
 |cons(norm_asrt ?v)?tail=>
  let cell:=fresh "cell"in set(cell:=v);clearbody cell;apkcf_leaves tail end.
Ltac apkcf_spatial:=
 unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t,
 UndefStructPredfloat32x2_t,UndefStructPreduint32x2_t;
 rewrite ?ap_local_field_address;
 match goal with|-?P|--?Q=>let leaves:=All_listasrts P in apkcf_leaves leaves end;
 sepcon_assoc_change;fast_cancel.
Ltac apkcf_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apkp_pure]|apply _derivable1_andp_intros;[apkp_pure|apkcf_spatial]|apkcf_spatial].
Ltac apkcf_goal:=apb_intro;apkc_normalize_state;
 first[solve[apkcf_frame]|apk_fold_float_values;apkcf_frame].
