From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel IntegerFacts VectorFacts VlModel RvvProgramModel FastFrame rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_limits :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac rs_simple_pure := rs_limits; first[solve[entailer!;rs_bound_arith]|solve[unfold rs_vl in *;repeat match goal with H:context[Z.ltb ?x ?y]|-_=>destruct(Z.ltb_spec x y) end;entailer!;rs_bound_arith]].
Ltac rs_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_frame|rs_frame]
 | _=>first[solve[rs_simple_pure]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end.
Lemma proof_of_test_rvv_partial_solve_wit_10 : Qu8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold Qu8Rsum.rvv_unit_goal.test_rvv_partial_solve_wit_10;try left;intros;subst;unfold UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint32m8_t,UndefStructPredvuint32m1_t;rewrite ?local_field_address;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_10.
