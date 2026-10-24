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
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.MemoryModel.
Local Open Scope sac.

(*----- Function rdsum_read_byte -----*)

Definition rdsum_read_byte_entail_wit_1 := 
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  (rd_mem M )
|--
  “ (p_pre <> 0) ” 
  &&  “ (rd_present M p_pre ) ”
  &&  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
) \/
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  (rd_mem M )
|--
  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
).

Definition rdsum_read_byte_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  (rd_mem M )
|--
  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
.

Definition rdsum_read_byte_entail_wit_2 := 
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
|--
  “ (p_pre <> 0) ” 
  &&  “ (rd_present M p_pre ) ”
  &&  (rd_mem M )
) \/
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
|--
  (rd_mem M )
).

Definition rdsum_read_byte_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  ((p_pre) # Char  |-> (rd_get (M) (p_pre)))
  **  (rd_mem (rd_remove (M) (p_pre)) )
|--
  (rd_mem M )
.

Definition rdsum_read_byte_return_wit_1 := 
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  (rd_mem M )
|--
  “ ((rd_get (M) (p_pre)) = (rd_get (M) (p_pre))) ” 
  &&  “ ((-128) <= (rd_get (M) (p_pre))) ” 
  &&  “ ((rd_get (M) (p_pre)) <= 127) ”
  &&  (rd_mem M )
) \/
(
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  TT && emp 
|--
  “ ((rd_get (M) (p_pre)) <= 127) ” 
  &&  “ ((-128) <= (rd_get (M) (p_pre))) ”
  &&  emp
).

Definition rdsum_read_byte_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  ((rd_get (M) (p_pre)) <= 127)
.

Definition rdsum_read_byte_return_wit_1_split_goal_2 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (p_pre <> 0)) (PreH2 : (rd_present M p_pre )) ,
  ((-128) <= (rd_get (M) (p_pre)))
.

Module Type VC_Correct.


Axiom proof_of_rdsum_read_byte_entail_wit_1 : rdsum_read_byte_entail_wit_1.
Axiom proof_of_rdsum_read_byte_entail_wit_2 : rdsum_read_byte_entail_wit_2.
Axiom proof_of_rdsum_read_byte_return_wit_1 : rdsum_read_byte_return_wit_1.

End VC_Correct.
