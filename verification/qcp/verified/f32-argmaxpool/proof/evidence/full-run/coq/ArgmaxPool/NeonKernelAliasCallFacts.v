From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelPrunedFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac apkal_aliases:=repeat first[
 match goal with H:?x=app_rows ?D|-_=>is_var x;progress rewrite <-H end
 |match goal with H:?x=app_channels ?D|-_=>is_var x;progress rewrite <-H end
 |match goal with H:?x=app_remaining ?n ?g|-_=>is_var x;progress rewrite <-H end
 |match goal with H:?x=app_row_cursor ?P ?table ?off ?n ?g ?row ?done|-_=>is_var x;progress rewrite <-H end
 |match goal with H:?x=app_output_cursor ?base ?done|-_=>is_var x;progress rewrite <-H end].
Ltac apkal_index_read_values:=repeat progress match goal with
 |H:?x=app_previous_index_value ?F ?P ?D ?pixel ?group ?lane|-_=>is_var x;rewrite <-H end.
Ltac apkal_goal:=apb_intro;rewrite ?ap_uint_cell_bytes,?ap_float_cell_bytes in *;
 apkal_aliases;apkal_index_read_values;apkra_prepare;
 first[solve[exfalso;lia]|solve[apkpr_frame]|apk_fold_float_values;apkpr_frame].
