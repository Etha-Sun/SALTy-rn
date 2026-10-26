From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import BorrowedConsumerSupport borrowed_consumers_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedBorrowedConsumerPart13.
Lemma proof_of_ap_borrow_neon_select4_return_wit_1:ArgmaxPool.borrowed_consumers_goal.ap_borrow_neon_select4_return_wit_1.
Proof. unfold ArgmaxPool.borrowed_consumers_goal.ap_borrow_neon_select4_return_wit_1;apb_intro;
Exists (ap_select_f32 m3 a3 b3) (ap_select_f32 m2 a2 b2) (ap_select_f32 m1 a1 b1) (ap_select_f32 m0 a0 b0);
unfold ap_same_bits in *;apb_frame. Qed.
End CheckedBorrowedConsumerPart13.
Print Assumptions CheckedBorrowedConsumerPart13.proof_of_ap_borrow_neon_select4_return_wit_1.
