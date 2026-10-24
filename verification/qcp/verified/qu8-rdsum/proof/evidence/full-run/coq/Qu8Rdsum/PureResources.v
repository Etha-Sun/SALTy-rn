From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export NeonWindowTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* Only used for a purely logical conclusion.  It reads the subheaps supplied
   by separation conjunction and applies already checked typed-store facts;
   it does not reconstruct a postcondition or discard a required C VC. *)
Ltac rd_pure_resources :=
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with H:sepcon ?P ?Q ?h |- _ =>
  let h1:=fresh "subheap"in let h2:=fresh "subheap"in let HJ:=fresh "HJoin"in
  let HP:=fresh "HOwned"in let HQ:=fresh "HOwned"in
  destruct H as[h1[h2[HJ[HP HQ]]]]
 end;
 repeat first[
  match goal with H:rd_mem ?M ?h |- _=>
   let HR:=fresh "HMapRange"in let HA:=fresh "HMapAddress"in
   pose proof(rd_mem_range M h H)as HR;pose proof(rd_mem_addresses M h H)as HA;change(forall q,rd_present M q -> 0<=rd_get M q<=255)in HR;change(forall q,rd_present M q ->0<=q<=18446744073709551615)in HA;clear H
  end|
  match goal with H:UIntArray.full ?p ?n ?A ?h |- _=>
   let HR:=fresh "HArrayRange"in let HL:=fresh "HArrayLength"in
   pose proof(rd_full_init_range p n A h H)as HR;pose proof(UIntArray.full_Zlength p n A h H)as HL;change(rd_init_range A)in HR;change(Zlength A=n)in HL;clear H
  end|
  match goal with H:store_uint ?p ?v ?h |- _=>let HR:=fresh "HWordRange"in pose proof(store_uint_range p v h H)as HR;change(0<=v<=Int.max_unsigned)in HR;clear H end|
  match goal with H:store_ushort ?p ?v ?h |- _=>let HR:=fresh "HHalfRange"in pose proof(store_ushort_range p v h H)as HR;change(0<=v<=65535)in HR;clear H end|
  match goal with H:store_uchar ?p ?v ?h |- _=>let HR:=fresh "HByteRange"in pose proof(store_uchar_range p v h H)as HR;change(0<=v<=Byte.max_unsigned)in HR;clear H end];
 try change Int.min_signed with (-2147483648)in *;try change Int.max_signed with 2147483647 in *;
 try change Byte.min_signed with (-128)in *;try change Byte.max_signed with 127 in *.
Ltac rd_pure_window_one j off width :=
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
 ltac:(unfold rd_zero_size;first[apply Z.le_trans with 8;[lia|apply Z.le_max_l]|eapply Z.le_trans;[apply Z.min_glb;lia|apply Z.le_max_r]]))as HW;
 cbv zeta in HW;rewrite ?Z.add_0_r,?Z.add_0_l in HW;
 first[unify j 0;let E:=fresh "ESelectZero"in assert(E:selected=normal)by(unfold rd_select_ptr;destruct(Z.ltb_spec 0 cb);[reflexivity|lia]);rewrite E in HW|idtac];
 destruct HW as[?HPositive[?HWindow ?HCapacity]]
 end.
Ltac rd_pure_windows width :=
 try rd_pure_window_one 0 0 width;try rd_pure_window_one 1 0 width;try rd_pure_window_one 2 0 width;
 try rd_pure_window_one 3 0 width;try rd_pure_window_one 4 0 width;try rd_pure_window_one 5 0 width;try rd_pure_window_one 6 0 width;
 try rd_pure_window_one 0 8 width;try rd_pure_window_one 1 8 width;try rd_pure_window_one 2 8 width;
 try rd_pure_window_one 3 8 width;try rd_pure_window_one 4 8 width;try rd_pure_window_one 5 8 width;try rd_pure_window_one 6 8 width.
Ltac rd_pure_neon := rd_limits;try change UINT64_MAX with 18446744073709551615 in *;rd_pure_resources;try rd_pure_windows 8;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 repeat first[assumption|split|reflexivity];try congruence;try lia.
Ltac rd_pure_caller := rd_limits;try change UINT64_MAX with 18446744073709551615 in *;
 rd_pure_resources;
 try multimatch goal with |- context[rd_window ?M ?p ?width]=>rd_pure_windows width end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 repeat first[assumption|split|reflexivity];try congruence;try lia.
Ltac rd_record_caller := rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_pure_caller|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]].
