From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export PureResources.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_zero_size_covers : forall channels width,
 width<=8 \/ (width<=40 /\ (width<=channels \/ 32<=channels)) ->width<=rd_zero_size channels.
Proof.
 intros channels width Hw;unfold rd_zero_size;destruct(Z.leb_spec 32 channels)as[Hlarge|Hsmall].
 - destruct Hw as[H|[H _]];lia.
 - destruct Hw as[H|[H[Hc|Hc]]];[eapply Z.le_trans;[exact H|apply Z.le_max_l]|eapply Z.le_trans;[exact Hc|apply Z.le_max_r]|lia].
Qed.
Ltac rd_pure_window_cap j off width :=
 match goal with HView:rd_init_range(rd_partial ?M ?base ?rows ?Ch ?stride ?k ?A),
 Hin:rd_inputs ?M ?base ?rows ?Ch ?stride,
 Hz:rd_zero_condition ?M ?zero ?rows ?Ch,
 HA:(forall q,rd_present ?M q ->0<=q<=18446744073709551615),
 HC:0 < ?cb,HL:?cb <= rd_min252 ?r,
 Hstep:Z.rem(rd_min252 ?r- ?cb)7=0,Hmod:rd_mod252(?rows- ?r)=0 |- _ =>
 let HModStep:=fresh "HModStep"in pose proof Hstep as HModStep;rewrite Z.rem_mod_nonneg in HModStep by lia;
 let normal:=constr:(rd_u64(base+k+(rows-r+(rd_min252 r-cb)+j)*stride))in
 let selected:=constr:(rd_select_ptr cb j normal zero)in
 let HW:=fresh "HReadWindow"in
 pose proof(rd_selected_read_window M base rows Ch stride k r cb j zero off width
 HA Hin Hz ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 HModStep Hmod ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 ltac:(apply rd_zero_size_covers;first[left;lia|right;split;[lia|first[left;lia|right;lia]]]))as HW;
 cbv zeta in HW;rewrite ?Z.add_0_r,?Z.add_0_l in HW;
 first[unify j 0;let E:=fresh "ESelectZero"in assert(E:selected=normal)by(unfold rd_select_ptr;destruct(Z.ltb_spec 0 cb);[reflexivity|lia]);rewrite E in HW|idtac];
 destruct HW as[?HPositive[?HWindow ?HCapacity]]
 end.
Ltac rd_pure_windows_cap width :=
 try rd_pure_window_cap 0 0 width;try rd_pure_window_cap 1 0 width;try rd_pure_window_cap 2 0 width;
 try rd_pure_window_cap 3 0 width;try rd_pure_window_cap 4 0 width;try rd_pure_window_cap 5 0 width;try rd_pure_window_cap 6 0 width;
 try rd_pure_window_cap 0 8 width;try rd_pure_window_cap 1 8 width;try rd_pure_window_cap 2 8 width;
 try rd_pure_window_cap 3 8 width;try rd_pure_window_cap 4 8 width;try rd_pure_window_cap 5 8 width;try rd_pure_window_cap 6 8 width.
Ltac rd_min252_bounds :=
 match goal with H: ?cb <= rd_min252 ?r |- _=>let HB:=fresh "HMin252"in pose proof(rd_min252_range r ltac:(lia))as HB end.
Ltac rd_pure_caller_cap := rd_limits;try change UINT64_MAX with 18446744073709551615 in *;
 rd_pure_resources;try rd_min252_bounds;
 try multimatch goal with |- context[rd_window ?M ?p ?width]=>rd_pure_windows_cap width end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 repeat first[assumption|split|reflexivity];try congruence;try lia.
Ltac rd_record_caller_cap := rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_pure_caller_cap|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]].
Print Assumptions rd_zero_size_covers.
