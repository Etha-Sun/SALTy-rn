(* Complete actual C interfaces with the explicit intrinsic-spec trust boundary. *)
Require Import Qs8Rvv.rvv_goal Qs8Rvv.Checked.
Module RVV <: Qs8Rvv.rvv_goal.VC_Correct := Qs8Rvv.Checked.Checked.
Require Import Qs8Neon.neon_goal Qs8Neon.Checked.
Module NEON <: Qs8Neon.neon_goal.VC_Correct := Qs8Neon.Checked.Checked.
Require Import Qs8Caller.caller_goal Qs8Caller.Checked.
Module Caller <: Qs8Caller.caller_goal.VC_Correct := Qs8Caller.Checked.Checked.
Require Import Qs8Ordinary.ordinary_goal Qs8Ordinary.Checked.
Module Ordinary <: Qs8Ordinary.ordinary_goal.VC_Correct := Qs8Ordinary.Checked.Checked.
Require Import Qs8Strategy.copy_strategy_goal Qs8Strategy.Checked.
Module Copy <: Qs8Strategy.copy_strategy_goal.copy_Strategy_Correct := Qs8Strategy.Checked.Checked.
