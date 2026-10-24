From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullModel FullState MachineDomain.
From FullGemmGeometry Require Import PanelProgress.
From GemmRvv Require Import FastFrame.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_6_2 : test_rvv_entail_wit_6_2.
Proof.
 unfold test_rvv_entail_wit_6_2;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof(panel_progress_arith nc_pre nc ltac:(lia) ltac:(assumption))as PP.
 cbn zeta in PP;destruct PP as[Hwidth[Hcount[Hfull Htail]]].
 assert(Hwrange:0<=panel_cols nc_pre((nc_pre-nc)÷8)<=nc).
 { rewrite Hwidth;split;[apply Z.min_glb;lia|apply Z.le_min_r]. }
 match goal with HCp:machine_capacity _ _ _ _ _ _|-_=>pose proof HCp as Hcapacity end.
 unfold machine_capacity in Hcapacity;decompose [and] Hcapacity.
 assert(Hnowrap:unsigned_last_nbits(nc-panel_cols nc_pre((nc_pre-nc)÷8))64=nc-panel_cols nc_pre((nc_pre-nc)÷8))by(apply unsigned_last_nbits_eq;change(0<=nc-panel_cols nc_pre((nc_pre-nc)÷8)<18446744073709551616);nia).
 rewrite Hnowrap in *.
 assert(Hnext:nc-panel_cols nc_pre((nc_pre-nc)÷8)=0)by lia.
 rewrite Hnext;replace(unsigned_last_nbits 0 64)with 0 by reflexivity.
 rewrite !Z.sub_0_r in *.
 assert(Hdone:nc_pre-nc+panel_cols nc_pre((nc_pre-nc)÷8)=nc_pre)by lia.
 rewrite Hdone.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity|unfold outer_cursor_state;left];try lia.
   all: rewrite Hnext,Z.sub_0_r in Hcount;unfold panel_wbase in *;nia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6_2.
