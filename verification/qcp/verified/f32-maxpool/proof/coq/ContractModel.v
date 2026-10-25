From Coq Require Import ZArith List.
From MaxPool Require Export ProgramModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition mp_word64(x:Z):Prop:=0<=x<=18446744073709551615.
Definition mp_pointer_count(K:Z):Z:=Z.max 1 K.
Definition mp_pixel_readable(F:MPFloatMap)(PT:MPPtrMap)(table offset K channels:Z):Prop:=
 mp_ptr_window PT table(mp_pointer_count K) /\
 forall i,0<=i<mp_pointer_count K->
 mp_window F(mp_u64(mp_ptr_get PT(table+8*i)+offset))(channels+3).
(* Memory footprint only: no result, output equality, NaN/finite restriction,
   ordered-bound condition or artificial32-bit size bound occurs here. *)
Definition mp_geometry(F:MPFloatMap)(PT:MPPtrMap)(W:list Z)
 (pixels K channels table offset input_stride input_inc output output_inc:Z):Prop:=
 NoDup W /\ forall p,0<=p<pixels->
 mp_pixel_readable F PT(mp_table_at table input_inc p)(mp_offset_at offset input_stride p)K channels /\
 mp_write_window W(mp_output_at output output_inc p)(channels+3).
Definition mp_complete(F:MPFloatMap)(PT:MPPtrMap)(O:MPOutput)
 (pixels K channels table offset input_stride input_inc output output_inc:Z)(lo hi:fp32):MPOutput:=
 mp_finish_pixels F PT O table offset input_stride input_inc output output_inc K channels lo hi(Z.to_nat pixels).
