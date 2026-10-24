From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import rvv_unit_goal Model Types ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvMemoryPart03.
Lemma proof_of_test_rvv_return_wit_1 : Qu8Rdsum.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_return_wit_1.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M input_increment output input channels PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18.
assert(Hzero:channels=0)by lia;subst channels;rewrite Z.sub_0_r.
 rewrite rd_partial_full by lia;entailer!.
Qed.
End CheckedRvvMemoryPart03.
