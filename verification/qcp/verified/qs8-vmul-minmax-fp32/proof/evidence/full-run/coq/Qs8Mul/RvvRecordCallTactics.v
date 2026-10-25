From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordComputeFrame RecordLoopFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_mem qm_values qm_rvv_values qm_record_compute_match qm_record_load_match.
Ltac qm_record_main_start:=qm_compute_compact_start;
 try change UINT64_MAX with 18446744073709551615 in *;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?Z.rem_1_r,?Z.quot_1_r in *.
Ltac qm_record_main_fact:=first[assumption|reflexivity|lia|
 solve[eapply qm_inputs_window_a;[eassumption|lia|lia|lia]]|
 solve[eapply qm_inputs_window_b;[eassumption|lia|lia|lia]]].
Ltac qm_record_main_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;qm_record_main_fact.
Ltac qm_record_main_solve:=qm_record_main_start;
 first[solve[qm_record_main_pure]|solve[apply _derivable1_andp_intros;[qm_record_main_pure|qm_compute_frame]]|solve[qm_compute_frame]|solve[entailer!;lia]].
