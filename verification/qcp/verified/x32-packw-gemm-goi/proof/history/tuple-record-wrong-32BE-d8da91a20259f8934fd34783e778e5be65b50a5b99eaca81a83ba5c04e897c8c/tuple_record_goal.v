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
From X32Packw Require Import tuple_record_def.
Import Snaive_C_Rules64.
Local Open Scope sac.

(*----- Function pw_record_copy -----*)

Definition pw_record_copy_return_wit_1 := 
forall (p_pre: Z) (V: Recorduint32x2x2_t) (record_return: Z) ,
  (Structuint32x2_tArray.full &((record_return)  # "uint32x2x2_t" ->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
  **  (Structuint32x2_tArray.full &((p_pre)  # "uint32x2x2_t" ->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
|--
  (StructPreduint32x2x2_t p_pre V )
  **  (StructPreduint32x2x2_t record_return V )
.

Definition pw_record_copy_partial_solve_wit_1 := 
forall (p_pre: Z) (V: Recorduint32x2x2_t) ,
  (UndefStructPreduint32x2x2_t ( &( "v" ) ) )
  **  (StructPreduint32x2x2_t p_pre V )
|--
  (Structuint32x2_tArray.undef_full &(( &( "v" ) )->ₛ "val") 2 )
  **  (Structuint32x2_tArray.full &((p_pre)  # "uint32x2x2_t" ->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
.

Definition pw_record_copy_partial_solve_wit_2 := 
forall (p_pre: Z) (V: Recorduint32x2x2_t) (record_return: Z) ,
  (UndefStructPreduint32x2x2_t record_return )
  **  (Structuint32x2_tArray.full &(( &( "v" ) )->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
  **  (Structuint32x2_tArray.full &((p_pre)  # "uint32x2x2_t" ->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
|--
  (Structuint32x2_tArray.undef_full &((record_return)  # "uint32x2x2_t" ->ₛ "val") 2 )
  **  (Structuint32x2_tArray.full &(( &( "v" ) )->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
  **  (Structuint32x2_tArray.full &((p_pre)  # "uint32x2x2_t" ->ₛ "val") 2 (V.(uint32x2x2_t_val) ) )
.

Module Type VC_Correct.


Axiom proof_of_pw_record_copy_return_wit_1 : pw_record_copy_return_wit_1.
Axiom proof_of_pw_record_copy_partial_solve_wit_1 : pw_record_copy_partial_solve_wit_1.
Axiom proof_of_pw_record_copy_partial_solve_wit_2 : pw_record_copy_partial_solve_wit_2.

End VC_Correct.
