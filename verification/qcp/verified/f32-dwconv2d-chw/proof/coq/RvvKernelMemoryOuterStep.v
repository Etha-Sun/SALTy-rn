From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import RvvKernelMemoryWrapFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_results dw_data dw_output.
Lemma proof_of_test_rvv_entail_wit_4_1: DwChw.rvv_unit_goal.test_rvv_entail_wit_4_1.
Proof.
 unfold DwChw.rvv_unit_goal.test_rvv_entail_wit_4_1;right;intros.
 assert(w=0)by lia;subst w;subst.
 rewrite !Z.sub_0_r.
 rewrite dw_progress_tile_end by lia.
 rewrite Z.min_r by lia.
 replace(H-(output_height-3))with(H-output_height+3)by lia.
 lazymatch goal with |- _ |-- andp(coq_prop ?P)_=>assert(Houter:P)end.
 { unfold dw_outer_pointers;right.
   unfold dw_inputs,dw_footprint,dw_u64_limit in *.
   repeat match goal with H:_/\_ |- _=>destruct H end.
   repeat split;intros;
   unfold dw_store_row;
   repeat match goal with |-context[Z.min ?a ?b]=>
    first[rewrite(Z.min_l a b)by lia|rewrite(Z.min_r a b)by lia]end;
   repeat match goal with |-context[dw_row_base ?a ?b ?h ?n ?y]=>
    rewrite(dw_row_base_inside a b h n y ltac:(lia))end;
   repeat match goal with |-context[unsigned_last_nbits ?x 64]=>
    rewrite(unsigned_last_nbits_eq x 64)by(change(0<=x<18446744073709551616);nia)end;
   nia. }
 entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_1.
