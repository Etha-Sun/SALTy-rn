From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RvvRecordCallTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_11:Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_11.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_11,Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_11_aux.
 qm_record_main_start.
 rewrite ?Z.mul_1_r,?Z.add_0_r in *.
 lazymatch goal with|-?P |--?Q=>
 multimatch Q with context[CharArray.undef_full ?out ?vl]=>
 lazymatch P with context[CharArray.undef_full out ?n]=>
 let HS:=fresh "Hsplit"in pose proof(CharArray.undef_full_split_to_undef_full out vl n ltac:(lia))as HS;
 unfold StoreCharAsElement.sizeA in HS;rewrite sizeof_char in HS;
 rewrite ?Z.mul_1_r in HS;sep_apply_l_atomic HS
 end end end.
 qm_record_main_solve.
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_11.
