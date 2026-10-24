Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
From Qd8Indirect Require Import indirection_strategy_goal.
Import Snaive_C_Rules64.
Require Import Qd8Indirect.IndirectionModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma indirection_strategy3_correctness : indirection_strategy3.
  pre_process_default.
Admitted.

Lemma indirection_strategy1_correctness : indirection_strategy1.
  pre_process_default.
Admitted.

Lemma indirection_strategy2_correctness : indirection_strategy2.
  pre_process_default.
Admitted.
