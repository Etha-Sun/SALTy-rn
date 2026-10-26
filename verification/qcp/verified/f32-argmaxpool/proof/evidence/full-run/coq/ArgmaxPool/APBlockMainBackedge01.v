From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import annotated_goal BorrowedConsumerSupport KernelCursorFacts APBlockMainProgressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_15_1:annotated_goal.test_rvv_entail_wit_15_1.
Proof.
 unfold annotated_goal.test_rvv_entail_wit_15_1;apb_intro.
 assert(Hrange:0<k<=app_rows D)by lia.
 assert(Hremain:k=app_remaining(app_rows D)(app_group_cursor D k))by congruence.
 pose proof(app_group_cursor_active D k Hrange Hremain)as[Ha Hb].
 rewrite PreH3 in PreH25;exfalso;lia.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_15_1.
