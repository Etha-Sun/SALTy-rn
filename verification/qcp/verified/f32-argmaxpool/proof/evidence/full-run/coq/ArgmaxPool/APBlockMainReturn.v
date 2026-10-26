(* Source migration of checked NEON memory-return algebra; this exact RVV
   caller field is independently compiled against the fresh274-field goal. *)
From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import annotated_goal BorrowedConsumerSupport APProgramMemoryFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1:annotated_goal.test_rvv_return_wit_1.
Proof.
 unfold annotated_goal.test_rvv_return_wit_1;left;apb_intro.
 subst output_pixels;rewrite Z.sub_0_r.
 unfold app_rvv_partial_output,app_rvv_partial_index,app_partial_output,app_partial_index.
 rewrite !app_pass_partial_zero.
 cbn[app_pass_complete].
 unfold app_rvv_output,app_rvv_index,app_final_output,app_final_index,app_program_result.
 apply derivable1_refl.
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
