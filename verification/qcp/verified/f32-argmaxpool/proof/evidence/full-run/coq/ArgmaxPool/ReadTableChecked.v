From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From ArgmaxPool Require Import ProgramModel MemoryFacts read_table_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac pintro:=lazymatch goal with |- ?P |-- ?Q => idtac | |- forall _,_=>intro;pintro end.
Module CheckedReadTable : ArgmaxPool.read_table_goal.VC_Correct.
Lemma proof_of_ap_read_table_entail_wit_1 : ArgmaxPool.read_table_goal.ap_read_table_entail_wit_1.
Proof. unfold ArgmaxPool.read_table_goal.ap_read_table_entail_wit_1;left;intros p P;pintro;match goal with Hp:ap_ptr_present P p|-_=>sep_apply(proj1(ap_ptr_data_pop P p Hp))end;entailer!. Qed.
Lemma proof_of_ap_read_table_return_wit_1 : ArgmaxPool.read_table_goal.ap_read_table_return_wit_1.
Proof. unfold ArgmaxPool.read_table_goal.ap_read_table_return_wit_1;left;intros p P;pintro;match goal with Hp:ap_ptr_present P p|-_=>sep_apply(proj2(ap_ptr_data_pop P p Hp))end;entailer!. Qed.
End CheckedReadTable.
Print Assumptions CheckedReadTable.proof_of_ap_read_table_entail_wit_1.
Print Assumptions CheckedReadTable.proof_of_ap_read_table_return_wit_1.
Print Assumptions ArgmaxPool.MemoryFacts.ap_ptr_data_pop.
