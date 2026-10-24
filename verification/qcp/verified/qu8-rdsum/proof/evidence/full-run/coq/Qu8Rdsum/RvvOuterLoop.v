From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import RvvOuterTactics rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque rd_partial rd_column rd_acc32 rd_acc16 rd_read_lane rd_wadd16.
Lemma proof_of_test_rvv_entail_wit_11 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_11.
Proof.
 unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_11;try left;intros;rd_limits;subst input output input_increment r;rewrite rd_min252_remainder by lia.
 destruct(Z_le_gt_dec orig_r 252)as[Hsmall|Hlarge].
 all:repeat first[progress rewrite Z.max_l by lia|progress rewrite Z.max_r by lia].
 all:rd_mem_facts_owned.
 all:rd_rvv_outer_values.
 all:rd_outer_finish.
 all:try(match goal with |- ?G=>idtac "REMAINING" G end).
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_11.
