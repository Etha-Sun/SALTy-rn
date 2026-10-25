From Coq Require Import ZArith Lia.
From X32Transpose Require Import RvvAutomation ProgressFacts AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_rvv_return_wit_1: test_rvv_return_wit_1.
Proof.
 unfold test_rvv_return_wit_1;right;intros.
 assert(bw=0)by lia;subst bw;rewrite Z.sub_0_r in *.
 pose proof(xt_total_bounds F W G PreH2).
 assert(Hheight:0<xt_height G \/ xt_height G=0).
 { destruct PreH2 as[[Hw[Hh Rest]]_];lia. }
 assert(Hresult:xt_result F G old R_2).
 { destruct Hheight as[Hpos|Hempty].
   - apply(xt_progress_finish F G old R_2(xt_total G)).
     + rewrite(xt_total_cols F W G PreH2 Hpos);lia.
     + exact PreH14.
   - destruct PreH14 as[Hv Hframe];split.
     + intros r c Hr Hc;lia.
     + intros q Hq;apply Hframe;intros r c[Hr Hc]Hp;lia. }
 entailer!.
Qed.
Print Assumptions xt_proof_test_rvv_return_wit_1.
