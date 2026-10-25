From MaxPool Require Export NeonAutomation NeonLoopFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_loop_pure := unfold mp_output_cursor;mp_pure.
Ltac mp_loop_frame :=
 rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [mp_loop_pure|mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel].
