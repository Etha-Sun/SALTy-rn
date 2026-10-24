Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
From GemmNeon Require Import copy_strategy_goal.
Import Snaive_C_Rules64.
Require Import GemmNeon.LayoutModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma copy_strategy1_correctness : copy_strategy1.
  pre_process_default.
Admitted.

Lemma copy_strategy2_correctness : copy_strategy2.
  pre_process_default.
Admitted.

Lemma copy_strategy3_correctness : copy_strategy3.
  pre_process_default.
Admitted.
