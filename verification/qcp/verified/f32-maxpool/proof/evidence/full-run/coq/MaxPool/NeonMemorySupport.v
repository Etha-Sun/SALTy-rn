From MaxPool Require Export NeonAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mpm_prepare := mp_intro;subst;mp_integer_constants;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 try change Arch64.ptr_size_Z with 8 in *;
 rewrite ?Z.sub_diag,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *.
