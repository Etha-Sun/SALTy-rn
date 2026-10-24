From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import rvv_unit_goal Model Types ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvMemoryPart02.
Lemma proof_of_test_rvv_entail_wit_13 : Qs8Rdsum.rvv_unit_goal.test_rvv_entail_wit_13.
Proof. unfold Qs8Rdsum.rvv_unit_goal.test_rvv_entail_wit_13.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input output input_increment vl r PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23.
replace (channels_pre-(channels-vl)) with ((channels_pre-channels)+vl) by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 entailer!.
Qed.
End CheckedRvvMemoryPart02.
