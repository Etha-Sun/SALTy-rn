From Coq Require Import ZArith Lia.
From Qs8Mul Require Import PrefixFacts ExtFacts VectorValues qm_ext_self_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_mem qm_lane_match qm_fp_lane_match qm_sat8 qm_sat16 qm_sat32 qm_arm_add.
Lemma proof_of_qm_ext_self_return_wit_2 : Qs8Mul.qm_ext_self_goal.qm_ext_self_return_wit_2.
Proof. unfold Qs8Mul.qm_ext_self_goal.qm_ext_self_return_wit_2;try left;intros;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *;change (sizeof(CHAR)) with 1 in *;rewrite ?Z.mul_1_r,?Z.add_0_r in *;try unfold UndefStructPredint8x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;rewrite ?qm_local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;try assert (k_pre=2 \/ k_pre=4) by (apply qm_ext_shift_domain;assumption);try assert(k_pre=2)by lia;subst; autorewrite with qm_ext in *; first[solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_pure]|solve[entailer!;lia]]. Qed.
Print Assumptions proof_of_qm_ext_self_return_wit_2.
