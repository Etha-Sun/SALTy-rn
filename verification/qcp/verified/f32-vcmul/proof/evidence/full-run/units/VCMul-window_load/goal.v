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
Require Import VCMul.Model.
Require Import QcpVadd.VaddBits VCMul.Model.
Local Open Scope sac.

(*----- Function qcp_vcmul_load4 -----*)

Definition qcp_vcmul_load4_safety_wit_1 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vcmul_load4_safety_wit_2 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vcmul_load4_safety_wit_3 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_vcmul_load4_safety_wit_4 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_vcmul_load4_entail_wit_1 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  (FloatArray.full base n L )
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
).

Definition qcp_vcmul_load4_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
.

Definition qcp_vcmul_load4_entail_wit_2 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
|--
  (FloatArray.full base n L )
).

Definition qcp_vcmul_load4_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 0 ) 0 n L )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
|--
  (FloatArray.full base n L )
.

Definition qcp_vcmul_load4_entail_wit_3 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
).

Definition qcp_vcmul_load4_entail_wit_3_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
.

Definition qcp_vcmul_load4_entail_wit_4 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
|--
  (FloatArray.full base n L )
).

Definition qcp_vcmul_load4_entail_wit_4_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 1 ) 0 n L )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
|--
  (FloatArray.full base n L )
.

Definition qcp_vcmul_load4_entail_wit_5 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
).

Definition qcp_vcmul_load4_entail_wit_5_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
.

Definition qcp_vcmul_load4_entail_wit_6 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
|--
  (FloatArray.full base n L )
).

Definition qcp_vcmul_load4_entail_wit_6_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 2 ) 0 n L )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
|--
  (FloatArray.full base n L )
.

Definition qcp_vcmul_load4_entail_wit_7 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
).

Definition qcp_vcmul_load4_entail_wit_7_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base n L )
|--
  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
.

Definition qcp_vcmul_load4_entail_wit_8 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
|--
  (FloatArray.full base n L )
).

Definition qcp_vcmul_load4_entail_wit_8_split_goal_spatial := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + 3 ) 0 n L )
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
|--
  (FloatArray.full base n L )
.

Definition qcp_vcmul_load4_return_wit_1 := 
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z) (record_return: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  (FloatArray.full base n L )
|--
  (FloatArray.full base n L )
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth idx L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
) \/
(
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  TT && emp 
|--
  “ (fp32_eq (Znth (idx + 0 ) L __default_fp32) (Znth idx L __default_fp32)) ”
  &&  emp
).

Definition qcp_vcmul_load4_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq (Znth (idx + 0 ) L __default_fp32) (Znth idx L __default_fp32))
.

Definition qcp_vcmul_load4_partial_solve_wit_1 := 
forall (p_pre: Z) (L: (@list fp32)) (idx: Z) (n: Z) (base: Z) (record_return: Z)  __default_fp32 (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= n)) (PreH3 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredfloat32x4_t record_return )
  **  (FloatArray.full base n L )
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
|--
  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= n) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Znth (idx + 3 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Znth (idx + 2 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Znth (idx + 1 ) L __default_fp32))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Znth (idx + 0 ) L __default_fp32))
  **  (FloatArray.full base n L )
.

Module Type VC_Correct.


Axiom proof_of_qcp_vcmul_load4_safety_wit_1 : qcp_vcmul_load4_safety_wit_1.
Axiom proof_of_qcp_vcmul_load4_safety_wit_2 : qcp_vcmul_load4_safety_wit_2.
Axiom proof_of_qcp_vcmul_load4_safety_wit_3 : qcp_vcmul_load4_safety_wit_3.
Axiom proof_of_qcp_vcmul_load4_safety_wit_4 : qcp_vcmul_load4_safety_wit_4.
Axiom proof_of_qcp_vcmul_load4_entail_wit_1 : qcp_vcmul_load4_entail_wit_1.
Axiom proof_of_qcp_vcmul_load4_entail_wit_2 : qcp_vcmul_load4_entail_wit_2.
Axiom proof_of_qcp_vcmul_load4_entail_wit_3 : qcp_vcmul_load4_entail_wit_3.
Axiom proof_of_qcp_vcmul_load4_entail_wit_4 : qcp_vcmul_load4_entail_wit_4.
Axiom proof_of_qcp_vcmul_load4_entail_wit_5 : qcp_vcmul_load4_entail_wit_5.
Axiom proof_of_qcp_vcmul_load4_entail_wit_6 : qcp_vcmul_load4_entail_wit_6.
Axiom proof_of_qcp_vcmul_load4_entail_wit_7 : qcp_vcmul_load4_entail_wit_7.
Axiom proof_of_qcp_vcmul_load4_entail_wit_8 : qcp_vcmul_load4_entail_wit_8.
Axiom proof_of_qcp_vcmul_load4_return_wit_1 : qcp_vcmul_load4_return_wit_1.
Axiom proof_of_qcp_vcmul_load4_partial_solve_wit_1 : qcp_vcmul_load4_partial_solve_wit_1.

End VC_Correct.
