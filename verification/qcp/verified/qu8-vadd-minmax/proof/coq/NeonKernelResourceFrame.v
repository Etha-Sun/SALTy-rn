From Qu8Add Require Export NeonKernelResourceSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_clean_emp :=
 repeat first[
  match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
  |rewrite logic_equiv_sepcon_emp].
Ltac qu_resource_frame := qu_clean_emp;qu_kernel_call_frame.
