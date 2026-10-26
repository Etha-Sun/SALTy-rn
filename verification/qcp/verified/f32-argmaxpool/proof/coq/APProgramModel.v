From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export ProgramModel ReadWindows.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Record APProgram:Type:=ap_program{
 app_pixels:Z;app_rows:Z;app_channels:Z;
 app_input:Z;app_offset:Z;app_pixel_stride:Z;
 app_output_base:Z;app_index_base:Z;
 app_input_increment:Z;app_output_increment:Z;app_index_increment:Z
}.
(* At pixel zero the actual C argument is retained verbatim. Subsequent
   explicit uintptr_t arithmetic has the original modulo64 semantics. *)
Definition app_advance(base increment pixel:Z):Z:=
 if Z.eqb pixel 0 then base else ap_u64(base+pixel*increment).
Definition app_table(D:APProgram)(pixel:Z):Z:=app_advance(app_input D)(app_input_increment D)pixel.
Definition app_offset_at(D:APProgram)(pixel:Z):Z:=app_advance(app_offset D)(app_pixel_stride D)pixel.
Definition app_output_at(D:APProgram)(pixel:Z):Z:=app_advance(app_output_base D)(app_output_increment D)pixel.
Definition app_index_at(D:APProgram)(pixel:Z):Z:=app_advance(app_index_base D)(app_index_increment D)pixel.
Definition app_groups(K:Z):Z:=(K+8)/9.
Definition app_remaining(K group:Z):Z:=Z.max 0(K-9*group).
Definition app_consumed(K group:Z):Z:=Z.min K(9*group).
Definition app_index_base_at(group:Z):Z:=ap_u32(9*group).
Definition app_row_index(K group row:Z):Z:=ap_pass_row(9*group)(app_remaining K group)row.
Definition app_row_pointer(P:APPtrMap)(table K group row:Z):Z:=ap_ptr_get P(table+8*app_row_index K group row).
Definition app_row_base(P:APPtrMap)(table offset K group row:Z):Z:=ap_u64(app_row_pointer P table K group row+offset).
Definition app_row_cursor(P:APPtrMap)(table offset K group row done:Z):Z:=app_row_base P table offset K group row+4*done.
Definition app_table_cursor(table K group:Z):Z:=table+8*app_consumed K group.
Definition app_table_read_cursor(table K group read_count:Z):Z:=table+8*(9*group+Z.min(app_remaining K group)(Z.max 1 read_count)).
Definition app_output_cursor(base done:Z):Z:=base+4*done.
Definition app_word64(x:Z):Prop:=0<=x<18446744073709551616.
Definition app_word32(x:Z):Prop:=0<=x<4294967296.

(* readonly maps are shared across all row/pixel views; table values may be
   NULL if the actual wrapped offset still yields a valid read window. *)
Definition app_geometry(F:APMap)(P:APPtrMap)(W WI:list Z)(D:APProgram):Prop:=
 0<app_pixels D /\ 0<app_rows D /\ 0<app_channels D /\
 forall pixel,0<=pixel<app_pixels D->
 ap_ptr_window P(app_table D pixel)(app_rows D) /\
 (forall row,0<=row<app_rows D->
  ap_window F(ap_u64(ap_ptr_get P(app_table D pixel+8*row)+app_offset_at D pixel))(app_channels D+3)) /\
 ap_write_window W(app_output_at D pixel)(app_channels D) /\
 ap_write_window WI(app_index_at D pixel)(app_channels D).

Definition app_step(side:bool)(F:APMap)(P:APPtrMap)(table offset channel:Z):Z->Z->option(fp32*Z)->fp32*Z:=
 if side then ap_neon_pass F P table offset channel else ap_rvv_pass F P table offset channel.
Definition app_lane_prefix(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel groups channel:Z):option(fp32*Z):=
 ap_run_passes(app_step side F P(app_table D pixel)(app_offset_at D pixel)channel)
 (Z.to_nat groups)0(app_rows D)None.
(* None is used only before pass zero. Every consumed result has at least one
   real pass; initialization is proved before a previous-output load. *)
Definition app_lane_value(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel groups channel:Z):fp32*Z:=
 ap_finish(app_lane_prefix side F P D pixel groups channel).
Definition APPairState:Type:=APOutput*APIndex.
Definition app_write_pair(S:APPairState)(out idx count:Z)(value:Z->fp32*Z):APPairState:=
 (ap_output_write(fst S)out count(fun j=>fst(value j)),
  ap_index_write(snd S)idx count(fun j=>snd(value j))).
Definition app_pass_complete(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel groups:Z)(S:APPairState):APPairState:=
 if Z.leb groups 0 then S else
 app_write_pair S(app_output_at D pixel)(app_index_at D pixel)(app_channels D)
 (app_lane_value side F P D pixel groups).
Definition app_pass_partial(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel group done:Z)(S:APPairState):APPairState:=
 app_write_pair(app_pass_complete side F P D pixel group S)
 (app_output_at D pixel)(app_index_at D pixel)done
 (app_lane_value side F P D pixel(group+1)).
Definition app_finish_pixel(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel:Z)(S:APPairState):APPairState:=
 app_pass_complete side F P D pixel(app_groups(app_rows D))S.
Definition app_pixel_before(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixels:Z)(S:APPairState):APPairState:=
 fold_left(fun state pixel=>app_finish_pixel side F P D(Z.of_nat pixel)state)(seq 0(Z.to_nat pixels))S.
Definition app_program_result(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(S:APPairState):APPairState:=
 app_pixel_before side F P D(app_pixels D)S.
