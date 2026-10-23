From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import RvvCallTactics rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_8_pure : Qu8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_8_pure.
Proof. unfold Qu8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_8_pure;try left;intros;subst;unfold UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint32m8_t,UndefStructPredvuint32m1_t;rewrite ?local_field_address;rewrite ?sizeof_uchar,?sizeof_ushort,?sizeof_uint in *;repeat rewrite Z.quot_1_r in *;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_8_pure.
