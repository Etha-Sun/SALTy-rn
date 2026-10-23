From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart14.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_15 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_15.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_15; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_31 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_31.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_31; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_47 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_47.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_47; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_63 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_63.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_63; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_79 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_79.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_79; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_95 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_95.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_95; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_111 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_111.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_111; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_127 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_127.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_127; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_16 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_16.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_16; right; intros; assert (i_pre=112) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_32 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_32.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_32; right; intros; assert (i_pre=96) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_48 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_48.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_48; right; intros; assert (i_pre=80) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_64 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_64.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_64; right; intros; assert (i_pre=64) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_80 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_80.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_80; right; intros; assert (i_pre=48) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_96 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_96.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_96; right; intros; assert (i_pre=32) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_112 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_112.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_112; right; intros; assert (i_pre=16) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_128 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_128.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_128; right; intros; assert (i_pre=0) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart14.
