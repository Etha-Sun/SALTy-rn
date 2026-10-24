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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Local Open Scope sac.

(*----- Function rdsum_get_i32 -----*)

Definition rdsum_get_i32_entail_wit_1 := 
(
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ”
  &&  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
) \/
(
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
).

Definition rdsum_get_i32_entail_wit_1_split_goal_spatial := 
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
.

Definition rdsum_get_i32_entail_wit_2 := 
(
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (p_pre = (base + (idx * 4 ) ))) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : ((idx + i_pre ) < count)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
|--
  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (0 <= (Znth (idx + i_pre ) L 0)) ” 
  &&  “ ((Znth (idx + i_pre ) L 0) <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
) \/
(
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : ((Znth (idx + i_pre ) L 0) <= UINT_MAX)) (PreH2 : ((Znth (idx + i_pre ) L 0) >= 0)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= idx)) (PreH5 : (0 <= i_pre)) (PreH6 : ((idx + i_pre ) < count)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
|--
  (UIntArray.full base count L )
).

Definition rdsum_get_i32_entail_wit_2_split_goal_spatial := 
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : ((Znth (idx + i_pre ) L 0) <= UINT_MAX)) (PreH2 : ((Znth (idx + i_pre ) L 0) >= 0)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= idx)) (PreH5 : (0 <= i_pre)) (PreH6 : ((idx + i_pre ) < count)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
|--
  (UIntArray.full base count L )
.

Definition rdsum_get_i32_return_wit_1 := 
forall (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (p_pre = (base + (idx * 4 ) ))) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : ((idx + i_pre ) < count)) (PreH5 : (0 <= (Znth (idx + i_pre ) L 0))) (PreH6 : ((Znth (idx + i_pre ) L 0) <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  “ ((Znth (idx + i_pre ) L 0) = (Znth (idx + i_pre ) L 0)) ” 
  &&  “ (0 <= (Znth (idx + i_pre ) L 0)) ” 
  &&  “ ((Znth (idx + i_pre ) L 0) <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
.

(*----- Function rdsum_put_i32 -----*)

Definition rdsum_put_i32_entail_wit_1 := 
(
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) (PreH5 : (0 <= v_pre)) (PreH6 : (v_pre <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (0 <= v_pre) ” 
  &&  “ (v_pre <= UINT_MAX) ”
  &&  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
) \/
(
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) (PreH5 : (0 <= v_pre)) (PreH6 : (v_pre <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
).

Definition rdsum_put_i32_entail_wit_1_split_goal_spatial := 
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : (0 <= i_pre)) (PreH3 : ((idx + i_pre ) < count)) (PreH4 : (p_pre = (base + (idx * 4 ) ))) (PreH5 : (0 <= v_pre)) (PreH6 : (v_pre <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> (Znth (idx + i_pre ) L 0))
.

Definition rdsum_put_i32_entail_wit_2 := 
(
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (p_pre = (base + (idx * 4 ) ))) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : ((idx + i_pre ) < count)) (PreH5 : (0 <= v_pre)) (PreH6 : (v_pre <= UINT_MAX)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> v_pre)
|--
  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ”
  &&  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (v_pre) (L)) )
) \/
(
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (v_pre <= UINT_MAX)) (PreH2 : (v_pre >= 0)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= idx)) (PreH5 : (0 <= i_pre)) (PreH6 : ((idx + i_pre ) < count)) (PreH7 : (0 <= v_pre)) (PreH8 : (v_pre <= UINT_MAX)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> v_pre)
|--
  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (v_pre) (L)) )
).

Definition rdsum_put_i32_entail_wit_2_split_goal_spatial := 
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (v_pre <= UINT_MAX)) (PreH2 : (v_pre >= 0)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= idx)) (PreH5 : (0 <= i_pre)) (PreH6 : ((idx + i_pre ) < count)) (PreH7 : (0 <= v_pre)) (PreH8 : (v_pre <= UINT_MAX)) ,
  (UIntArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(UINT)))) # UInt  |-> v_pre)
|--
  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (v_pre) (L)) )
.

Definition rdsum_put_i32_return_wit_1 := 
forall (v_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (p_pre = (base + (idx * 4 ) ))) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : ((idx + i_pre ) < count)) ,
  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (v_pre) (L)) )
|--
  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (v_pre) (L)) )
.

Module Type VC_Correct.


Axiom proof_of_rdsum_get_i32_entail_wit_1 : rdsum_get_i32_entail_wit_1.
Axiom proof_of_rdsum_get_i32_entail_wit_2 : rdsum_get_i32_entail_wit_2.
Axiom proof_of_rdsum_get_i32_return_wit_1 : rdsum_get_i32_return_wit_1.
Axiom proof_of_rdsum_put_i32_entail_wit_1 : rdsum_put_i32_entail_wit_1.
Axiom proof_of_rdsum_put_i32_entail_wit_2 : rdsum_put_i32_entail_wit_2.
Axiom proof_of_rdsum_put_i32_return_wit_1 : rdsum_put_i32_return_wit_1.

End VC_Correct.
