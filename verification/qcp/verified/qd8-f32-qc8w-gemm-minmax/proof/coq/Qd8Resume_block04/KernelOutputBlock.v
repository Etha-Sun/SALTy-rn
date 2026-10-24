From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8FullKernel Require Import FullModel.
From GemmSpec Require Import FmaModel IntrinsicModel.
From Qd8API Require Import ApiModel.
From Qd8Resume_output03 Require Import KernelOutput.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma completed_values_panel_block : forall K done zp A Ps inv lo hi n,
 0<=done -> Z.rem done 8=0 -> (n<=8)%nat ->
 completed_values K done zp A Ps inv lo hi ++
 map (fun j=>qd8_final_lane K (Z.quot done 8) (Z.of_nat j) zp A Ps inv lo hi)
     (seq 0 n) =
 completed_values K (done+Z.of_nat n) zp A Ps inv lo hi.
Proof.
 intros K done zp A Ps inv lo hi n Hd Hr;induction n;intro Hn.
 - cbn [seq map Z.of_nat];rewrite app_nil_r,Z.add_0_r;reflexivity.
 - rewrite seq_S,map_app,app_assoc.
   rewrite IHn by lia.
   cbn [map];rewrite Nat.add_0_l.
   rewrite <-(output_cell_panel K done (Z.of_nat n) zp A Ps inv lo hi) by lia.
   rewrite completed_values_snoc by lia.
   rewrite Nat2Z.inj_succ.
   replace (done+Z.succ (Z.of_nat n)) with (done+Z.of_nat n+1) by lia.
   reflexivity.
Qed.

Lemma qd8_final_lane_formula : forall K tile lane zp A Ps inv lo hi,
 fp32_neon_min (fp32_neon_max
   (fma_rne (fp32_mul (fp32_of_Z (qd8_acc_signed K K tile lane zp A Ps)) inv)
      (qd8_float_field 0 tile lane Ps) (qd8_float_field 1 tile lane Ps)) lo) hi =
 qd8_final_lane K tile lane zp A Ps inv lo hi.
Proof. reflexivity. Qed.

Lemma qd8_write_eight : forall c N done K zp A Ps inv lo hi,
 0<=done -> Z.rem done 8=0 ->
 qd8_write_state c N (done+4+4)
 ((completed_values K done zp A Ps inv lo hi ++
 [qd8_final_lane K (Z.quot done 8) 0 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 1 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 2 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 3 zp A Ps inv lo hi]) ++
 [qd8_final_lane K (Z.quot done 8) 4 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 5 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 6 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 7 zp A Ps inv lo hi]) =
 qd8_output_prefix c N (done+8) K zp A Ps inv lo hi.
Proof.
 intros c N done K zp A Ps inv lo hi Hd Hr.
 rewrite <-app_assoc.
 pose proof (completed_values_panel_block K done zp A Ps inv lo hi 8 Hd Hr ltac:(lia)) as H.
 cbv [seq map Z.of_nat Pos.of_succ_nat Pos.succ] in H.
 unfold qd8_write_state,qd8_output_prefix.
 replace (done+4+4) with (done+8) by lia.
 rewrite <-H.
 reflexivity.
Qed.
Print Assumptions completed_values_panel_block.
Print Assumptions qd8_final_lane_formula.
Print Assumptions qd8_write_eight.
