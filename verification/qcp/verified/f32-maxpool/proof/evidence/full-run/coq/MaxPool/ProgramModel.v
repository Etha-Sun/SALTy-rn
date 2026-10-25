From Coq Require Import ZArith Bool List Lia.
From MaxPool Require Export MemoryModel.
Local Open Scope Z_scope.
Definition mp_u64(x:Z):Z:=unsigned_last_nbits x 64.
Definition mp_table_at(table increment pixel:Z):Z:=mp_u64(table+increment*pixel).
Definition mp_offset_at(offset stride pixel:Z):Z:=mp_u64(offset+stride*pixel).
Definition mp_output_at(output increment pixel:Z):Z:=mp_u64(output+increment*pixel).
Definition mp_group_lane(F:MPFloatMap)(P:MPPtrMap)(table offset K group channel:Z):fp32:=
 mp_group(K-9*group)(fun j=>
  mp_get F(mp_u64(mp_ptr_get P(table+8*(9*group+j))+offset)+4*channel)).
Fixpoint mp_more_groups(F:MPFloatMap)(P:MPPtrMap)(table offset K channel:Z)
 (hi:fp32)(groups:nat):fp32->fp32:=
 match groups with O=>fun acc=>acc
 |S n=>fun acc=>mp_more hi(mp_more_groups F P table offset K channel hi n acc)
                            (mp_group_lane F P table offset K(Z.of_nat(S n))channel)end.
Definition mp_after_groups(F:MPFloatMap)(P:MPPtrMap)(table offset K groups channel:Z)(lo hi:fp32):fp32:=
 mp_more_groups F P table offset K channel hi(Z.to_nat groups)
 (mp_first lo hi(mp_group_lane F P table offset K 0 channel)).
Definition mp_extra_groups(K:Z):Z:=(mp_remaining K+8)/9.
Definition mp_result_lane(F:MPFloatMap)(P:MPPtrMap)(table offset K channel:Z)(lo hi:fp32):fp32:=
 mp_after_groups F P table offset K(mp_extra_groups K)channel lo hi.
Definition mp_finish_pixel(F:MPFloatMap)(P:MPPtrMap)(O:MPOutput)
 (table offset output K channels:Z)(lo hi:fp32):MPOutput:=
 mp_write O output channels(fun j=>mp_result_lane F P table offset K j lo hi).
Fixpoint mp_finish_pixels(F:MPFloatMap)(P:MPPtrMap)(O:MPOutput)
 (table offset input_stride input_inc output output_inc K channels:Z)
 (lo hi:fp32)(pixels:nat):MPOutput:=
 match pixels with O=>O|S n=>
 let previous:=mp_finish_pixels F P O table offset input_stride input_inc output output_inc K channels lo hi n in
 mp_finish_pixel F P previous
  (mp_table_at table input_inc(Z.of_nat n))
  (mp_offset_at offset input_stride(Z.of_nat n))
  (mp_output_at output output_inc(Z.of_nat n)) K channels lo hi end.
