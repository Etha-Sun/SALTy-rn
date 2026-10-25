From Coq Require Import ZArith Lia.
From DwChw Require Import MemoryModel present_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedPresent : DwChw.present_unit_goal.VC_Correct.
Lemma proof_of_dw_require_window_return_wit_1 : DwChw.present_unit_goal.dw_require_window_return_wit_1.
Proof.
 unfold DwChw.present_unit_goal.dw_require_window_return_wit_1;left;intros.
 apply _derivable1_andp_intros;[|entailer!].
 unfold derivable1,andp,coq_prop;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 replace(index_pre*4)with(4*index_pre)by lia.
 eapply dw_window_lane;eauto;lia.
Qed.
End CheckedPresent.
Print Assumptions CheckedPresent.proof_of_dw_require_window_return_wit_1.
