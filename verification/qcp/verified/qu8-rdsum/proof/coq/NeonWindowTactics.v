From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export NeonCallsTactics NeonBitFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_window_one j off :=
 lazymatch goal with |- ?P |-- _ =>
 match P with context[rd_partial ?M ?base ?rows ?Ch ?stride ?k ?A]=>
 match goal with Hin:rd_inputs M base rows Ch stride,
 Hz:rd_zero_condition M ?zero rows Ch,
 HA:(forall q,rd_present M q ->0<=q<=18446744073709551615),
 HC:0< ?cb,HL:?cb<=rd_min252 ?r,
 Hstep:Z.rem (rd_min252 ?r- ?cb)7=0,Hmod:rd_mod252(rows- ?r)=0 |- _ =>
 let HModStep:=fresh "HModStep"in pose proof Hstep as HModStep;rewrite Z.rem_mod_nonneg in HModStep by lia;
 let normal:=constr:(rd_u64(base+k+(rows-r+(rd_min252 r-cb)+j)*stride))in
 let selected:=constr:(rd_select_ptr cb j normal zero)in
 let HW:=fresh "HReadWindow"in
 pose proof(rd_selected_read_window M base rows Ch stride k r cb j zero off 8
 HA Hin Hz ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 HModStep Hmod ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 ltac:(unfold rd_zero_size;first[apply Z.le_trans with 8;[lia|apply Z.le_max_l]|eapply Z.le_trans;[apply Z.min_glb;lia|apply Z.le_max_r]]))as HW;
 cbv zeta in HW;
 first[unify j 0;let E:=fresh "ESelectZero"in assert(E:selected=normal)by(unfold rd_select_ptr;destruct(Z.ltb_spec 0 cb);[reflexivity|lia]);rewrite E in HW|idtac];
 destruct HW as[?HPositive[?HWindow ?HCapacity]]
 end end end.
Ltac rd_all_windows :=
 try rd_window_one 0 0;try rd_window_one 1 0;try rd_window_one 2 0;
 try rd_window_one 3 0;try rd_window_one 4 0;try rd_window_one 5 0;try rd_window_one 6 0;
 try rd_window_one 0 8;try rd_window_one 1 8;try rd_window_one 2 8;
 try rd_window_one 3 8;try rd_window_one 4 8;try rd_window_one 5 8;try rd_window_one 6 8.
Ltac rd_read_bound t :=
 lazymatch goal with H:_<=t<=_ |- _=>fail 0|_=>
 lazymatch t with rd_read_lane ?M ?p ?i ?vl=>
 match goal with HR:(forall q,rd_present M q ->0<=rd_get M q<=255),HW:rd_window M p vl |- _=>
 let HB:=fresh "HReadBound"in pose proof(rd_read_lane_range M p i vl HR HW ltac:(lia))as HB
 end end end.
Ltac rd_more_reads := repeat progress(multimatch goal with |- context[rd_read_lane ?M ?p ?i ?vl]=>rd_read_bound(rd_read_lane M p i vl)end).
Ltac rd_window_caller := rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|
 try rd_array_ranges;try rd_map_ranges;try rd_all_windows;try rd_more_reads;try rd_collect_bounds;
 try match goal with Hn:0<= ?n,Hb:Z.land ?n 4<>0 |- _=>pose proof(rd_bit4_set_lower n Hn Hb)end;
 try match goal with Hn:0<= ?n,Hb:Z.land ?n 2<>0 |- _=>pose proof(rd_bit2_set_lower n Hn Hb)end;
 first[solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]].
