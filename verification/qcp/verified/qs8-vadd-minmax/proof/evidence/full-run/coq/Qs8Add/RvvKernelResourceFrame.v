From Qs8Add Require Export RvvKernelCallAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_clean_emp :=
 repeat first[
  match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
  |rewrite logic_equiv_sepcon_emp].
Ltac qa_rvv_resource_frame := qa_clean_emp;qa_rvv_kernel_call_frame.
