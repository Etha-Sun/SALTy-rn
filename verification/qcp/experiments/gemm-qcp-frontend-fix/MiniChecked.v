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
From Diagnostic Require Import for_if_explicit_cut_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Local Open Scope sac.

Module VC_Correctness : VC_Correct.

Lemma proof_of_test_safety_wit_1 : test_safety_wit_1.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_2 : test_safety_wit_2.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_3 : test_safety_wit_3.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_4 : test_safety_wit_4.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_5 : test_safety_wit_5.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_6 : test_safety_wit_6.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_7 : test_safety_wit_7.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_safety_wit_8 : test_safety_wit_8.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_1 : test_entail_wit_1.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_2 : test_entail_wit_2.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_3 : test_entail_wit_3.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_4 : test_entail_wit_4.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_5_1 : test_entail_wit_5_1.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_entail_wit_5_2 : test_entail_wit_5_2.
Proof. pre_process; entailer!; lia. Qed. 

Lemma proof_of_test_return_wit_1 : test_return_wit_1.
Proof. pre_process; entailer!; lia. Qed. 


End VC_Correctness.
