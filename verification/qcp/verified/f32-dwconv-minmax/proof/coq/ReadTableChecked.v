From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import MemoryModel MemoryFacts read_table_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac pintro:=lazymatch goal with |- ?P |-- ?Q => idtac | |- forall _,_=>intro;pintro end.
Module CheckedReadTable : Dwconv.read_table_goal.VC_Correct.
Lemma proof_of_dw_read_table_entail_wit_1 : Dwconv.read_table_goal.dw_read_table_entail_wit_1.
Proof. unfold Dwconv.read_table_goal.dw_read_table_entail_wit_1;left;intros p P;pintro;match goal with Hp:dw_ptr_present P p|-_=>sep_apply(proj1(dw_ptr_data_pop P p Hp))end;entailer!. Qed.
Lemma proof_of_dw_read_table_return_wit_1 : Dwconv.read_table_goal.dw_read_table_return_wit_1.
Proof. unfold Dwconv.read_table_goal.dw_read_table_return_wit_1;left;intros p P;pintro;match goal with Hp:dw_ptr_present P p|-_=>sep_apply(proj2(dw_ptr_data_pop P p Hp))end;entailer!. Qed.
End CheckedReadTable.
Print Assumptions CheckedReadTable.proof_of_dw_read_table_entail_wit_1.
Print Assumptions CheckedReadTable.proof_of_dw_read_table_return_wit_1.
Print Assumptions Dwconv.MemoryFacts.dw_ptr_data_pop.
