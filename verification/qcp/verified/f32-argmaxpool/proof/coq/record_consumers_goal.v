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
From ArgmaxPool Require Import record_consumers_def.
Import Snaive_C_Rules64.
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.ReadPreviousModel.
Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel.
Require Import ArgmaxPool.VectorRecords.
Local Open Scope sac.

(*----- Function ap_record_select4_borrow -----*)

Definition ap_record_select4_borrow_return_wit_1 := 
(
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : (ap_record_mask4 M )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s3) )) ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s2) )) ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s1) )) ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s0) )) ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  EX (R: Recordfloat32x4_t) ,
  “ (ap_record_same4 R (ap_record_select4 (M) (A) (B)) ) ”
  &&  (StructPredfloat32x4_t pa_pre A )
  **  (StructPredfloat32x4_t pb_pre B )
  **  (StructPreduint32x4_t pm_pre M )
  **  (StructPredfloat32x4_t record_return R )
) \/
(
forall (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (PreH1 : (ap_record_mask4 M )) ,
  TT && emp 
|--
  “ (ap_record_same4 (make_record_float32x4_t ((ap_select_f32 ((M.(uint32x4_t_s0) )) ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_select_f32 ((M.(uint32x4_t_s1) )) ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_select_f32 ((M.(uint32x4_t_s2) )) ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_select_f32 ((M.(uint32x4_t_s3) )) ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) (ap_record_select4 (M) (A) (B)) ) ”
  &&  emp
).

Definition ap_record_select4_borrow_return_wit_1_split_goal_1 := 
forall (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (PreH1 : (ap_record_mask4 M )) ,
  (ap_record_same4 (make_record_float32x4_t ((ap_select_f32 ((M.(uint32x4_t_s0) )) ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) )))) ((ap_select_f32 ((M.(uint32x4_t_s1) )) ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) )))) ((ap_select_f32 ((M.(uint32x4_t_s2) )) ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) )))) ((ap_select_f32 ((M.(uint32x4_t_s3) )) ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))) (ap_record_select4 (M) (A) (B)) )
.

Definition ap_record_select4_borrow_partial_solve_wit_1 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (PreH1 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (StructPredfloat32x4_t pa_pre A )
  **  (StructPredfloat32x4_t pb_pre B )
  **  (StructPreduint32x4_t pm_pre M )
|--
  “ (ap_record_mask4 M ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t pb_pre B )
  **  (StructPreduint32x4_t pm_pre M )
.

Definition ap_record_select4_borrow_partial_solve_wit_2 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (PreH1 : (ap_record_mask4 M )) ,
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
  **  (StructPreduint32x4_t pm_pre M )
|--
  “ (ap_record_mask4 M ) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
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
  **  (StructPreduint32x4_t pm_pre M )
.

Definition ap_record_select4_borrow_partial_solve_wit_3 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (PreH1 : (ap_record_mask4 M )) ,
  (UndefStructPreduint32x4_t ( &( "m" ) ) )
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
  **  (StructPreduint32x4_t pm_pre M )
|--
  “ (ap_record_mask4 M ) ”
  &&  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
.

Definition ap_record_select4_borrow_partial_solve_wit_4_pure := 
(
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s3) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s2) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s1) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s0) ) ) ”
) \/
(
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : ((M.(uint32x4_t_s0) ) <= UINT_MAX)) (PreH2 : ((M.(uint32x4_t_s1) ) <= UINT_MAX)) (PreH3 : ((M.(uint32x4_t_s2) ) <= UINT_MAX)) (PreH4 : ((M.(uint32x4_t_s3) ) <= UINT_MAX)) (PreH5 : ((M.(uint32x4_t_s0) ) >= 0)) (PreH6 : ((M.(uint32x4_t_s1) ) >= 0)) (PreH7 : ((M.(uint32x4_t_s2) ) >= 0)) (PreH8 : ((M.(uint32x4_t_s3) ) >= 0)) (PreH9 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s0) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s1) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s2) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s3) ) ) ”
).

Definition ap_record_select4_borrow_partial_solve_wit_4_pure_split_goal_1 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : ((M.(uint32x4_t_s0) ) <= UINT_MAX)) (PreH2 : ((M.(uint32x4_t_s1) ) <= UINT_MAX)) (PreH3 : ((M.(uint32x4_t_s2) ) <= UINT_MAX)) (PreH4 : ((M.(uint32x4_t_s3) ) <= UINT_MAX)) (PreH5 : ((M.(uint32x4_t_s0) ) >= 0)) (PreH6 : ((M.(uint32x4_t_s1) ) >= 0)) (PreH7 : ((M.(uint32x4_t_s2) ) >= 0)) (PreH8 : ((M.(uint32x4_t_s3) ) >= 0)) (PreH9 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s0) ) ) ”
.

