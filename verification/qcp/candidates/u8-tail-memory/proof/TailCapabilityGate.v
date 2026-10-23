From U8Tail Require Import le_store_goal LEStoreChecked.
From TailAdapter Require Import unit_goal Checked.
From TailReview Require Import RegisterModel ByteMemoryBridge.

Module LEBodyCheck : U8Tail.le_store_goal.VC_Correct := U8Tail.LEStoreChecked.Checked.
Module TailBodyCheck : TailAdapter.unit_goal.VC_Correct := TailAdapter.Checked.Checked.

Check register_low32.
Check register_low16.
Check four_uchar_cells_to_uint.
Print Assumptions TailBodyCheck.proof_of_original_tail_store32_return_wit_1.
Print Assumptions TailBodyCheck.proof_of_original_tail_store16_return_wit_1.
Print Assumptions register_low32.
Print Assumptions register_low16.
Print Assumptions wrong_byte_is_observable.
Print Assumptions four_uchar_cells_to_uint.
