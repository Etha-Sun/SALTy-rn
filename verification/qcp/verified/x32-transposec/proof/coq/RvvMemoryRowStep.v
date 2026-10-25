From Coq Require Import ZArith Lia List.
From X32Transpose Require Import RvvAutomation RvvMemoryLaneFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_rvv_entail_wit_5:test_rvv_entail_wit_5.
Proof.
 unfold test_rvv_entail_wit_5;right;intros;subst.
 assert(Hh:0<xt_height G).
 { eapply xt_total_positive_height;[exact PreH34|lia]. }
 pose proof(xt_total_cols F W G PreH34 Hh)as Hcols.
 set(k:=xt_total G-bw)in *.
 set(row:=xt_height G-bh)in *.
 assert(Hk:0<=k)by(unfold k;lia).
 assert(Hend:k+vl<=xt_cols G)by(unfold k;lia).
 assert(Hrow:0<=row<xt_height G)by(unfold row;lia).
 assert(Hvalues:forall j,0<=j<vl->Znth j(xt_vec32 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31)0=xt_load_lane F(xt_current_input G k row)j).
 { intros j Hj.
   assert(Hcases:j=0 \/ j=1 \/ j=2 \/ j=3 \/ j=4 \/ j=5 \/ j=6 \/ j=7 \/ j=8 \/ j=9 \/ j=10 \/ j=11 \/ j=12 \/ j=13 \/ j=14 \/ j=15 \/ j=16 \/ j=17 \/ j=18 \/ j=19 \/ j=20 \/ j=21 \/ j=22 \/ j=23 \/ j=24 \/ j=25 \/ j=26 \/ j=27 \/ j=28 \/ j=29 \/ j=30 \/ j=31)by lia.
   destruct Hcases as[ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | ->]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]].
   all: cbn[xt_vec32 Znth];lazymatch goal with
   | H:xt_rvv_lane ?F ?p ?vl ?j ?x |- ?x=xt_load_lane ?F ?p ?j=>apply(proj1 H);lia
   end. }
 pose proof(xt_progress_rvv_row F W G old R_2 k row vl(xt_vec32 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31)PreH34 Hrow Hk ltac:(lia)Hend Hvalues PreH54)as Hp.
 pose proof(xt_input_cursor_next_row F W G k row PreH34 Hh)as Hi.
 pose proof(xt_output_cursor_next_row F W G k row PreH34 Hh ltac:(lia)Hrow)as Ho.
 replace(xt_height G-(bh-1))with(row+1)by(unfold row;lia).
 entailer!;lia.
Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_5.
