From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import rvv_unit_goal Model Types ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvMemoryPart00.
Lemma proof_of_test_rvv_entail_wit_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_1.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14.
prop_apply(UIntArray.full_Zlength output_pre channels_pre Init);Intros_p Hlen.
 prop_apply(rd_full_init_range output_pre channels_pre Init);Intros_p Hrange.
 rewrite Z.sub_diag,rd_partial_initial.
 unfold rd_u64;entailer!.
Qed.
End CheckedRvvMemoryPart00.
