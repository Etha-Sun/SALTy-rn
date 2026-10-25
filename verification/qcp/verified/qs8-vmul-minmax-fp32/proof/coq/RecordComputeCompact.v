From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordComputeFacts RecordInputFacts RecordFPConsumerFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac qm_compute_compact_start:=try left;intros;
 try change INT_MAX with 2147483647 in *;try change INT_MIN with(-2147483648)in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 subst;autorewrite with qm_record_input qm_record qm_record_fp in *;
 rewrite ?qm_magic_decimal in *;
 rewrite ?qm_local_field_address;repeat progress rewrite<-logic_equiv_andp_assoc.
Ltac qm_compute_compact_solve:=qm_compute_compact_start;
 first[solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_pure]|solve[entailer!;lia]].
