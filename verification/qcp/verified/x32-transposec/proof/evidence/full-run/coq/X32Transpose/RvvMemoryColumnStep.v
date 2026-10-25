From Coq Require Import ZArith Lia.
From X32Transpose Require Import RvvAutomation ProgressFacts RvvMemoryCursorFactsDirect.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_rvv_entail_wit_6:test_rvv_entail_wit_6.
Proof.
 unfold test_rvv_entail_wit_6;right;intros.
 assert(bh=0)by lia;subst bh;subst;rewrite Z.sub_0_r in *.
 assert(Hh:0<xt_height G).
 { eapply xt_total_positive_height;[exact PreH2|lia]. }
 pose proof(xt_total_cols F W G PreH2 Hh)as Hcols.
 replace(xt_total G-(bw-vl))with(xt_total G-bw+vl)by lia.
 pose proof(xt_input_cursor_next_columns F W G(xt_total G-bw)vl PreH2 Hh
   ltac:(lia)ltac:(lia)ltac:(lia))as Hi.
 pose proof(xt_output_cursor_next_columns F W G(xt_total G-bw)vl PreH2 Hh)as Ho.
 pose proof(xt_progress_row_exit F G old R_2(xt_total G-bw)vl ltac:(lia)PreH22)as Hp.
 entailer!;nia.
Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_6.
