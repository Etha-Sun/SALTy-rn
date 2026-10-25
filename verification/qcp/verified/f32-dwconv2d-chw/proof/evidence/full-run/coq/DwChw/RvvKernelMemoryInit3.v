From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import RvvKernelMemoryWrapFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_results dw_data dw_output.
Ltac init_arithmetic:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 unfold dw_inputs,dw_footprint,dw_u64_limit in *;
 repeat match goal with H:_/\_ |- _=>destruct H end;
 subst;
 rewrite ?dw_width_quot,?Z.sub_diag,?Z.sub_0_r,?Z.add_0_r,?Z.add_0_l,?Z.mul_0_r,?Z.mul_0_l in *;
 unfold dw_same;rewrite ?dw_c_literal_zero,?dw_prev_at_zero;
 repeat match goal with
 | |- context[dw_row_base ?a ?b ?h ?n ?y]=>
   first[rewrite(dw_row_base_before a b h n y ltac:(lia))
        |rewrite(dw_row_base_after a b h n y ltac:(lia))
        |rewrite(dw_row_base_inside a b h n y ltac:(lia))]
 end;
 repeat match goal with
 | |- context[unsigned_last_nbits ?x 64]=>
   rewrite(unsigned_last_nbits_eq x 64)by(change(0<=x<18446744073709551616);nia)
 end.
Lemma proof_of_test_rvv_entail_wit_1_3: DwChw.rvv_unit_goal.test_rvv_entail_wit_1_3.
Proof.
 unfold DwChw.rvv_unit_goal.test_rvv_entail_wit_1_3;right;intros;init_arithmetic.
 rewrite dw_progress_start by lia.
 unfold dw_store_row;
 repeat match goal with |- context[Z.min ?a ?b]=>first[rewrite(Z.min_l a b)by lia|rewrite(Z.min_r a b)by lia]end;
 entailer!;rewrite ?dw_u64_add_no_wrap by nia;nia.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1_3.
