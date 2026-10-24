From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export CallerCaps.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_pure_origin off width :=
 match goal with HView:rd_init_range(rd_partial ?M ?base ?rows ?Ch ?stride ?k ?A),
 Hin:rd_inputs ?M ?base ?rows ?Ch ?stride,
 Hz:rd_zero_condition ?M ?zero ?rows ?Ch,
 HA:(forall q,rd_present ?M q ->0<=q<=18446744073709551615),
 HC:0 < ?cb,HL:?cb <= rd_min252 ?r,
 Hstep:Z.rem(rd_min252 ?r- ?cb)7=0,Hmod:rd_mod252(?rows- ?r)=0 |- _ =>
 let HModStep:=fresh "HModStep"in pose proof Hstep as HModStep;rewrite Z.rem_mod_nonneg in HModStep by lia;
 let HW:=fresh "HReadOrigin"in
 pose proof(rd_selected_read_window M base rows Ch stride k r cb 0 zero off width
 HA Hin Hz ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 HModStep Hmod ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
 ltac:(apply rd_zero_size_covers;first[left;lia|right;split;lia]))as HW;
 cbv zeta in HW;unfold rd_select_ptr in HW;
 let E:=fresh "EZeroLive"in assert(E:Z.ltb 0 cb=true)by(apply Z.ltb_lt;lia);rewrite E in HW;
 rewrite ?Z.add_0_r,?Z.add_0_l in HW;
 destruct HW as[?HPositive[?HWindow ?HCapacity]]
 end.
Ltac rd_bit_bounds :=
 try match goal with Hb:rd_bit4 ?n<>0 |- _=>let HL:=fresh "HBit4Lower"in assert(HL:4<=n)by(apply rd_bit4_set_lower;[lia|exact Hb])end;
 try match goal with Hb:rd_bit2 ?n<>0 |- _=>let HL:=fresh "HBit2Lower"in assert(HL:2<=n)by(apply rd_bit2_set_lower;[lia|exact Hb])end;
 try match goal with Hb:Z.land ?n 4<>0 |- _=>let HL:=fresh "HBit4Lower"in assert(HL:4<=n)by(apply rd_bit4_set_lower;[lia|exact Hb])end;
 try match goal with Hb:Z.land ?n 2<>0 |- _=>let HL:=fresh "HBit2Lower"in assert(HL:2<=n)by(apply rd_bit2_set_lower;[lia|exact Hb])end.
Ltac rd_pure_caller_origin := rd_limits;try change UINT64_MAX with 18446744073709551615 in *;
 rd_pure_resources;try rd_min252_bounds;rd_bit_bounds;
 try multimatch goal with |- context[rd_window ?M ?p ?width]=>rd_pure_windows_cap width;try rd_pure_origin 0 width;try rd_pure_origin 8 width end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 repeat first[assumption|split|reflexivity];try congruence;try lia.
Ltac rd_record_caller_origin := rd_limits;
 try(unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint32x2_t,UndefStructPredint32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_pure_caller_origin|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]].
