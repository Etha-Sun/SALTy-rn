From Coq Require Import ZArith Lia.
From X32Transpose Require Import NeonAutomation ProgressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_neon_return_wit_1:test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1;right;intros;subst.
 assert(Hres:xt_result F G old old).
 { split;[intros r c Hr Hc;lia|intros;reflexivity]. }
 entailer!.
Qed.
Print Assumptions xt_proof_test_neon_return_wit_1.
Lemma xt_proof_test_neon_return_wit_2:test_neon_return_wit_2.
Proof.
 unfold test_neon_return_wit_2;right;intros;subst.
 assert(Hres:xt_result F G old old).
 { split;[intros r c Hr Hc;lia|intros;reflexivity]. }
 entailer!.
Qed.
Print Assumptions xt_proof_test_neon_return_wit_2.
Lemma xt_proof_test_neon_return_wit_3:test_neon_return_wit_3.
Proof.
 unfold test_neon_return_wit_3;right;intros;subst.
 assert(Hres:xt_result F G old old).
 { split;[intros r c Hr Hc;lia|intros;reflexivity]. }
 entailer!.
Qed.
Print Assumptions xt_proof_test_neon_return_wit_3.
Lemma xt_proof_test_neon_return_wit_4:test_neon_return_wit_4.
Proof.
 unfold test_neon_return_wit_4;right;intros;subst.
 assert(Hres:xt_result F G old R_2).
 { apply(xt_progress_finish F G old R_2 k);[|exact PreH27].
   unfold xt_doz in PreH22;destruct(Z.ltb_spec k(xt_cols G));lia. }
 entailer!.
Qed.
Print Assumptions xt_proof_test_neon_return_wit_4.
