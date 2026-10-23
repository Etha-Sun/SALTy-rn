Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
From Qu8Rsum Require Import byte_arrays_strategy_goal.
Import Snaive_C_Rules64.
Require Import Qu8Rsum.Model.
Require Import Qu8Rsum.Types.
Require Import Qu8Rsum.MemoryModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma byte_arrays_strategy1_correctness : byte_arrays_strategy1.
  pre_process_default.
Admitted.

Lemma byte_arrays_strategy2_correctness : byte_arrays_strategy2.
  pre_process_default.
Admitted.
