From ArgmaxPool Require Export NeonKernelPureFacts.
Import Snaive_C_Rules64.
Local Open Scope sac.
(* Normalize only identities already carried by this exact C path.  In
   particular k=remaining is not unfolded into an arithmetic approximation. *)
Ltac apkc_normalize_state := repeat first[
 match goal with H:?x=app_channels ?D |- _=>is_var x;progress rewrite <-H end
 |match goal with H:?k=app_remaining ?n ?g |- _=>is_var k;progress rewrite <-H end].
Ltac apkc_call_goal :=
 apb_intro;apkc_normalize_state;
 first[solve[apkp_call_frame]|apk_fold_float_values;apkp_call_frame].
