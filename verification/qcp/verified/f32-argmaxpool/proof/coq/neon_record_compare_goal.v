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
From ArgmaxPool Require Import neon_record_compare_def.
Import Snaive_C_Rules64.
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.ReadPreviousModel.
Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel.
Require Import ArgmaxPool.VectorRecords.
Require Import ArgmaxPool.NeonRecordCompareModel.
Local Open Scope sac.

(*----- Function ap_record_neon_gt4 -----*)

Definition ap_record_neon_gt4_return_wit_1 := 
(
forall (pb_pre: Z) (pa_pre: Z) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  EX (R: Recorduint32x4_t) ,
  “ (ap_record_same_u4 R (ap_record_gt4 (A) (B)) ) ” 
  &&  “ (ap_record_mask4 R ) ”
  &&  (StructPredfloat32x4_t pa_pre A )
  **  (StructPredfloat32x4_t pb_pre B )
  **  (StructPreduint32x4_t record_return R )
) \/
(
forall (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) ,
  TT && emp 
|--
  “ (ap_record_mask4 (make_record_uint32x4_t ((ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) ) ” 
  &&  “ (ap_record_same_u4 (make_record_uint32x4_t ((ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) (ap_record_gt4 (A) (B)) ) ”
  &&  emp
).

Definition ap_record_neon_gt4_return_wit_1_split_goal_1 := 
forall (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) ,
  (ap_record_mask4 (make_record_uint32x4_t ((ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) )
.

Definition ap_record_neon_gt4_return_wit_1_split_goal_2 := 
forall (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) ,
  (ap_record_same_u4 (make_record_uint32x4_t ((ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) (ap_record_gt4 (A) (B)) )
.

Definition ap_record_neon_gt4_partial_solve_wit_1 := 
forall (pb_pre: Z) (pa_pre: Z) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (StructPredfloat32x4_t pa_pre A )
  **  (StructPredfloat32x4_t pb_pre B )
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t pb_pre B )
.

Definition ap_record_neon_gt4_partial_solve_wit_2 := 
forall (pb_pre: Z) (pa_pre: Z) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t pb_pre B )
|--
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition ap_record_neon_gt4_partial_solve_wit_3 := 
forall (pb_pre: Z) (pa_pre: Z) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition ap_record_neon_gt4_partial_solve_wit_4 := 
forall (pb_pre: Z) (pa_pre: Z) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (ap_gt_mask ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
.

Module Type VC_Correct.


Axiom proof_of_ap_record_neon_gt4_return_wit_1 : ap_record_neon_gt4_return_wit_1.
Axiom proof_of_ap_record_neon_gt4_partial_solve_wit_1 : ap_record_neon_gt4_partial_solve_wit_1.
Axiom proof_of_ap_record_neon_gt4_partial_solve_wit_2 : ap_record_neon_gt4_partial_solve_wit_2.
Axiom proof_of_ap_record_neon_gt4_partial_solve_wit_3 : ap_record_neon_gt4_partial_solve_wit_3.
Axiom proof_of_ap_record_neon_gt4_partial_solve_wit_4 : ap_record_neon_gt4_partial_solve_wit_4.

End VC_Correct.
