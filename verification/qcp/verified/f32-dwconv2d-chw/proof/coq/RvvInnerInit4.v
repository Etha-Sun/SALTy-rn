From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import RvvKernelMemoryFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_rvv_results.
Lemma proof_of_test_rvv_entail_wit_3_4 : DwChw.rvv_unit_goal.test_rvv_entail_wit_3_4.
Proof.
 unfold DwChw.rvv_unit_goal.test_rvv_entail_wit_3_4;right;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 unfold dw_outer_pointers in *.
 repeat match goal with H:?r=0 \/ _ |- _=>destruct H as[Hbad|Hgood];[exfalso;lia|]end.
 repeat match goal with H:_/\_ |- _=>destruct H end.
 repeat match goal with H:_->_ |- _=>first[specialize(H ltac:(lia))|clear H]end.
 subst.
 rewrite ?dw_width_quot,?Z.sub_diag,?Z.sub_0_r,?Z.add_0_r,?Z.add_0_l,?Z.mul_0_r,?Z.mul_0_l in *.
 unfold dw_same;rewrite ?dw_c_literal_zero,?dw_prev_at_zero.
 repeat match goal with |- context[dw_row_base ?a ?b ?h ?n ?y]=>
  first[rewrite(dw_row_base_before a b h n y ltac:(lia))
       |rewrite(dw_row_base_after a b h n y ltac:(lia))
       |rewrite(dw_row_base_inside a b h n y ltac:(lia))]
 end.
 unfold dw_store_row.
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia].
 entailer!;nia.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3_4.
