From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_last_read_fact :=first[dw_kernel_fact|
 lazymatch goal with |- dw_present ?F (?p+4*?x+?v*4)=>
 replace(p+4*x+v*4)with(p+4*(x+v))by ring;
 eapply dw_row_read_present;[eassumption|lia]end].
Ltac dw_last_read_pure :=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;dw_last_read_fact.
Ltac dw_last_read_solve :=try left;intros;
 try change INT_MAX with 2147483647 in *;try change INT_MIN with(-2147483648)in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *;
 unfold dw_same in *;subst;repeat rewrite <-Z.add_sub_assoc in *;dw_kernel_context;
 try unfold UndefStructPredvfloat32m2_t;
 rewrite ?qm_local_field_address;rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_r in *;
 autorewrite with dw_fields in *;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[dw_last_read_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_last_read_pure]
 |solve[entailer!;lia]].
