From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import RvvCallTactics rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_9 : Qs8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold Qs8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_9, Qs8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_9_aux;try left;intros;subst;unfold UndefStructPredint8x16_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint32m8_t,UndefStructPredvint32m1_t;rewrite ?local_field_address;rewrite ?sizeof_char,?sizeof_short,?sizeof_int in *;repeat rewrite Z.quot_1_r in *;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_9.
