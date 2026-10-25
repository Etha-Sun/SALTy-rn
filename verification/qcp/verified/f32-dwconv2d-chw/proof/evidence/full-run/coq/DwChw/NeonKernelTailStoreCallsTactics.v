From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelTactics NeonKernelTailCallFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results dw_neon_vector_match4 dw_neon_vector_pixel dw_arm_fma dw_arm_min dw_arm_max.
Ltac dw_root_tail_store_prepare:=
 try left;intros;change(sizeof(FLOAT))with 4 in *;
 subst;
 match goal with HR:Z.rem ?w 4=0,HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?N|-_=>
 let HM:=fresh "HrootMod"in assert(HM:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact HR);
 let HC:=fresh "HrootColumn"in pose proof(dw_neon_quot_position_exact N w ltac:(lia)HM)as HC;
 let HB:=fresh "HrootColumnBounds"in assert(HB:0<=(4*N-w)÷4<=N)by lia;
 try(let HT:=fresh "HrootTwo"in assert(HT:8<=w)by(apply dw_tail_store_two_bound;first[lia|assumption]));
 try(let HT:=fresh "HrootLast"in assert(HT:12<=w)by(apply dw_tail_store_last_bound;first[lia|assumption]))
 end;
 try unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,UndefStructPreduint32x4_t;
 rewrite ?qm_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc.
Ltac dw_root_tail_store_fact:=first[
 assumption|reflexivity|lia|
 solve[eapply(dw_output_row_window_offset _ _ _ _ _ _ 2 _);first[eassumption|lia]]|
 solve[eapply dw_output_row_window;first[eassumption|lia]]|
 solve[unfold dw_same;reflexivity]].
Ltac dw_root_tail_store_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_/\_=>split end;dw_root_tail_store_fact.
Ltac dw_root_tail_store_solve:=dw_root_tail_store_prepare;
 first[solve[dw_root_tail_store_pure]
 |solve[apply _derivable1_andp_intros;[dw_root_tail_store_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]].
