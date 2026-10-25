From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import MemoryModel MemoryFacts read_table_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac mp_intro := lazymatch goal with | |- _ |-- _ => idtac | |- forall _, _ => intro;mp_intro end.
Module CheckedReadTable : MaxPool.read_table_goal.VC_Correct.
Lemma proof_of_mp_read_table_entail_wit_1 : MaxPool.read_table_goal.mp_read_table_entail_wit_1.
Proof. unfold MaxPool.read_table_goal.mp_read_table_entail_wit_1;left;mp_intro;match goal with H:mp_ptr_present ?PT ?addr |- _=>sep_apply(proj1(mp_ptr_data_pop PT addr H)) end;entailer!. Qed.
Lemma proof_of_mp_read_table_return_wit_1 : MaxPool.read_table_goal.mp_read_table_return_wit_1.
Proof. unfold MaxPool.read_table_goal.mp_read_table_return_wit_1;left;mp_intro;match goal with H:mp_ptr_present ?PT ?addr |- _=>sep_apply(proj2(mp_ptr_data_pop PT addr H)) end;entailer!. Qed.
End CheckedReadTable.
Print Assumptions CheckedReadTable.proof_of_mp_read_table_entail_wit_1.
Print Assumptions CheckedReadTable.proof_of_mp_read_table_return_wit_1.
Print Assumptions MaxPool.MemoryFacts.mp_ptr_data_pop.
