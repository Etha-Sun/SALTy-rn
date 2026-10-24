From Coq Require Import ZArith Lia.
From GemmRvv Require Import SafeFrame SLFacts.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
From GemmFullRvvVC15 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque fma_rne full_acc full_cell fp32_neon_min fp32_neon_max fp32_min_number fp32_max_number rvv_merge rvv_nanth active8 mask8 row_acc_values row_result_values output_state output_panel output_frame.
Module CheckedPure201Retry1.
Lemma proof_of_test_rvv_partial_solve_wit_201_pure : test_rvv_partial_solve_wit_201_pure.
Proof. unfold test_rvv_partial_solve_wit_201_pure;left;intros;subst;assert (Hal : (nc_pre-nc) mod 8=0) by (unfold outer_cursor_state in PreH19;destruct PreH19 as [Hz|[Ha Hr]];[lia|exact Ha]);
assert (Hq : Z.quot (nc_pre-nc) 8 = (nc_pre-nc)/8) by (apply Z.quot_div_nonneg;lia);
pose proof (Z.div_mod (nc_pre-nc) 8 ltac:(lia)) as Hd;
assert (Hpc : panel_count (nc_pre-nc)=Z.quot (nc_pre-nc) 8) by (rewrite Hq;unfold panel_count;symmetry;apply Z.div_unique with(r:=7);lia);
assert (Hcols : panel_cols nc_pre (Z.quot (nc_pre-nc) 8) = nc) by (unfold panel_cols;rewrite Hq;replace (nc_pre-8*((nc_pre-nc)/8)) with nc by lia;apply Z.min_r ;lia);
assert (Hrem : Z.rem (nc_pre-nc) 8=0) by (rewrite Z.rem_mod_nonneg by lia;exact Hal);rewrite Hpc in *;rewrite Hcols in *;repeat apply _derivable1_andp_intros;apply derivable1s_coq_prop_r;first[assumption|reflexivity|lia]. Qed.
End CheckedPure201Retry1.
Print Assumptions CheckedPure201Retry1.proof_of_test_rvv_partial_solve_wit_201_pure.
