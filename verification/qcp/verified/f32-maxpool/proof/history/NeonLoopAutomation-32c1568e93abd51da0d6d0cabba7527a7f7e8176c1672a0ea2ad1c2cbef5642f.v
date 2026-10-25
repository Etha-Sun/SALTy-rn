From MaxPool Require Export NeonAutomation NeonLoopFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_loop_pure :=
 mp_integer_constants;unfold derivable1,andp,coq_prop;intros;subst;
 unfold mp_output_cursor,mp_row_cursor in *;
 rewrite ?mp_loop_mod4_step;
 repeat first[solve[rewrite mp_loop_rem4_step by lia;assumption]|solve[rewrite mp_loop_mod4_step;assumption]|solve[assumption|reflexivity|lia|mp_window_pure]|split].
Ltac mp_loop_frame :=
 rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [mp_loop_pure|mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel].
