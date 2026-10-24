From Qu8Add Require Import RvvActiveAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_rvv_usat16_return_wit_2 : Qu8Add.rvv_active_goal.qcp_qu_rvv_usat16_return_wit_2.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_rvv_usat16_return_wit_2;try left;intros;subst;unfold qu_uclip8;entailer!;try lia;try(rewrite unsigned_last_nbits_eq by lia;lia). Qed.
Lemma proof_of_qcp_qu_active_macc_return_wit_2 : Qu8Add.rvv_active_goal.qcp_qu_active_macc_return_wit_2.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_macc_return_wit_2;try left;intros;subst;qu_active_core. Qed.
Lemma proof_of_qcp_qu_active_clip16_safety_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_clip16_safety_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_clip16_safety_wit_1;try left;intros;subst;qu_active_core. Qed.
Lemma proof_of_qcp_qu_active_clipu8_return_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_clipu8_return_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_clipu8_return_wit_1;try left;intros;subst;qu_active_core. Qed.
