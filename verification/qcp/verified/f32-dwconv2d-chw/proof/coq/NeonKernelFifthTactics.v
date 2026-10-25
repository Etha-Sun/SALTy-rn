From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelFacts MemoryProbeTactics Mask7IndexFacts NeonKernelInitialRow3 NeonKernelTailCallFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results dw_neon_vector_match4 dw_neon_vector_pixel dw_arm_fma dw_arm_min dw_arm_max.
Ltac dw_neon_fifth_context:=
 try(match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width|-_=>
 let HG:=fresh "Hgeom"in pose proof(dw_input_geometry _ _ _ _ _ _ _ HI)as HG;destruct HG as[?[?[? ?]]];
 let HW:=fresh "Hwindows"in pose proof(dw_input_windows _ _ _ _ _ _ _ HI)as HW;destruct HW as[?[?[? ?]]];
 let HP:=fresh "Hpadding"in pose proof(dw_neon_width_padding _ _ _ _ _ _ _ HI)as HP
 end);
 try(match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width,HBW:?w<=4*?width,HM:?w mod 4=0|-_=>
 let HE:=fresh "Hcolumn"in pose proof(dw_neon_position_exact width w HM)as HE;
 let HB:=fresh "HcolumnBounds"in pose proof(dw_neon_position_bounds width w ltac:(lia)HM)as HB;destruct HB
 end).
Ltac dw_neon_fifth_window:=first[
 solve[eapply(dw_read_window_shift _ _ _ 8 _);[eassumption|lia|lia|lia]]|
 solve[eapply(dw_read_window_shift _ _ _ 4 _);[eassumption|lia|lia|lia]]|
 lazymatch goal with|-dw_window ?F (dw_row_base ?a ?z ?h ?n ?y) ?k=>
 let b:=constr:(dw_row_base a z h n y)in replace b with(b+4*0)at 1 by ring;
 eapply dw_row_read_window;[eassumption|lia|lia|lia]end|
 solve[eapply dw_row_read_window;[eassumption|lia|lia|lia]]|
 lazymatch goal with
 | H:dw_window ?F ?p ?count |- dw_window ?F (?p+4*?k) ?n=>eapply dw_read_window_shift;[exact H|lia|lia|lia]
 | H:dw_window ?F ?p ?count |- dw_window ?F ?p ?n=>
   replace p with(p+4*0)at 1 by lia;eapply dw_read_window_shift;[exact H|lia|lia|lia]
 end].
Ltac dw_neon_fifth_fact:=first[assumption|reflexivity|lia|
 solve[eapply(dw_output_row_window_offset _ _ _ _ _ _ 2 _);first[eassumption|lia]]|
 solve[unfold dw_same;reflexivity]|
 solve[dw_neon_fifth_window]|
 solve[unfold dw_load_allowed;right;dw_neon_fifth_window]|
 solve[eapply dw_row_read_present;[eassumption|lia]]|
 solve[unfold dw_store_allowed;right;eapply dw_output_row_window;[eassumption|lia|lia|lia|lia|lia|lia|lia]]|
 solve[eapply dw_output_row_window;[eassumption|lia|lia|lia|lia|lia|lia|lia]]].
Ltac dw_neon_fifth_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;dw_neon_fifth_fact.
Ltac dw_neon_fifth_solve:=try left;intros;
 try change INT_MAX with 2147483647 in *;try change INT_MIN with(-2147483648)in *;
 try change UINT_MAX with 4294967295 in *;try change UINT64_MAX with 18446744073709551615 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *;try change(sizeof(INT))with 4 in *;
 unfold dw_same in *;subst;repeat rewrite <-Z.add_sub_assoc in *;dw_neon_fifth_context;
 try(match goal with HR:Z.rem ?w 4=0,Hbit:Z.land ?w ?bit<>0|-_=>
  let B:=eval vm_compute in bit in
  lazymatch B with 8%Z=>change(Z.land w 8<>0)in Hbit|4%Z=>change(Z.land w 4<>0)in Hbit end
 end);
 try(match goal with HR:Z.rem ?w 4=0,Hbit:Z.land ?w ?bit<>0|-_=>
  let B:=eval vm_compute in bit in
  lazymatch B with 8%Z=>change(Z.land w 8<>0)in Hbit|4%Z=>change(Z.land w 4<>0)in Hbit end
 end);
 try(match goal with HR:Z.rem ?w 4=0,H8:Z.land ?w 8<>0|-_=>
  let HB:=fresh "HtwoLaneBound"in pose proof(dw_tail_store_two_bound w ltac:(lia)HR H8)as HB end);
 try(match goal with HR:Z.rem ?w 4=0,H8:Z.land ?w 8<>0,H4:Z.land ?w 4<>0|-_=>
  let HB:=fresh "HlastLaneBound"in pose proof(dw_tail_store_last_bound w ltac:(lia)HR H8 H4)as HB end);
 try(match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width,HBW:?w<=4*?width,HR:Z.rem ?w 4=0|-_=>
  let HWM:=fresh "HremainingMod"in assert(HWM:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact HR);
  let HC:=fresh "HsourceColumn"in pose proof(dw_neon_quot_position_exact width w ltac:(lia)HWM)as HC;
  let HB:=fresh "HsourceColumnBounds"in assert(HB:0<=(4*width-w)÷4<=width)by lia;destruct HB
 end);
 try(match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width|-_=>
  try(let HR:=fresh "Hrow1Window"in pose proof(dw_initial_input_row1_window F input zero weights params height width HI ltac:(lia))as HR);
  try(let HR:=fresh "Hrow2Window"in pose proof(dw_initial_input_row2_window F input zero weights params height width HI ltac:(lia))as HR);
  try(let HR:=fresh "Hrow3Window"in pose proof(dw_initial_input_row3_window F input zero weights params height width HI ltac:(lia))as HR);
  let HM:=fresh "HmaskIndex"in pose proof(dw_mask_index_source_range width)as HM;unfold dw_mask_index_source in HM
 end);
 try(match goal with HP:dw_outer_pointers ?input ?zero ?output ?height ?width ?rem _ _ _ _ _ _ _ _|-_=>
  let HO:=fresh "HouterPreserved"in pose proof HP as HO;
  assert(Hnonzero:rem<>0)by lia;
  unfold dw_outer_pointers in HP;destruct HP as[Hbad|HP];[exfalso;lia|];
  cbv zeta in HP;repeat match type of HP with _/\_=>destruct HP as[? HP]end;
  repeat match goal with HE:_<=rem->_|-_=>first[specialize(HE ltac:(lia))|clear HE]end;
  subst
 end);
 try unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,UndefStructPreduint32x4_t;
 rewrite ?qm_local_field_address;rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_r in *;
 autorewrite with dw_fields dw_neon_fields in *;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[solve[dw_neon_fifth_pure]|solve[apply _derivable1_andp_intros;[dw_neon_fifth_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_neon_fifth_pure]|solve[entailer!;lia]].
