From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export KernelFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_mem qm_values qm_lane qm_neon_lane qm_arm_add qm_arm_mul qm_signed_bits qm_sat8 qm_sat16 qm_sat32.
Ltac qm_k_present :=
 match goal with H:qm_inputs ?M ?pa ?pb ?n |-rd_present ?M ?p=>
 first[replace p with(pa+(p-pa))by lia;apply(proj1 H (p-pa));lia
      |replace p with(pb+(p-pb))by lia;apply(proj2 H (p-pb));lia]
 end.
Ltac qm_k_window :=
 match goal with H:qm_inputs ?M ?pa ?pb ?n |-rd_window ?M ?p ?r=>
 first[replace p with(pa+(p-pa))by lia;eapply(qm_inputs_window_a M pa pb n (p-pa) r);[exact H|lia|lia|lia]
      |replace p with(pb+(p-pb))by lia;eapply(qm_inputs_window_b M pa pb n (p-pb) r);[exact H|lia|lia|lia]]
 end.
Ltac qm_k_range M p :=
 first[match goal with H: -128<=rd_get M p<=127 |- _=>idtac end
 |let E:=fresh "Hbyte"in assert(E:-128<=rd_get M p<=127)by
   (match goal with H:forall p:Z,rd_present M p ->-128<=rd_get M p<=127 |- _=>apply H;qm_k_present end)].
Ltac qm_k_walk t :=
 lazymatch t with
 |rd_get ?M ?p=>try(qm_k_range M p)
 |?f ?a=>qm_k_walk f;qm_k_walk a
 |_=>idtac
 end.
Ltac qm_k_fact :=first[assumption|reflexivity|lia|qm_k_window
 |match goal with |-?T=>qm_k_walk T;lia end
 |qm_pure_fact].
Ltac qm_k_pure :=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _/\_=>split end;qm_k_fact.
Ltac qm_k_start :=intros;
 try change INT_MAX with 2147483647 in *;
 try change INT_MIN with (-2147483648) in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 change(sizeof(CHAR))with 1 in *;
 rewrite ?Z.mul_1_r,?Z.add_0_r,?qm_magic_decimal in *;
 try unfold UndefStructPredint8x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?qm_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 subst;autorewrite with qm_ext qm_vector in *.
Ltac qm_k_finish :=first[
 solve[exfalso;lia]
 |solve[apply _derivable1_andp_intros;[qm_k_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[qm_k_pure]
 |solve[entailer!;lia]].
Ltac qm_k_solve :=qm_k_start;first[qm_k_finish
 |let Hmapranges:=fresh "Hmapranges"in qm_capture_ranges Hmapranges;qm_k_finish
 |let Hmapaddresses:=fresh "Hmapaddresses"in qm_capture_addresses Hmapaddresses;qm_k_finish].
