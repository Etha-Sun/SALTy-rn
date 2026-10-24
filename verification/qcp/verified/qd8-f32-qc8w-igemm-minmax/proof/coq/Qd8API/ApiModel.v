From Coq Require Import ZArith List Bool.
From Qd8Public Require Export CandidateLogic.
From Qd8FullKernel Require Import FullModel.
From Qd8Phase Require Import IntegerFold PhaseModel.
From Qd8Cast Require Import CastModel.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmRepair Require Import ClampRepair.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition qd8_zget (i:Z) (xs:list Z) := Znth i xs 0.
Definition qd8_fget (i:Z) (xs:list fp32) := Znth i xs fp32_zero.
Definition qd8_wrap_signed (x:Z) := signed32_view (IntegerFold.wrap32 x).
Definition qd8_mac_signed (acc a b:Z) := qd8_wrap_signed (acc+a*b).
Definition qd8_ks (tile j:Z) (Ps:list panel_data) :=
  qd8_zget j (sums (panel_at Ps tile)).
Definition qd8_float_field (kind tile j:Z) (Ps:list panel_data) :=
  qd8_fget j (if Z.eqb kind 0 then scales (panel_at Ps tile) else biases (panel_at Ps tile)).
Definition qd8_char_field (mode tile j lane:Z) (A:list Z) (Ps:list panel_data) :=
  qd8_zget (j+lane) (if Z.eqb mode 0 then A else weights (panel_at Ps tile)).
Definition qd8_i8_address_ok (mode p ab wb K tile j:Z) (Ps:list panel_data) : Prop :=
  (mode=0 /\ p=ab+j /\ 0<=j /\ j+8<=a_read_extent K) \/
  (mode=1 /\ p=wb+tile*panel_bytes K+32+j /\
   0<=tile<Zlength Ps /\ 0<=j /\ j+8<=8*K).
Definition qd8_matrix_wf (K:Z) (Ps:list panel_data) := Forall (panel_wf K) Ps.
Definition qd8_i16_lane (lane x0 x1 x2 x3:Z) :=
  qd8_zget lane (x0::x1::x2::x3::nil).
Definition qd8_f32_lane (lane:Z) (x0 x1:fp32) :=
  if Z.eqb lane 0 then x0 else x1.
Definition qd8_active_z (vl lane actual expected:Z) : Prop := lane<vl -> actual=expected.
Definition qd8_active_f (vl lane:Z) (actual expected:fp32) : Prop := lane<vl -> actual=expected.
Definition qd8_nan_flag (x:fp32) : Z := if Binary.is_nan 24 128 x then 1 else 0.
Definition qd8_merge_value (a b:fp32) (m:Z) := if Z.eqb m 0 then a else b.
Definition qd8_acc_signed (K depth tile lane zp:Z) (A:list Z) (Ps:list panel_data) :=
  signed32_view (acc_bits K depth lane zp A (panel_at Ps tile)).
Definition qd8_unclamped (K tile lane zp:Z) (A:list Z) (Ps:list panel_data) (inv:fp32) :=
  raw_output K lane zp A (panel_at Ps tile) inv.
Definition qd8_final_lane (K tile lane zp:Z) (A:list Z) (Ps:list panel_data) (inv lo hi:fp32) :=
  qd8_neon_clamp (qd8_unclamped K tile lane zp A Ps inv) lo hi.
Definition qd8_output_prefix (c N done K zp:Z) (A:list Z) (Ps:list panel_data) (inv lo hi:fp32) :=
  FloatArray.full c done (completed_values K done zp A Ps inv lo hi) **
  FloatArray.undef_seg c done N.
Check qd8_i8_address_ok.
Check qd8_acc_signed.

(* Actual output prefix carried by store contracts; no reference-value premise. *)
Definition qd8_write_state (c N done:Z) (L:list fp32) :=
 FloatArray.full c done L ** FloatArray.undef_seg c done N.
Definition qd8_fappend (L R:list fp32) := List.app L R.
Lemma qd8_output_prefix_write_view : forall c N done K zp A Ps inv lo hi,
 qd8_output_prefix c N done K zp A Ps inv lo hi =
 qd8_write_state c N done (completed_values K done zp A Ps inv lo hi).
Proof. reflexivity. Qed.
Print Assumptions qd8_output_prefix_write_view.
