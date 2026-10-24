(* Complete actual C interfaces; source-reviewed intrinsic boundary explicit. *)
Require Import QC4Rvv.rvv_goal QC4RvvClosure.RvvChecked.
Module RVV <: QC4Rvv.rvv_goal.VC_Correct := QC4RvvClosure.RvvChecked.Checked.
Require Import QC4Neon.neon_goal QC4NeonClosure.NeonChecked.
Module NEON <: QC4Neon.neon_goal.VC_Correct := QC4NeonClosure.NeonChecked.Checked.
Require Import QC4Caller.caller_goal QC4Caller.CallerChecked.
Module Caller <: QC4Caller.caller_goal.VC_Correct := QC4Caller.CallerChecked.Checked.
Require Import QC4Ordinary.ordinary_goal QC4Ordinary.Checked.
Module Ordinary <: QC4Ordinary.ordinary_goal.VC_Correct := QC4Ordinary.Checked.Checked.
Require Import QC4Scalar.scalar_nan_goal QC4Scalar.Checked.
Module ScalarNaN <: QC4Scalar.scalar_nan_goal.VC_Correct := QC4Scalar.Checked.Checked.
Require Import QC4Rvv.copy_strategy_goal QC4Rvv.copy_strategy_proof.
Module Copy <: QC4Rvv.copy_strategy_goal.copy_Strategy_Correct := QC4Rvv.copy_strategy_proof.Checked.
Require Import QC4W.NibbleModel.
Require Import QC4W.NibbleModel.
Require Import QC4W.NibbleModel.
Require Import QC4W.NibbleModel.
Require Import QC4W.NibbleModel.
Require Import QC4W.NibbleModel.
Require Import QC4W.MatrixModel.
Require Import QC4W.MatrixModel.
Require Import QC4W.MatrixModel.
Require Import QC4W.PublicModel.
Require Import QC4W.PublicModel.
Require Import QC4W.PublicModel.
Require Import QC4W.ApiModel.
Require Import QC4W.ApiModel.
Require Import QC4W.NeonModel.
Require Import QC4NeonSupport02.Facts.
Require Import QC4NeonSupport02.Facts.
Require Import QC4NeonSupport02.Facts.
Require Import QC4TailSupport02.Facts.
Require Import QC4NeonOutputSupport01.Facts.
Require Import QC4NeonOutputSupport01.Facts.
Require Import QC4NeonOutputSupport01.Facts.
Require Import QC4CheckedRvvoutput06.Facts.
Require Import QC4CheckedRvvoutput06.Facts.
