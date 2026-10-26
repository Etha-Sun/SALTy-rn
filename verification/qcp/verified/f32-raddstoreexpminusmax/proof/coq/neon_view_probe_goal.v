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
From ExpMinusMax Require Import neon_view_probe_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Require Import ExpMinusMax.IntrinsicModel.
Require Import ExpMinusMax.BorrowedMemory.
Local Open Scope sac.

(*----- Function em_view_probe -----*)

Definition em_view_probe_return_wit_1 := 
forall (x_pre: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s0) ))
|--
  EX (A: Recordfloat32x4_t) ,
  (StructPredfloat32x4_t record_return A )
.

Definition em_view_probe_partial_solve_wit_1_pure := 
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
) \/
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
).

Definition em_view_probe_partial_solve_wit_1_pure_split_goal_1 := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
.

Definition em_view_probe_partial_solve_wit_1_aux := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  “ (em_same x_pre x_pre ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
.

Definition em_view_probe_partial_solve_wit_1 := em_view_probe_partial_solve_wit_1_pure -> em_view_probe_partial_solve_wit_1_aux.

Definition em_view_probe_partial_solve_wit_2 := 
forall (x_pre: fp32) (retval: Z) ,
  (StructPredfloat32x4_t retval (em_neon_dup (x_pre)) )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
.

Definition em_view_probe_partial_solve_wit_3_pure := 
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
) \/
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
).

Definition em_view_probe_partial_solve_wit_3_pure_split_goal_1 := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
.

Definition em_view_probe_partial_solve_wit_3_aux := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
|--
  “ (em_same x_pre x_pre ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
.

Definition em_view_probe_partial_solve_wit_3 := em_view_probe_partial_solve_wit_3_pure -> em_view_probe_partial_solve_wit_3_aux.

Definition em_view_probe_partial_solve_wit_4 := 
forall (x_pre: fp32) (retval: Z) ,
  (StructPredfloat32x4_t retval (em_neon_dup (x_pre)) )
  **  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
|--
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
.

Definition em_view_probe_partial_solve_wit_5 := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
|--
  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
.

Definition em_view_probe_partial_solve_wit_6 := 
forall (x_pre: fp32) (retval: Z) ,
  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t retval (em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))) )
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
|--
  ((&(( &( "c" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
.

Definition em_view_probe_partial_solve_wit_7 := 
forall (x_pre: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ((make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))))).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )
.

Module Type VC_Correct.


Axiom proof_of_em_view_probe_return_wit_1 : em_view_probe_return_wit_1.
Axiom proof_of_em_view_probe_partial_solve_wit_1_pure : em_view_probe_partial_solve_wit_1_pure.
Axiom proof_of_em_view_probe_partial_solve_wit_1 : em_view_probe_partial_solve_wit_1.
Axiom proof_of_em_view_probe_partial_solve_wit_2 : em_view_probe_partial_solve_wit_2.
Axiom proof_of_em_view_probe_partial_solve_wit_3_pure : em_view_probe_partial_solve_wit_3_pure.
Axiom proof_of_em_view_probe_partial_solve_wit_3 : em_view_probe_partial_solve_wit_3.
Axiom proof_of_em_view_probe_partial_solve_wit_4 : em_view_probe_partial_solve_wit_4.
Axiom proof_of_em_view_probe_partial_solve_wit_5 : em_view_probe_partial_solve_wit_5.
Axiom proof_of_em_view_probe_partial_solve_wit_6 : em_view_probe_partial_solve_wit_6.
Axiom proof_of_em_view_probe_partial_solve_wit_7 : em_view_probe_partial_solve_wit_7.

End VC_Correct.
