From Coq Require Import ZArith List.
From MaxPool Require Export ContractModel.
Local Open Scope Z_scope.
(* Logical byte-address calculations are hidden behind functions: writing p+4
   in a C annotation would scale a float-pointer by four elements. *)
Definition mp_row_index(K group row:Z):Z:=
 9*group+(if Z.ltb row(K-9*group)then row else 0).
Definition mp_row_base(PT:MPPtrMap)(table offset K group row:Z):Z:=
 mp_u64(mp_ptr_get PT(table+8*mp_row_index K group row)+offset).
Definition mp_row_pointer(PT:MPPtrMap)(table K group row:Z):Z:=
 mp_ptr_get PT(table+8*mp_row_index K group row).
Definition mp_table_read_cursor(table K group width:Z):Z:=
 table+8*(9*group+Z.max 1(Z.min(K-9*group)width)).
Definition mp_row_cursor(PT:MPPtrMap)(table offset K group row channel:Z):Z:=
 mp_row_base PT table offset K group row+4*channel.
Definition mp_output_cursor(output channel:Z):Z:=output+4*channel.
Definition mp_consumed(K groups:Z):Z:=
 if Z.ltb K 1 then 1 else Z.min K(9*(groups+1)).
Definition mp_table_cursor(table K groups:Z):Z:=table+8*mp_consumed K groups.
Definition mp_k_after(K groups:Z):Z:=Z.max 0(K-9*(groups+1)).
Definition mp_pixel_before(F:MPFloatMap)(PT:MPPtrMap)(O:MPOutput)
 (table offset stride input_inc output output_inc K channels pixels:Z)(lo hi:fp32):MPOutput:=
 mp_finish_pixels F PT O table offset stride input_inc output output_inc K channels lo hi(Z.to_nat pixels).
Definition mp_pass_complete(F:MPFloatMap)(PT:MPPtrMap)(O:MPOutput)
 (table offset output K channels groups:Z)(lo hi:fp32):MPOutput:=
 mp_write O output channels(fun j=>mp_after_groups F PT table offset K groups j lo hi).
Definition mp_pass_partial(F:MPFloatMap)(PT:MPPtrMap)(O:MPOutput)
 (table offset output K channels group done:Z)(lo hi:fp32):MPOutput:=
 let before:=if Z.eqb group 0 then O
             else mp_pass_complete F PT O table offset output K channels(group-1)lo hi in
 mp_write before output done(fun j=>mp_after_groups F PT table offset K group j lo hi).
