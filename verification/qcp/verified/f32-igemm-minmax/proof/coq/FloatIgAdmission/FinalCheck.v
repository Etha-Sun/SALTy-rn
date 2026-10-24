(* Complete interfaces of four actual C units. Intrinsic-spec boundary remains explicit. *)
Require Import FloatIgRvv.rvv_goal FloatIgRvvClosure.RvvChecked.
Module RVV <: FloatIgRvv.rvv_goal.VC_Correct := FloatIgRvvClosure.RvvChecked.Checked.
Require Import FloatIgNeon.neon_goal FloatIgNeonClosure.NeonChecked.
Module NEON <: FloatIgNeon.neon_goal.VC_Correct := FloatIgNeonClosure.NeonChecked.Checked.
Require Import FloatIgCaller.caller_goal FloatIgCaller.CallerChecked.
Module Caller <: FloatIgCaller.caller_goal.VC_Correct := FloatIgCaller.CallerChecked.Checked.
Require Import FloatIgOrdinary.ordinary_goal FloatIgOrdinary.OrdinaryChecked.
Module Ordinary <: FloatIgOrdinary.ordinary_goal.VC_Correct := FloatIgOrdinary.OrdinaryChecked.Checked.
Require Import GemmNeon.copy_strategy_goal GemmNeon.copy_strategy_proof.
Module NeonCopy <: GemmNeon.copy_strategy_goal.copy_Strategy_Correct := GemmNeon.copy_strategy_proof.
Require Import GemmRvv.copy_strategy_goal GemmRvv.copy_strategy_proof.
Module RvvCopy <: GemmRvv.copy_strategy_goal.copy_Strategy_Correct := GemmRvv.copy_strategy_proof.Checked.
Require Import FloatIndirect.InputMapping.
Require Import FloatIndirect.MatrixModel.
Require Import FloatIndirect.ClampRepair.
Require Import FloatIndirect.ClampRepair.
