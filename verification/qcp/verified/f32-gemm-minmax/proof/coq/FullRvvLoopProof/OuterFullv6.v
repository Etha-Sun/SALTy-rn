From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain.
From FullRvvLoopProof Require Import AddressFacts.
From FullGemmGeometry Require Import PanelProgress.
From FullWrittenAddress Require Import WrittenAddress.
From FullNeonOuterProof Require Import PointerBounds.
From GemmRvv Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_6_1 : test_rvv_entail_wit_6_1.
Proof.
 unfold test_rvv_entail_wit_6_1;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 assert(HKq:4*(kc_pre÷4)=kc_pre)by(pose proof(Z.quot_rem kc_pre 4 ltac:(lia));lia).
 assert(HKfloor:kc_pre÷4=kc_pre/4)by(apply Z.quot_div_nonneg;lia).
 try rewrite <-HKfloor in *.
 pose proof(panel_progress_arith nc_pre nc ltac:(lia)ltac:(assumption))as PP.
 cbn zeta in PP;destruct PP as[Hwidth[Hcount[Hfull Htail]]].
 assert(Hwrange:0<=panel_cols nc_pre((nc_pre-nc)÷8)<=nc).
 { rewrite Hwidth;split;[apply Z.min_glb;lia|apply Z.le_min_r]. }
 match goal with HCp:machine_capacity _ _ _ _ _ _|-_=>pose proof HCp as Hcapacity end.
 unfold machine_capacity in Hcapacity;decompose [and] Hcapacity.
 assert(Hnowrap:unsigned_last_nbits(nc-panel_cols nc_pre((nc_pre-nc)÷8))64=nc-panel_cols nc_pre((nc_pre-nc)÷8))by(apply unsigned_last_nbits_eq;change(0<=nc-panel_cols nc_pre((nc_pre-nc)÷8)<18446744073709551616);lia).
 rewrite Hnowrap in *.
 assert(Hlarge:8<nc)by(destruct(Z_le_dec nc 8)as[Hle|Hgt];[specialize(Htail Hle);lia|lia]).
 assert(Hwidth8:panel_cols nc_pre((nc_pre-nc)÷8)=8)by(rewrite Hwidth;apply Z.min_l;lia).
 rewrite Hwidth8 in *.
 prop_apply(full_nonnegative a_pre(4*(kc_pre÷4))A ltac:(lia));Intros_p HA.
 prop_apply(output_written_nonnegative c_pre mr_pre nc_pre(kc_pre÷4)(nc_pre-nc+8)A W lo hi ltac:(lia)ltac:(lia));Intros_p HC.
 pose proof(input_reset_bounds a_pre a0 kc_pre mr_pre 0 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption))as[[A0lo A0hi][A0rlo A0rhi]].
 pose proof(output_next_bounds c_pre c0 nc_pre nc mr_pre 0 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[[C0lo C0hi][C0nlo C0nhi]].
 pose proof(input_reset_bounds a_pre a1 kc_pre mr_pre 1 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption))as[[A1lo A1hi][A1rlo A1rhi]].
 pose proof(output_next_bounds c_pre c1 nc_pre nc mr_pre 1 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[[C1lo C1hi][C1nlo C1nhi]].
 pose proof(input_reset_bounds a_pre a2 kc_pre mr_pre 2 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption))as[[A2lo A2hi][A2rlo A2rhi]].
 pose proof(output_next_bounds c_pre c2 nc_pre nc mr_pre 2 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[[C2lo C2hi][C2nlo C2nhi]].
 pose proof(input_reset_bounds a_pre a3 kc_pre mr_pre 3 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption))as[[A3lo A3hi][A3rlo A3rhi]].
 pose proof(output_next_bounds c_pre c3 nc_pre nc mr_pre 3 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[[C3lo C3hi][C3nlo C3nhi]].
 Time (repeat multimatch goal with |-context[unsigned_last_nbits ?x 64]=>rewrite(unsigned_last_nbits_eq x 64)by(replace(2^64)with 18446744073709551616 by reflexivity;lia)end).
 destruct(Hfull Hlarge)as[Hnext Hrem].
 split_pure_spatial.
 - replace(nc_pre-(nc-8))with(nc_pre-nc+8)by ring.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
 - unfold derivable1,andp,coq_prop;intros;
   repeat first[assumption|split|reflexivity];try lia.
   + rewrite Hcount,PreH107;unfold panel_wbase;ring.
   + unfold outer_cursor_state;right;repeat split.
     * rewrite <-Z.rem_mod_nonneg by lia;exact Hrem.
     * rewrite PreH103,<-HKfloor;ring_simplify;lia.
     * rewrite PreH104,<-HKfloor;ring_simplify;lia.
     * rewrite PreH105,<-HKfloor;ring_simplify;lia.
     * rewrite PreH106,<-HKfloor;ring_simplify;lia.
     * rewrite PreH87;ring.
     * rewrite PreH87;ring.
     * rewrite PreH87;ring.
     * rewrite PreH87;ring.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6_1.
