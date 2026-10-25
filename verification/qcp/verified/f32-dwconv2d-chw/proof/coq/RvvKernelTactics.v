From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_rvv_results dw_vector_match8.
Ltac dw_kernel_context :=
 try(match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width |- _=>
  let HG:=fresh "Hgeometry"in pose proof(dw_input_geometry F input zero weights params height width HI)as HG;
  let HW:=fresh "Hwindows"in pose proof(dw_input_windows F input zero weights params height width HI)as HW;
  destruct HG as[?[?[? ?]]];destruct HW as[?[?[? ?]]]
 end);
 try(match goal with HV:dw_vl_allowed ?n ?vl |- _=>
  let HB:=fresh "Hvlbounds"in pose proof(dw_legal_vl_positive n vl ltac:(lia)HV)as HB;destruct HB as[? ?]
 end).
Ltac dw_kernel_present :=
 first[eapply dw_row_read_present;[eassumption|lia]
 |lazymatch goal with
  | H:dw_window ?F ?p ?n |-dw_present ?F ?p=>replace p with(p+4*0)by lia;eapply dw_window_lane;[exact H|lia]
  | H:dw_window ?F ?p ?n |-dw_present ?F (?p+?off)=>let k:=eval cbv in(off/4)in replace(p+off)with(p+4*k)by lia;eapply dw_window_lane;[exact H|lia]
  end].
Ltac dw_kernel_fact := first[assumption|reflexivity|lia
 |solve[unfold dw_same;reflexivity]
 |solve[unfold dw_fp_match;right;reflexivity]
 |solve[unfold dw_load_allowed;right;eapply dw_row_read_window;[eassumption|lia|lia|lia]]
 |solve[dw_kernel_present]
 |solve[unfold dw_store_allowed;right;eapply dw_output_row_window;[eassumption|lia|lia|lia|lia|lia|lia|lia]]
 |solve[eapply dw_output_row_window;[eassumption|lia|lia|lia|lia|lia|lia|lia]]].
Ltac dw_kernel_pure :=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;dw_kernel_fact.
Ltac dw_kernel_solve :=try left;intros;
 try change INT_MAX with 2147483647 in *;try change INT_MIN with(-2147483648)in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *;
 unfold dw_same in *;subst;repeat rewrite <-Z.add_sub_assoc in *;dw_kernel_context;
 try unfold UndefStructPredvfloat32m2_t;
 rewrite ?qm_local_field_address;rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_r in *;
 autorewrite with dw_fields in *;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[dw_kernel_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_kernel_pure]
 |solve[entailer!;lia]].
