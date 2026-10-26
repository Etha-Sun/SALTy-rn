Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From ArgmaxPool Require Import guard_probe_goal.
From ArgmaxPool Require Import guard_probe_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.APKernelModel.
Require Import ArgmaxPool.RvvKernelModel.
Require Import ArgmaxPool.ReadPreviousModel.
Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel.
Require Import ArgmaxPool.NeonKernelModel.
Require Import ArgmaxPool.ProgramModel.
Local Open Scope sac.

Lemma proof_of_ap_read_table_entail_wit_1_split_goal_spatial : ap_read_table_entail_wit_1_split_goal_spatial.
Proof. Abort.

Lemma proof_of_ap_read_table_entail_wit_1 : ap_read_table_entail_wit_1.
Proof. Admitted. 

Lemma proof_of_ap_read_table_return_wit_1_split_goal_spatial : ap_read_table_return_wit_1_split_goal_spatial.
Proof. Abort.

Lemma proof_of_ap_read_table_return_wit_1 : ap_read_table_return_wit_1.
Proof. Admitted. 

Lemma proof_of_ap_guard_cut_probe_entail_wit_1_split_goal_1 : ap_guard_cut_probe_entail_wit_1_split_goal_1.
Proof. Abort.

Lemma proof_of_ap_guard_cut_probe_entail_wit_1_split_goal_2 : ap_guard_cut_probe_entail_wit_1_split_goal_2.
Proof. Abort.

Lemma proof_of_ap_guard_cut_probe_entail_wit_1 : ap_guard_cut_probe_entail_wit_1.
Proof. Admitted. 

