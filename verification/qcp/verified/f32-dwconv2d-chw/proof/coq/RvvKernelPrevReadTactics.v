From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelLastReadTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_prev_read_solve :=try left;intros;
 try change INT_MAX with 2147483647 in *;try change INT_MIN with(-2147483648)in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *;
 unfold dw_same in *;subst;repeat rewrite <-Z.add_sub_assoc in *;dw_kernel_context;
 repeat match goal with|-context[unsigned_last_nbits ?x 64]=>
 rewrite(unsigned_last_nbits_eq x 64)by(change(0<=x<18446744073709551616);lia)end;
 try unfold UndefStructPredvfloat32m2_t;
 rewrite ?qm_local_field_address;rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_r in *;
 autorewrite with dw_fields in *;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[dw_last_read_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_last_read_pure]
 |solve[entailer!;lia]].
