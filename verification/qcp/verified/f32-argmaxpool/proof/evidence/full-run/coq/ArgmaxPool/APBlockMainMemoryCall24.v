From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APBlockMainMemorySupport KernelBlockFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_25 : annotated_goal.test_rvv_partial_solve_wit_25.
Proof. unfold annotated_goal.test_rvv_partial_solve_wit_25,annotated_goal.test_rvv_partial_solve_wit_25_aux;apb_intro.
 pose proof(app_block_base_positive F P W WI D(app_pixels D-output_pixels) PreH10 ltac:(lia))as[Hout Hindex].
 rewrite <-PreH17 in Hout;rewrite <-PreH18 in Hindex.
 assert(Hprev:current_ab=0<->current_ib=0).
 { rewrite PreH34,PreH35;unfold app_previous_cursor;
   destruct(Z.eqb(app_group_cursor D k)0);split;intros;try reflexivity;lia. }
 rewrite <-PreH24,<-PreH2;apb_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_25.
