(* All six actual C units, complete interfaces from fresh dependencies. *)
Require Import Qd8Admission.ProofBoundary.
Require Import IGemmNeon.neon_goal IGemmNeonClosure.NeonChecked.
Module NEON <: IGemmNeon.neon_goal.VC_Correct := IGemmNeonClosure.NeonChecked.Checked.
Require Import IGemmRvv.rvv_goal IGemmRvvClosure.RvvChecked.
Module RVV <: IGemmRvv.rvv_goal.VC_Correct := IGemmRvvClosure.RvvChecked.Checked.
Require Import IGemmCaller.caller_goal IGemmCaller.CallerChecked.
Module Caller <: IGemmCaller.caller_goal.VC_Correct := IGemmCaller.CallerChecked.Checked.
Require Import Qd8Nan.abi_probe_goal Qd8Basics.NanChecked.
Module ScalarNaN <: Qd8Nan.abi_probe_goal.VC_Correct := Qd8Basics.NanChecked.Checked.
Require Import Qd8Primitive.primitive_goal Qd8NeonBasicChecked3.NeonBasicChecked.
Module NeonBasics <: Qd8Primitive.primitive_goal.VC_Correct := Qd8NeonBasicChecked3.NeonBasicChecked.Checked.
Require Import Qd8Indirect.indirection_goal Qd8Indirect.IndirectionChecked.
Module Indirection <: Qd8Indirect.indirection_goal.VC_Correct := Qd8Indirect.IndirectionChecked.Checked.
Require Import Qd8API.copy_strategy_goal Qd8API.copy_strategy_proof.
Module Copy <: Qd8API.copy_strategy_goal.copy_Strategy_Correct := Qd8API.copy_strategy_proof.Checked.
Require Import Qd8Indirect.indirection_strategy_goal Qd8Indirect.indirection_strategy_proof.
Module IndirectStrategies <: Qd8Indirect.indirection_strategy_goal.indirection_Strategy_Correct := Qd8Indirect.indirection_strategy_proof.
