From Coq Require Import ZArith List Lia Reals Lra.
From HwcConv Require Export NeonRowsPixelModel.
Local Open Scope Z_scope.
Lemma hc_stage_initial : forall R F p0 p1 p2 w width x,
 hc_neon_load4 R F w -> hc_neon_rows_acc R F p0 p1 p2 w width x 0.
Proof. unfold hc_neon_load4,hc_neon_rows_acc,hc_neon_rows_fold;intros;exact(H lane H0). Qed.
Lemma hc_stage_fold_next : forall F p0 p1 p2 w width x lane k,
 0<=k<9 ->
 hc_neon_rows_fold F p0 p1 p2 w width x lane(k+1)=
 hc_neon_row_group(hc_neon_rows_fold F p0 p1 p2 w width x lane k)
 F p0 p1 p2 w width x(k/3)(k mod 3)lane.
Proof.
 intros F p0 p1 p2 w width x lane k Hk.
 assert(k=0\/k=1\/k=2\/k=3\/k=4\/k=5\/k=6\/k=7\/k=8)by lia.
 repeat match goal with H:_\/_|-_=>destruct H end;subst k;reflexivity.
Qed.
Lemma hc_stage_next : forall R A W0 W1 W2 X0 X1 X2 F p0 p1 p2 w width x k,
 0<=k<9 ->2*x+k/3-1<width ->
 hc_neon_rows_acc A F p0 p1 p2 w width x k ->
 hc_neon3 R A W0 W1 W2 X0 X1 X2 0 ->
 hc_neon_load4 W0 F(w+4*(4+((k/3)*9+(k mod 3)*3)*4)) ->
 hc_neon_load4 W1 F(w+4*(4+((k/3)*9+(k mod 3)*3+1)*4)) ->
 hc_neon_load4 W2 F(w+4*(4+((k/3)*9+(k mod 3)*3+2)*4)) ->
 hc_neon_dup4 X0(hc_neon_row_input F p0(2*x+k/3-1)(k mod 3)) ->
 hc_neon_dup4 X1(hc_neon_row_input F p1(2*x+k/3-1)(k mod 3)) ->
 hc_neon_dup4 X2(hc_neon_row_input F p2(2*x+k/3-1)(k mod 3)) ->
 hc_neon_rows_acc R F p0 p1 p2 w width x(k+1).
Proof.
 intros R A W0 W1 W2 X0 X1 X2 F p0 p1 p2 w width x k HK HC HA HR HW0 HW1 HW2 HX0 HX1 HX2.
 unfold hc_neon_rows_acc in *;intros lane HL.
 rewrite (HR lane HL),(HA lane HL),(HW0 lane HL),(HW1 lane HL),(HW2 lane HL).
 rewrite (HX0 0 ltac:(lia)),(HX1 0 ltac:(lia)),(HX2 0 ltac:(lia)).
 rewrite hc_stage_fold_next by exact HK;unfold hc_neon_row_group.
 assert(HB:(width<=?2*x+k/3-1)=false)by(apply Z.leb_gt;exact HC);rewrite HB.
 repeat first[solve[reflexivity|ring]|progress f_equal].
Qed.
Lemma hc_stage_skip : forall A F p0 p1 p2 w width x k,
 0<=k<9 ->width<=2*x+k/3-1 ->
 hc_neon_rows_acc A F p0 p1 p2 w width x k ->
 hc_neon_rows_acc A F p0 p1 p2 w width x(k+1).
Proof.
 unfold hc_neon_rows_acc;intros A F p0 p1 p2 w width x k HK HC HA lane HL.
 rewrite hc_stage_fold_next by exact HK;unfold hc_neon_row_group.
 assert(HB:(width<=?2*x+k/3-1)=true)by(apply Z.leb_le;exact HC);rewrite HB;apply HA;exact HL.
Qed.
Print Assumptions hc_stage_initial.
Print Assumptions hc_stage_fold_next.
Print Assumptions hc_stage_next.
Print Assumptions hc_stage_skip.

(* Migrated as source from verified DWCHW RvvKernelMemoryFacts.dw_c_literal_zero. *)
Lemma hc_stage_literal_zero:fp32_of_real(0.0%R)=fp32_zero.
Proof.
 replace(0.0%R)with(0%R)by(unfold Q2R;simpl;ring).
 unfold fp32_of_real,rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0,Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra;reflexivity.
Qed.
Print Assumptions hc_stage_literal_zero.
