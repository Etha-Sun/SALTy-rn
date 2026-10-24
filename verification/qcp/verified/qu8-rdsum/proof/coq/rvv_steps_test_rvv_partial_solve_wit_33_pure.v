From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import CallerAtomicHalf rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_active_wadd16 rd_active_wadd32 rd_acc16 rd_acc32 rd_read_lane rd_partial rd_u64.
Lemma proof_of_test_rvv_partial_solve_wit_33_pure : Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_33_pure.
Proof.
 Time unfold Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_33_pure.
 Time left.
 Time intros.
 Time rd_inner_capture_ranges HMapRange.
 Time unfold derivable1,andp,coq_prop.
 Time intros.
 Time repeat match goal with |- _ /\ _=>split end.
 Time all:rd_half_atomic_goal.
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_33_pure.