Definition ap_record_select4_borrow_partial_solve_wit_4_pure_split_goal_2 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : ((M.(uint32x4_t_s0) ) <= UINT_MAX)) (PreH2 : ((M.(uint32x4_t_s1) ) <= UINT_MAX)) (PreH3 : ((M.(uint32x4_t_s2) ) <= UINT_MAX)) (PreH4 : ((M.(uint32x4_t_s3) ) <= UINT_MAX)) (PreH5 : ((M.(uint32x4_t_s0) ) >= 0)) (PreH6 : ((M.(uint32x4_t_s1) ) >= 0)) (PreH7 : ((M.(uint32x4_t_s2) ) >= 0)) (PreH8 : ((M.(uint32x4_t_s3) ) >= 0)) (PreH9 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s1) ) ) ”
.

Definition ap_record_select4_borrow_partial_solve_wit_4_pure_split_goal_3 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : ((M.(uint32x4_t_s0) ) <= UINT_MAX)) (PreH2 : ((M.(uint32x4_t_s1) ) <= UINT_MAX)) (PreH3 : ((M.(uint32x4_t_s2) ) <= UINT_MAX)) (PreH4 : ((M.(uint32x4_t_s3) ) <= UINT_MAX)) (PreH5 : ((M.(uint32x4_t_s0) ) >= 0)) (PreH6 : ((M.(uint32x4_t_s1) ) >= 0)) (PreH7 : ((M.(uint32x4_t_s2) ) >= 0)) (PreH8 : ((M.(uint32x4_t_s3) ) >= 0)) (PreH9 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s2) ) ) ”
.

Definition ap_record_select4_borrow_partial_solve_wit_4_pure_split_goal_4 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : ((M.(uint32x4_t_s0) ) <= UINT_MAX)) (PreH2 : ((M.(uint32x4_t_s1) ) <= UINT_MAX)) (PreH3 : ((M.(uint32x4_t_s2) ) <= UINT_MAX)) (PreH4 : ((M.(uint32x4_t_s3) ) <= UINT_MAX)) (PreH5 : ((M.(uint32x4_t_s0) ) >= 0)) (PreH6 : ((M.(uint32x4_t_s1) ) >= 0)) (PreH7 : ((M.(uint32x4_t_s2) ) >= 0)) (PreH8 : ((M.(uint32x4_t_s3) ) >= 0)) (PreH9 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "pb" ) )) # Ptr  |-> pb_pre)
  **  ((( &( "pm" ) )) # Ptr  |-> pm_pre)
|--
  “ (ap_bool_mask (M.(uint32x4_t_s3) ) ) ”
.

Definition ap_record_select4_borrow_partial_solve_wit_4_aux := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (PreH1 : (ap_record_mask4 M )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
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
  “ (ap_bool_mask (M.(uint32x4_t_s3) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s2) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s1) ) ) ” 
  &&  “ (ap_bool_mask (M.(uint32x4_t_s0) ) ) ” 
  &&  “ (ap_record_mask4 M ) ”
  &&  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition ap_record_select4_borrow_partial_solve_wit_4 := ap_record_select4_borrow_partial_solve_wit_4_pure -> ap_record_select4_borrow_partial_solve_wit_4_aux.

Definition ap_record_select4_borrow_partial_solve_wit_5 := 
forall (pm_pre: Z) (pb_pre: Z) (pa_pre: Z) (M: Recorduint32x4_t) (B: Recordfloat32x4_t) (A: Recordfloat32x4_t) (record_return: Z) (retval: Z) (PreH1 : (ap_record_mask4 M )) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s0) )) ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s1) )) ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s2) )) ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s3) )) ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
|--
  “ (ap_record_mask4 M ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s3) )) ((A.(float32x4_t_s3) )) ((B.(float32x4_t_s3) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s2) )) ((A.(float32x4_t_s2) )) ((B.(float32x4_t_s2) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s1) )) ((A.(float32x4_t_s1) )) ((B.(float32x4_t_s1) ))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (ap_select_f32 ((M.(uint32x4_t_s0) )) ((A.(float32x4_t_s0) )) ((B.(float32x4_t_s0) ))))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&((pm_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (B.(float32x4_t_s3) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (B.(float32x4_t_s2) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (B.(float32x4_t_s1) ))
  **  ((&((pb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (B.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> (M.(uint32x4_t_s0) ))
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> (M.(uint32x4_t_s1) ))
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> (M.(uint32x4_t_s2) ))
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> (M.(uint32x4_t_s3) ))
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


Axiom proof_of_ap_record_select4_borrow_return_wit_1 : ap_record_select4_borrow_return_wit_1.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_1 : ap_record_select4_borrow_partial_solve_wit_1.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_2 : ap_record_select4_borrow_partial_solve_wit_2.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_3 : ap_record_select4_borrow_partial_solve_wit_3.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_4_pure : ap_record_select4_borrow_partial_solve_wit_4_pure.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_4 : ap_record_select4_borrow_partial_solve_wit_4.
Axiom proof_of_ap_record_select4_borrow_partial_solve_wit_5 : ap_record_select4_borrow_partial_solve_wit_5.

End VC_Correct.
