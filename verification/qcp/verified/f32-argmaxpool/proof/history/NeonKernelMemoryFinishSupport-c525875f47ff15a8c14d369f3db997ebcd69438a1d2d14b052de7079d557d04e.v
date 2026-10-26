From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelMemoryRowsFacts NeonKernelCompactFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac apkm_int_prepare:=
 try match goal with H:k=app_remaining _ _|-_=>idtac end;
 unfold app_read_cursor,app_row_pointer,app_row_index,ap_pass_row in *;
 try match goal with H:?k=app_remaining ?n ?g|-_=>rewrite <-H in * end;
 repeat first[
 progress rewrite Z.min_l in * by lia
 |progress rewrite Z.min_r in * by lia
 |match goal with|-context[Z.ltb ?a ?b]=>
  first[let E:=fresh in assert(E:Z.ltb a b=true)by(apply Z.ltb_lt;lia);rewrite E
  |let E:=fresh in assert(E:Z.ltb a b=false)by(apply Z.ltb_ge;lia);rewrite E]end
 |match goal with H:context[Z.ltb ?a ?b]|-_=>
  first[let E:=fresh in assert(E:Z.ltb a b=true)by(apply Z.ltb_lt;lia);rewrite E in H
  |let E:=fresh in assert(E:Z.ltb a b=false)by(apply Z.ltb_ge;lia);rewrite E in H]end];
 try match goal with H:sizeof(PTR)=8|-_=>rewrite H in * end.
Ltac apkm_props:=repeat first[solve[apk_basic_prop|congruence]|split].
Ltac apkm_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply apb_pure_right;apkm_props
 | |-?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[apkm_pure|apkm_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac apkm_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apkm_pure]|apply _derivable1_andp_intros;[apkm_pure|apkcf_spatial]|apkcf_spatial].
Ltac apkm_finish_goal:=apb_intro;apkm_int_prepare;apkm_frame.
