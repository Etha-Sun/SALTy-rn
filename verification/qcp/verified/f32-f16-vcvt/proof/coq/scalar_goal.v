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
Require Import F32F16.Bits.
Require Import F32F16.Model.
Local Open Scope sac.

(*----- Function qcp_f16_abs -----*)

Definition qcp_f16_abs_return_wit_1 := 
(
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.land retval_2 INT_MAX))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_abs (x_pre)) ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.land retval_2 INT_MAX))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_abs (x_pre)) ) ”
  &&  emp
).

Definition qcp_f16_abs_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.land retval_2 INT_MAX))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  (f16_same_bits retval (f16_abs (x_pre)) )
.

Definition qcp_f16_abs_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_abs_partial_solve_wit_2 := 
forall (x_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (x_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_sign -----*)

Definition qcp_f16_sign_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land retval_2 INT_MAX) (Z.land retval_3 2147483648)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_sign (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land retval_2 INT_MAX) (Z.land retval_3 2147483648)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_sign (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_sign_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land retval_2 INT_MAX) (Z.land retval_3 2147483648)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_sign (a_pre) (b_pre)) )
.

Definition qcp_f16_sign_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_sign_partial_solve_wit_2 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_sign_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_select -----*)

Definition qcp_f16_select_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (m_pre: Z) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land m_pre retval_2) (Z.land (Z.lxor m_pre UINT_MAX) retval_3)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_select (m_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (m_pre: Z) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land m_pre retval_2) (Z.land (Z.lxor m_pre UINT_MAX) retval_3)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_select (m_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_select_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (m_pre: Z) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor (Z.land m_pre retval_2) (Z.land (Z.lxor m_pre UINT_MAX) retval_3)))) )) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_select (m_pre) (a_pre) (b_pre)) )
.

Definition qcp_f16_select_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_select_partial_solve_wit_2 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_select_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_quiet -----*)

Definition qcp_f16_quiet_return_wit_1 := 
(
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor retval_2 4194304))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_quiet (x_pre)) ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor retval_2 4194304))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_quiet (x_pre)) ) ”
  &&  emp
).

Definition qcp_f16_quiet_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) (retval_2: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits ((Z.lor retval_2 4194304))) )) (PreH2 : (retval_2 = (bits_of_fp32 (x_pre)))) ,
  (f16_same_bits retval (f16_quiet (x_pre)) )
.

Definition qcp_f16_quiet_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_quiet_partial_solve_wit_2 := 
forall (x_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (x_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_abs_bits -----*)

Definition qcp_f16_abs_bits_return_wit_1 := 
(
forall (u_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land u_pre INT_MAX) = (f16_abs_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land u_pre INT_MAX) = (f16_abs_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_bits_return_wit_1_split_goal_1 := 
forall (u_pre: Z) ,
  ((Z.land u_pre INT_MAX) = (f16_abs_bits (u_pre)))
.

(*----- Function qcp_f16_nan_bits -----*)

Definition qcp_f16_nan_bits_safety_wit_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval > 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_nan_bits_safety_wit_2 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <= 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_nan_bits_return_wit_1 := 
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <= 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_nan_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <= 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_nan_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_nan_bits_return_wit_1_split_goal_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <= 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  (0 = (f16_nan_bits (u_pre)))
.

Definition qcp_f16_nan_bits_return_wit_2 := 
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval > 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_nan_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval > 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_nan_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_nan_bits_return_wit_2_split_goal_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval > 2139095040)) (PreH2 : (retval = (f16_abs_bits (u_pre)))) ,
  (1 = (f16_nan_bits (u_pre)))
.

Definition qcp_f16_nan_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_snan_bits -----*)

Definition qcp_f16_snan_bits_safety_wit_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval = (f16_nan_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_snan_bits_safety_wit_2 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_snan_bits_safety_wit_3 := 
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) = 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_snan_bits_safety_wit_4 := 
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) <> 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_snan_bits_safety_wit_5 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (u_pre)))) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_snan_bits_return_wit_1 := 
(
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) <> 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_snan_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) <> 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_snan_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_snan_bits_return_wit_1_split_goal_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) <> 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  (0 = (f16_snan_bits (u_pre)))
.

Definition qcp_f16_snan_bits_return_wit_2 := 
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_snan_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_snan_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_snan_bits_return_wit_2_split_goal_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (u_pre)))) ,
  (0 = (f16_snan_bits (u_pre)))
.

Definition qcp_f16_snan_bits_return_wit_3 := 
(
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) = 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_snan_bits (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) = 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_snan_bits (u_pre))) ”
  &&  emp
).

Definition qcp_f16_snan_bits_return_wit_3_split_goal_1 := 
forall (u_pre: Z) (retval: Z) (PreH1 : ((Z.land u_pre 4194304) = 0)) (PreH2 : (retval = 1)) (PreH3 : (retval = (f16_nan_bits (u_pre)))) ,
  (1 = (f16_snan_bits (u_pre)))
.

Definition qcp_f16_snan_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_key -----*)

Definition qcp_f16_key_safety_wit_1 := 
forall (u_pre: Z) ,
  ((( &( "u" ) )) # UInt  |-> u_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_key_return_wit_1 := 
(
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) <> 0)) ,
  TT && emp 
|--
  “ ((Z.lxor u_pre UINT_MAX) = (f16_key (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) <> 0)) ,
  TT && emp 
|--
  “ ((Z.lxor u_pre UINT_MAX) = (f16_key (u_pre))) ”
  &&  emp
).

Definition qcp_f16_key_return_wit_1_split_goal_1 := 
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) <> 0)) ,
  ((Z.lxor u_pre UINT_MAX) = (f16_key (u_pre)))
.

Definition qcp_f16_key_return_wit_2 := 
(
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) = 0)) ,
  TT && emp 
|--
  “ ((Z.lxor u_pre 2147483648) = (f16_key (u_pre))) ”
  &&  emp
) \/
(
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) = 0)) ,
  TT && emp 
|--
  “ ((Z.lxor u_pre 2147483648) = (f16_key (u_pre))) ”
  &&  emp
).

Definition qcp_f16_key_return_wit_2_split_goal_1 := 
forall (u_pre: Z) (PreH1 : ((Z.land u_pre 2147483648) = 0)) ,
  ((Z.lxor u_pre 2147483648) = (f16_key (u_pre)))
.

(*----- Function qcp_f16_gt_bits -----*)

Definition qcp_f16_gt_bits_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_gt_bits_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH2 : (retval <> 1)) (PreH3 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_gt_bits_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH2 : (retval_2 <> 1)) (PreH3 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH4 : (retval <> 1)) (PreH5 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_6 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_7 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_8 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 < retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "kb" ) )) # UInt  |-> retval_5)
  **  ((( &( "ka" ) )) # UInt  |-> retval_4)
  **  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_gt_bits_safety_wit_9 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 < retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "kb" ) )) # UInt  |-> retval_6)
  **  ((( &( "ka" ) )) # UInt  |-> retval_5)
  **  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_gt_bits_safety_wit_10 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 >= retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "kb" ) )) # UInt  |-> retval_5)
  **  ((( &( "ka" ) )) # UInt  |-> retval_4)
  **  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_safety_wit_11 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 >= retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "kb" ) )) # UInt  |-> retval_6)
  **  ((( &( "ka" ) )) # UInt  |-> retval_5)
  **  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_gt_bits_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 >= retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 >= retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 >= retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 >= retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 >= retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 >= retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_3 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 < retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 < retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_3_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 < retval_4)) (PreH2 : (retval_5 = (f16_key (b_pre)))) (PreH3 : (retval_4 = (f16_key (a_pre)))) (PreH4 : (retval_3 <> 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_4 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 < retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 < retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_4_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 < retval_5)) (PreH2 : (retval_6 = (f16_key (b_pre)))) (PreH3 : (retval_5 = (f16_key (a_pre)))) (PreH4 : (retval_4 <> 0)) (PreH5 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH6 : (retval_3 = 0)) (PreH7 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH8 : (retval_2 <> 1)) (PreH9 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH10 : (retval <> 1)) (PreH11 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_5 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_5_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_6 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_6_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_return_wit_7 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_gt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_bits_return_wit_7_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_gt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_gt_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_gt_bits_partial_solve_wit_2 := 
forall (a_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH3 : (retval_2 <> 1)) (PreH4 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH5 : (retval <> 1)) (PreH6 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_key (a_pre)))) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = (f16_key (a_pre))) ” 
  &&  “ (retval_3 <> 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_6 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_key (a_pre)))) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (f16_key (a_pre))) ” 
  &&  “ (retval_4 <> 0) ” 
  &&  “ (retval_4 = (f16_abs_bits (b_pre))) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_7 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 <> 0)) (PreH2 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH3 : (retval_2 <> 1)) (PreH4 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH5 : (retval <> 1)) (PreH6 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 <> 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_bits_partial_solve_wit_8 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 <> 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 <> 0) ” 
  &&  “ (retval_4 = (f16_abs_bits (b_pre))) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_gt -----*)

Definition qcp_f16_gt_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_gt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_gt (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_gt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_gt (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_gt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (retval = (f16_gt (a_pre) (b_pre)))
.

Definition qcp_f16_gt_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_gt_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_gt_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_abs_lt_bits -----*)

Definition qcp_f16_abs_lt_bits_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_abs_lt_bits_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH2 : (retval <> 1)) (PreH3 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_abs_lt_bits_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 >= retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 >= retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_lt_bits_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 >= retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_abs_lt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_abs_lt_bits_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 < retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (UINT_MAX = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 < retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (UINT_MAX = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_lt_bits_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_3 < retval_4)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  (UINT_MAX = (f16_abs_lt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_abs_lt_bits_return_wit_3 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_lt_bits_return_wit_3_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_abs_lt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_abs_lt_bits_return_wit_4 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_abs_lt_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_lt_bits_return_wit_4_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_abs_lt_bits (a_pre) (b_pre)))
.

Definition qcp_f16_abs_lt_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_abs_lt_bits_partial_solve_wit_2 := 
forall (a_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_abs_lt_bits_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_abs_lt_bits_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH2 : (retval_2 <> 1)) (PreH3 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH4 : (retval <> 1)) (PreH5 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_abs_lt -----*)

Definition qcp_f16_abs_lt_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_abs_lt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_abs_lt (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_abs_lt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_abs_lt (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_abs_lt_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_abs_lt_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (retval = (f16_abs_lt (a_pre) (b_pre)))
.

Definition qcp_f16_abs_lt_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_abs_lt_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_abs_lt_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_ne_bits -----*)

Definition qcp_f16_ne_bits_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH2 : (retval <> 1)) (PreH3 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_safety_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_safety_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH2 : (retval_2 <> 1)) (PreH3 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH4 : (retval <> 1)) (PreH5 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_ne_bits_safety_wit_6 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_ne_bits_safety_wit_7 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_ne_bits_safety_wit_8 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (a_pre = b_pre)) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ False ”
.

Definition qcp_f16_ne_bits_safety_wit_9 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre = b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_ne_bits_safety_wit_10 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_safety_wit_11 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_ne_bits_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_ne_bits (a_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (a_pre <> b_pre)) (PreH2 : (retval_4 <> 0)) (PreH3 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH4 : (retval_3 = 0)) (PreH5 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH6 : (retval_2 <> 1)) (PreH7 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH8 : (retval <> 1)) (PreH9 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_ne_bits (a_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_return_wit_3 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre = b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre = b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_ne_bits (b_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_3_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (a_pre = b_pre)) (PreH2 : (retval_3 <> 0)) (PreH3 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH4 : (retval_2 <> 1)) (PreH5 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH6 : (retval <> 1)) (PreH7 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_ne_bits (b_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_return_wit_4 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (0 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_4_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_4 = (f16_abs_bits (b_pre)))) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH5 : (retval_2 <> 1)) (PreH6 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH7 : (retval <> 1)) (PreH8 : (retval = (f16_nan_bits (a_pre)))) ,
  (0 = (f16_ne_bits (a_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_return_wit_5 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_5_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_ne_bits (a_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_return_wit_6 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (1 = (f16_ne_bits (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_bits_return_wit_6_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  (1 = (f16_ne_bits (a_pre) (b_pre)))
.

Definition qcp_f16_ne_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_ne_bits_partial_solve_wit_2 := 
forall (a_pre: Z) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_ne_bits_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH3 : (retval <> 1)) (PreH4 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

Definition qcp_f16_ne_bits_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_3 = (f16_abs_bits (a_pre)))) (PreH3 : (retval_2 <> 1)) (PreH4 : (retval_2 = (f16_nan_bits (b_pre)))) (PreH5 : (retval <> 1)) (PreH6 : (retval = (f16_nan_bits (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_3 = (f16_abs_bits (a_pre))) ” 
  &&  “ (retval_2 <> 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (b_pre))) ” 
  &&  “ (retval <> 1) ” 
  &&  “ (retval = (f16_nan_bits (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_ne -----*)

Definition qcp_f16_ne_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_ne_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_ne (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_ne_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_ne (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_ne_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (f16_ne_bits (retval_2) (retval_3)))) (PreH2 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (retval = (f16_ne (a_pre) (b_pre)))
.

Definition qcp_f16_ne_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_ne_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_ne_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_arm_nan -----*)

Definition qcp_f16_arm_nan_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_snan_bits (retval)))) (PreH2 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_nan_safety_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH2 : (retval_3 <> 1)) (PreH3 : (retval_3 = (f16_snan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_nan_safety_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_nan_bits (retval)))) (PreH2 : (retval_4 <> 1)) (PreH3 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_snan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_nan_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 <> 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH7 : (retval = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 <> 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH7 : (retval = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_arm_nan_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 <> 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH7 : (retval = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (retval = (f16_arm_nan (a_pre) (b_pre)))
.

Definition qcp_f16_arm_nan_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_arm_nan_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = 1)) (PreH2 : (retval_5 = (f16_nan_bits (retval)))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_snan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  (retval = (f16_arm_nan (a_pre) (b_pre)))
.

Definition qcp_f16_arm_nan_return_wit_3 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_snan_bits (retval)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH5 : (retval = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_snan_bits (retval)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH5 : (retval = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_arm_nan_return_wit_3_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_snan_bits (retval)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_snan_bits (retval_2)))) (PreH5 : (retval = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre)))
.

Definition qcp_f16_arm_nan_return_wit_4 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_snan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_snan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_arm_nan_return_wit_4_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_snan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((Z.lor retval 4194304) = (f16_arm_nan (a_pre) (b_pre)))
.

Definition qcp_f16_arm_nan_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_nan_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_arm_nan_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_nan_partial_solve_wit_4 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 <> 1)) (PreH2 : (retval_3 = (f16_snan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_snan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_nan_partial_solve_wit_5 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 <> 1)) (PreH2 : (retval_4 = (f16_snan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_snan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_snan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_snan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_arm_add -----*)

Definition qcp_f16_arm_add_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_nan_bits (retval)))) (PreH2 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_add_safety_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH2 : (retval_3 <> 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_add_safety_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH2 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_nan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ur" ) )) # UInt  |-> retval_5)
  **  ((( &( "r" ) )) # Float  |-> (fp32_add (a_pre) (b_pre)))
  **  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_add_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_add_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_arm_add (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_add_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_add_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_add_return_wit_3 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_add_return_wit_3_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_add_return_wit_4 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_add_return_wit_4_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_add (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_add_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_arm_add_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_4 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 <> 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_5 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_6 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_7 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_8 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_4 = 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_9 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 <> 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_10 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH2 : (retval_4 <> 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_add_partial_solve_wit_11 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_6 = 1) ” 
  &&  “ (retval_6 = (f16_nan_bits (retval_5))) ” 
  &&  “ (retval_5 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_arm_sub -----*)

Definition qcp_f16_arm_sub_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_nan_bits (retval)))) (PreH2 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_sub_safety_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH2 : (retval_3 <> 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_sub_safety_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH2 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_nan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ur" ) )) # UInt  |-> retval_5)
  **  ((( &( "r" ) )) # Float  |-> (fp32_sub (a_pre) (b_pre)))
  **  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_sub_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_sub_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_arm_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_sub_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_sub_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_sub_return_wit_3 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_sub_return_wit_3_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_sub_return_wit_4 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_sub_return_wit_4_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_sub_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_arm_sub_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_4 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 <> 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_5 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_6 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_7 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_8 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_4 = 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_9 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 <> 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_10 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH2 : (retval_4 <> 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_sub_partial_solve_wit_11 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_6 = 1) ” 
  &&  “ (retval_6 = (f16_nan_bits (retval_5))) ” 
  &&  “ (retval_5 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_rvv_add -----*)

Definition qcp_f16_rvv_add_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (retval)))) (PreH2 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  ((( &( "ur" ) )) # UInt  |-> retval)
  **  ((( &( "r" ) )) # Float  |-> (fp32_add (a_pre) (b_pre)))
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_rvv_add_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_rvv_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_rvv_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_add_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  (f16_same_bits (fp32_add (a_pre) (b_pre)) (f16_rvv_add (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_add_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_add_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_add_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_rvv_add_partial_solve_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre))))) ”
  &&  emp
.

Definition qcp_f16_rvv_add_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval_2 = 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (retval))) ” 
  &&  “ (retval = (bits_of_fp32 ((fp32_add (a_pre) (b_pre))))) ”
  &&  emp
.

(*----- Function qcp_f16_rvv_sub -----*)

Definition qcp_f16_rvv_sub_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (retval)))) (PreH2 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  ((( &( "ur" ) )) # UInt  |-> retval)
  **  ((( &( "r" ) )) # Float  |-> (fp32_sub (a_pre) (b_pre)))
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_rvv_sub_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_rvv_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_rvv_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_sub_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  (f16_same_bits (fp32_sub (a_pre) (b_pre)) (f16_rvv_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_sub_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_sub_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  (f16_same_bits retval (f16_rvv_sub (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_sub_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_rvv_sub_partial_solve_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre))))) ”
  &&  emp
.

Definition qcp_f16_rvv_sub_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval_2 = 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (retval))) ” 
  &&  “ (retval = (bits_of_fp32 ((fp32_sub (a_pre) (b_pre))))) ”
  &&  emp
.

(*----- Function qcp_f16_arm_mul -----*)

Definition qcp_f16_arm_mul_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_nan_bits (retval)))) (PreH2 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH3 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_mul_safety_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH2 : (retval_3 <> 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_mul_safety_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH2 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH3 : (retval_4 <> 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 <> 1)) (PreH6 : (retval_3 = (f16_nan_bits (retval)))) (PreH7 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval = (bits_of_fp32 (a_pre)))) ,
  ((( &( "ur" ) )) # UInt  |-> retval_5)
  **  ((( &( "r" ) )) # Float  |-> (fp32_mul (a_pre) (b_pre)))
  **  ((( &( "ub" ) )) # UInt  |-> retval_2)
  **  ((( &( "ua" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_arm_mul_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_mul_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 <> 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_arm_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_mul_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_mul_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_7 = 1)) (PreH3 : (retval_7 = (f16_nan_bits (retval_6)))) (PreH4 : (retval_6 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH5 : (retval_5 <> 1)) (PreH6 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH7 : (retval_4 <> 1)) (PreH8 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH9 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH10 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_mul_return_wit_3 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_mul_return_wit_3_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_5)) )) (PreH2 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_4 = 1)) (PreH4 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH5 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_mul_return_wit_4 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_arm_mul_return_wit_4_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (retval_6)) )) (PreH2 : (retval_6 = (f16_arm_nan (a_pre) (b_pre)))) (PreH3 : (retval_5 = 1)) (PreH4 : (retval_5 = (f16_nan_bits (retval_3)))) (PreH5 : (retval_4 <> 1)) (PreH6 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH7 : (retval_3 = (bits_of_fp32 (b_pre)))) (PreH8 : (retval_2 = (bits_of_fp32 (a_pre)))) ,
  (f16_same_bits retval (f16_arm_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_arm_mul_partial_solve_wit_1 := 
forall (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_2 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_arm_mul_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH2 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_4 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 <> 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_5 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 1)) (PreH2 : (retval_3 = (f16_nan_bits (retval)))) (PreH3 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH4 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_6 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_7 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval)))) (PreH4 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH5 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_3 = 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_8 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_arm_nan (a_pre) (b_pre)))) (PreH2 : (retval_4 = 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (f16_arm_nan (a_pre) (b_pre))) ” 
  &&  “ (retval_4 = 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_9 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 <> 1)) (PreH2 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH3 : (retval_3 <> 1)) (PreH4 : (retval_3 = (f16_nan_bits (retval)))) (PreH5 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH6 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_10 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH2 : (retval_4 <> 1)) (PreH3 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_3 <> 1)) (PreH5 : (retval_3 = (f16_nan_bits (retval)))) (PreH6 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH7 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

Definition qcp_f16_arm_mul_partial_solve_wit_11 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = 1)) (PreH2 : (retval_6 = (f16_nan_bits (retval_5)))) (PreH3 : (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) (PreH4 : (retval_4 <> 1)) (PreH5 : (retval_4 = (f16_nan_bits (retval_2)))) (PreH6 : (retval_3 <> 1)) (PreH7 : (retval_3 = (f16_nan_bits (retval)))) (PreH8 : (retval_2 = (bits_of_fp32 (b_pre)))) (PreH9 : (retval = (bits_of_fp32 (a_pre)))) ,
  TT && emp 
|--
  “ (retval_6 = 1) ” 
  &&  “ (retval_6 = (f16_nan_bits (retval_5))) ” 
  &&  “ (retval_5 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre))))) ” 
  &&  “ (retval_4 <> 1) ” 
  &&  “ (retval_4 = (f16_nan_bits (retval_2))) ” 
  &&  “ (retval_3 <> 1) ” 
  &&  “ (retval_3 = (f16_nan_bits (retval))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (b_pre))) ” 
  &&  “ (retval = (bits_of_fp32 (a_pre))) ”
  &&  emp
.

(*----- Function qcp_f16_rvv_mul -----*)

Definition qcp_f16_rvv_mul_safety_wit_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_nan_bits (retval)))) (PreH2 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  ((( &( "ur" ) )) # UInt  |-> retval)
  **  ((( &( "r" ) )) # Float  |-> (fp32_mul (a_pre) (b_pre)))
  **  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_rvv_mul_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_rvv_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_rvv_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_mul_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  (f16_same_bits (fp32_mul (a_pre) (b_pre)) (f16_rvv_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_mul_return_wit_2 := 
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_rvv_mul_return_wit_2_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) (retval_2: Z) (retval_3: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (2143289344)) )) (PreH2 : (retval_3 = 1)) (PreH3 : (retval_3 = (f16_nan_bits (retval_2)))) (PreH4 : (retval_2 = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) )
.

Definition qcp_f16_rvv_mul_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition qcp_f16_rvv_mul_partial_solve_wit_2 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre))))) ”
  &&  emp
.

Definition qcp_f16_rvv_mul_partial_solve_wit_3 := 
forall (b_pre: fp32) (a_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval_2 = (f16_nan_bits (retval)))) (PreH3 : (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre)))))) ,
  TT && emp 
|--
  “ (retval_2 = 1) ” 
  &&  “ (retval_2 = (f16_nan_bits (retval))) ” 
  &&  “ (retval = (bits_of_fp32 ((fp32_mul (a_pre) (b_pre))))) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_qcp_f16_abs_return_wit_1 : qcp_f16_abs_return_wit_1.
Axiom proof_of_qcp_f16_abs_partial_solve_wit_1 : qcp_f16_abs_partial_solve_wit_1.
Axiom proof_of_qcp_f16_abs_partial_solve_wit_2 : qcp_f16_abs_partial_solve_wit_2.
Axiom proof_of_qcp_f16_sign_return_wit_1 : qcp_f16_sign_return_wit_1.
Axiom proof_of_qcp_f16_sign_partial_solve_wit_1 : qcp_f16_sign_partial_solve_wit_1.
Axiom proof_of_qcp_f16_sign_partial_solve_wit_2 : qcp_f16_sign_partial_solve_wit_2.
Axiom proof_of_qcp_f16_sign_partial_solve_wit_3 : qcp_f16_sign_partial_solve_wit_3.
Axiom proof_of_qcp_f16_select_return_wit_1 : qcp_f16_select_return_wit_1.
Axiom proof_of_qcp_f16_select_partial_solve_wit_1 : qcp_f16_select_partial_solve_wit_1.
Axiom proof_of_qcp_f16_select_partial_solve_wit_2 : qcp_f16_select_partial_solve_wit_2.
Axiom proof_of_qcp_f16_select_partial_solve_wit_3 : qcp_f16_select_partial_solve_wit_3.
Axiom proof_of_qcp_f16_quiet_return_wit_1 : qcp_f16_quiet_return_wit_1.
Axiom proof_of_qcp_f16_quiet_partial_solve_wit_1 : qcp_f16_quiet_partial_solve_wit_1.
Axiom proof_of_qcp_f16_quiet_partial_solve_wit_2 : qcp_f16_quiet_partial_solve_wit_2.
Axiom proof_of_qcp_f16_abs_bits_return_wit_1 : qcp_f16_abs_bits_return_wit_1.
Axiom proof_of_qcp_f16_nan_bits_safety_wit_1 : qcp_f16_nan_bits_safety_wit_1.
Axiom proof_of_qcp_f16_nan_bits_safety_wit_2 : qcp_f16_nan_bits_safety_wit_2.
Axiom proof_of_qcp_f16_nan_bits_return_wit_1 : qcp_f16_nan_bits_return_wit_1.
Axiom proof_of_qcp_f16_nan_bits_return_wit_2 : qcp_f16_nan_bits_return_wit_2.
Axiom proof_of_qcp_f16_nan_bits_partial_solve_wit_1 : qcp_f16_nan_bits_partial_solve_wit_1.
Axiom proof_of_qcp_f16_snan_bits_safety_wit_1 : qcp_f16_snan_bits_safety_wit_1.
Axiom proof_of_qcp_f16_snan_bits_safety_wit_2 : qcp_f16_snan_bits_safety_wit_2.
Axiom proof_of_qcp_f16_snan_bits_safety_wit_3 : qcp_f16_snan_bits_safety_wit_3.
Axiom proof_of_qcp_f16_snan_bits_safety_wit_4 : qcp_f16_snan_bits_safety_wit_4.
Axiom proof_of_qcp_f16_snan_bits_safety_wit_5 : qcp_f16_snan_bits_safety_wit_5.
Axiom proof_of_qcp_f16_snan_bits_return_wit_1 : qcp_f16_snan_bits_return_wit_1.
Axiom proof_of_qcp_f16_snan_bits_return_wit_2 : qcp_f16_snan_bits_return_wit_2.
Axiom proof_of_qcp_f16_snan_bits_return_wit_3 : qcp_f16_snan_bits_return_wit_3.
Axiom proof_of_qcp_f16_snan_bits_partial_solve_wit_1 : qcp_f16_snan_bits_partial_solve_wit_1.
Axiom proof_of_qcp_f16_key_safety_wit_1 : qcp_f16_key_safety_wit_1.
Axiom proof_of_qcp_f16_key_return_wit_1 : qcp_f16_key_return_wit_1.
Axiom proof_of_qcp_f16_key_return_wit_2 : qcp_f16_key_return_wit_2.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_1 : qcp_f16_gt_bits_safety_wit_1.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_2 : qcp_f16_gt_bits_safety_wit_2.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_3 : qcp_f16_gt_bits_safety_wit_3.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_4 : qcp_f16_gt_bits_safety_wit_4.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_5 : qcp_f16_gt_bits_safety_wit_5.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_6 : qcp_f16_gt_bits_safety_wit_6.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_7 : qcp_f16_gt_bits_safety_wit_7.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_8 : qcp_f16_gt_bits_safety_wit_8.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_9 : qcp_f16_gt_bits_safety_wit_9.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_10 : qcp_f16_gt_bits_safety_wit_10.
Axiom proof_of_qcp_f16_gt_bits_safety_wit_11 : qcp_f16_gt_bits_safety_wit_11.
Axiom proof_of_qcp_f16_gt_bits_return_wit_1 : qcp_f16_gt_bits_return_wit_1.
Axiom proof_of_qcp_f16_gt_bits_return_wit_2 : qcp_f16_gt_bits_return_wit_2.
Axiom proof_of_qcp_f16_gt_bits_return_wit_3 : qcp_f16_gt_bits_return_wit_3.
Axiom proof_of_qcp_f16_gt_bits_return_wit_4 : qcp_f16_gt_bits_return_wit_4.
Axiom proof_of_qcp_f16_gt_bits_return_wit_5 : qcp_f16_gt_bits_return_wit_5.
Axiom proof_of_qcp_f16_gt_bits_return_wit_6 : qcp_f16_gt_bits_return_wit_6.
Axiom proof_of_qcp_f16_gt_bits_return_wit_7 : qcp_f16_gt_bits_return_wit_7.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_1 : qcp_f16_gt_bits_partial_solve_wit_1.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_2 : qcp_f16_gt_bits_partial_solve_wit_2.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_3 : qcp_f16_gt_bits_partial_solve_wit_3.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_4 : qcp_f16_gt_bits_partial_solve_wit_4.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_5 : qcp_f16_gt_bits_partial_solve_wit_5.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_6 : qcp_f16_gt_bits_partial_solve_wit_6.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_7 : qcp_f16_gt_bits_partial_solve_wit_7.
Axiom proof_of_qcp_f16_gt_bits_partial_solve_wit_8 : qcp_f16_gt_bits_partial_solve_wit_8.
Axiom proof_of_qcp_f16_gt_return_wit_1 : qcp_f16_gt_return_wit_1.
Axiom proof_of_qcp_f16_gt_partial_solve_wit_1 : qcp_f16_gt_partial_solve_wit_1.
Axiom proof_of_qcp_f16_gt_partial_solve_wit_2 : qcp_f16_gt_partial_solve_wit_2.
Axiom proof_of_qcp_f16_gt_partial_solve_wit_3 : qcp_f16_gt_partial_solve_wit_3.
Axiom proof_of_qcp_f16_abs_lt_bits_safety_wit_1 : qcp_f16_abs_lt_bits_safety_wit_1.
Axiom proof_of_qcp_f16_abs_lt_bits_safety_wit_2 : qcp_f16_abs_lt_bits_safety_wit_2.
Axiom proof_of_qcp_f16_abs_lt_bits_return_wit_1 : qcp_f16_abs_lt_bits_return_wit_1.
Axiom proof_of_qcp_f16_abs_lt_bits_return_wit_2 : qcp_f16_abs_lt_bits_return_wit_2.
Axiom proof_of_qcp_f16_abs_lt_bits_return_wit_3 : qcp_f16_abs_lt_bits_return_wit_3.
Axiom proof_of_qcp_f16_abs_lt_bits_return_wit_4 : qcp_f16_abs_lt_bits_return_wit_4.
Axiom proof_of_qcp_f16_abs_lt_bits_partial_solve_wit_1 : qcp_f16_abs_lt_bits_partial_solve_wit_1.
Axiom proof_of_qcp_f16_abs_lt_bits_partial_solve_wit_2 : qcp_f16_abs_lt_bits_partial_solve_wit_2.
Axiom proof_of_qcp_f16_abs_lt_bits_partial_solve_wit_3 : qcp_f16_abs_lt_bits_partial_solve_wit_3.
Axiom proof_of_qcp_f16_abs_lt_bits_partial_solve_wit_4 : qcp_f16_abs_lt_bits_partial_solve_wit_4.
Axiom proof_of_qcp_f16_abs_lt_return_wit_1 : qcp_f16_abs_lt_return_wit_1.
Axiom proof_of_qcp_f16_abs_lt_partial_solve_wit_1 : qcp_f16_abs_lt_partial_solve_wit_1.
Axiom proof_of_qcp_f16_abs_lt_partial_solve_wit_2 : qcp_f16_abs_lt_partial_solve_wit_2.
Axiom proof_of_qcp_f16_abs_lt_partial_solve_wit_3 : qcp_f16_abs_lt_partial_solve_wit_3.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_1 : qcp_f16_ne_bits_safety_wit_1.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_2 : qcp_f16_ne_bits_safety_wit_2.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_3 : qcp_f16_ne_bits_safety_wit_3.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_4 : qcp_f16_ne_bits_safety_wit_4.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_5 : qcp_f16_ne_bits_safety_wit_5.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_6 : qcp_f16_ne_bits_safety_wit_6.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_7 : qcp_f16_ne_bits_safety_wit_7.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_8 : qcp_f16_ne_bits_safety_wit_8.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_9 : qcp_f16_ne_bits_safety_wit_9.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_10 : qcp_f16_ne_bits_safety_wit_10.
Axiom proof_of_qcp_f16_ne_bits_safety_wit_11 : qcp_f16_ne_bits_safety_wit_11.
Axiom proof_of_qcp_f16_ne_bits_return_wit_1 : qcp_f16_ne_bits_return_wit_1.
Axiom proof_of_qcp_f16_ne_bits_return_wit_2 : qcp_f16_ne_bits_return_wit_2.
Axiom proof_of_qcp_f16_ne_bits_return_wit_3 : qcp_f16_ne_bits_return_wit_3.
Axiom proof_of_qcp_f16_ne_bits_return_wit_4 : qcp_f16_ne_bits_return_wit_4.
Axiom proof_of_qcp_f16_ne_bits_return_wit_5 : qcp_f16_ne_bits_return_wit_5.
Axiom proof_of_qcp_f16_ne_bits_return_wit_6 : qcp_f16_ne_bits_return_wit_6.
Axiom proof_of_qcp_f16_ne_bits_partial_solve_wit_1 : qcp_f16_ne_bits_partial_solve_wit_1.
Axiom proof_of_qcp_f16_ne_bits_partial_solve_wit_2 : qcp_f16_ne_bits_partial_solve_wit_2.
Axiom proof_of_qcp_f16_ne_bits_partial_solve_wit_3 : qcp_f16_ne_bits_partial_solve_wit_3.
Axiom proof_of_qcp_f16_ne_bits_partial_solve_wit_4 : qcp_f16_ne_bits_partial_solve_wit_4.
Axiom proof_of_qcp_f16_ne_return_wit_1 : qcp_f16_ne_return_wit_1.
Axiom proof_of_qcp_f16_ne_partial_solve_wit_1 : qcp_f16_ne_partial_solve_wit_1.
Axiom proof_of_qcp_f16_ne_partial_solve_wit_2 : qcp_f16_ne_partial_solve_wit_2.
Axiom proof_of_qcp_f16_ne_partial_solve_wit_3 : qcp_f16_ne_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_nan_safety_wit_1 : qcp_f16_arm_nan_safety_wit_1.
Axiom proof_of_qcp_f16_arm_nan_safety_wit_2 : qcp_f16_arm_nan_safety_wit_2.
Axiom proof_of_qcp_f16_arm_nan_safety_wit_3 : qcp_f16_arm_nan_safety_wit_3.
Axiom proof_of_qcp_f16_arm_nan_return_wit_1 : qcp_f16_arm_nan_return_wit_1.
Axiom proof_of_qcp_f16_arm_nan_return_wit_2 : qcp_f16_arm_nan_return_wit_2.
Axiom proof_of_qcp_f16_arm_nan_return_wit_3 : qcp_f16_arm_nan_return_wit_3.
Axiom proof_of_qcp_f16_arm_nan_return_wit_4 : qcp_f16_arm_nan_return_wit_4.
Axiom proof_of_qcp_f16_arm_nan_partial_solve_wit_1 : qcp_f16_arm_nan_partial_solve_wit_1.
Axiom proof_of_qcp_f16_arm_nan_partial_solve_wit_2 : qcp_f16_arm_nan_partial_solve_wit_2.
Axiom proof_of_qcp_f16_arm_nan_partial_solve_wit_3 : qcp_f16_arm_nan_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_nan_partial_solve_wit_4 : qcp_f16_arm_nan_partial_solve_wit_4.
Axiom proof_of_qcp_f16_arm_nan_partial_solve_wit_5 : qcp_f16_arm_nan_partial_solve_wit_5.
Axiom proof_of_qcp_f16_arm_add_safety_wit_1 : qcp_f16_arm_add_safety_wit_1.
Axiom proof_of_qcp_f16_arm_add_safety_wit_2 : qcp_f16_arm_add_safety_wit_2.
Axiom proof_of_qcp_f16_arm_add_safety_wit_3 : qcp_f16_arm_add_safety_wit_3.
Axiom proof_of_qcp_f16_arm_add_return_wit_1 : qcp_f16_arm_add_return_wit_1.
Axiom proof_of_qcp_f16_arm_add_return_wit_2 : qcp_f16_arm_add_return_wit_2.
Axiom proof_of_qcp_f16_arm_add_return_wit_3 : qcp_f16_arm_add_return_wit_3.
Axiom proof_of_qcp_f16_arm_add_return_wit_4 : qcp_f16_arm_add_return_wit_4.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_1 : qcp_f16_arm_add_partial_solve_wit_1.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_2 : qcp_f16_arm_add_partial_solve_wit_2.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_3 : qcp_f16_arm_add_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_4 : qcp_f16_arm_add_partial_solve_wit_4.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_5 : qcp_f16_arm_add_partial_solve_wit_5.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_6 : qcp_f16_arm_add_partial_solve_wit_6.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_7 : qcp_f16_arm_add_partial_solve_wit_7.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_8 : qcp_f16_arm_add_partial_solve_wit_8.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_9 : qcp_f16_arm_add_partial_solve_wit_9.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_10 : qcp_f16_arm_add_partial_solve_wit_10.
Axiom proof_of_qcp_f16_arm_add_partial_solve_wit_11 : qcp_f16_arm_add_partial_solve_wit_11.
Axiom proof_of_qcp_f16_arm_sub_safety_wit_1 : qcp_f16_arm_sub_safety_wit_1.
Axiom proof_of_qcp_f16_arm_sub_safety_wit_2 : qcp_f16_arm_sub_safety_wit_2.
Axiom proof_of_qcp_f16_arm_sub_safety_wit_3 : qcp_f16_arm_sub_safety_wit_3.
Axiom proof_of_qcp_f16_arm_sub_return_wit_1 : qcp_f16_arm_sub_return_wit_1.
Axiom proof_of_qcp_f16_arm_sub_return_wit_2 : qcp_f16_arm_sub_return_wit_2.
Axiom proof_of_qcp_f16_arm_sub_return_wit_3 : qcp_f16_arm_sub_return_wit_3.
Axiom proof_of_qcp_f16_arm_sub_return_wit_4 : qcp_f16_arm_sub_return_wit_4.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_1 : qcp_f16_arm_sub_partial_solve_wit_1.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_2 : qcp_f16_arm_sub_partial_solve_wit_2.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_3 : qcp_f16_arm_sub_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_4 : qcp_f16_arm_sub_partial_solve_wit_4.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_5 : qcp_f16_arm_sub_partial_solve_wit_5.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_6 : qcp_f16_arm_sub_partial_solve_wit_6.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_7 : qcp_f16_arm_sub_partial_solve_wit_7.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_8 : qcp_f16_arm_sub_partial_solve_wit_8.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_9 : qcp_f16_arm_sub_partial_solve_wit_9.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_10 : qcp_f16_arm_sub_partial_solve_wit_10.
Axiom proof_of_qcp_f16_arm_sub_partial_solve_wit_11 : qcp_f16_arm_sub_partial_solve_wit_11.
Axiom proof_of_qcp_f16_rvv_add_safety_wit_1 : qcp_f16_rvv_add_safety_wit_1.
Axiom proof_of_qcp_f16_rvv_add_return_wit_1 : qcp_f16_rvv_add_return_wit_1.
Axiom proof_of_qcp_f16_rvv_add_return_wit_2 : qcp_f16_rvv_add_return_wit_2.
Axiom proof_of_qcp_f16_rvv_add_partial_solve_wit_1 : qcp_f16_rvv_add_partial_solve_wit_1.
Axiom proof_of_qcp_f16_rvv_add_partial_solve_wit_2 : qcp_f16_rvv_add_partial_solve_wit_2.
Axiom proof_of_qcp_f16_rvv_add_partial_solve_wit_3 : qcp_f16_rvv_add_partial_solve_wit_3.
Axiom proof_of_qcp_f16_rvv_sub_safety_wit_1 : qcp_f16_rvv_sub_safety_wit_1.
Axiom proof_of_qcp_f16_rvv_sub_return_wit_1 : qcp_f16_rvv_sub_return_wit_1.
Axiom proof_of_qcp_f16_rvv_sub_return_wit_2 : qcp_f16_rvv_sub_return_wit_2.
Axiom proof_of_qcp_f16_rvv_sub_partial_solve_wit_1 : qcp_f16_rvv_sub_partial_solve_wit_1.
Axiom proof_of_qcp_f16_rvv_sub_partial_solve_wit_2 : qcp_f16_rvv_sub_partial_solve_wit_2.
Axiom proof_of_qcp_f16_rvv_sub_partial_solve_wit_3 : qcp_f16_rvv_sub_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_mul_safety_wit_1 : qcp_f16_arm_mul_safety_wit_1.
Axiom proof_of_qcp_f16_arm_mul_safety_wit_2 : qcp_f16_arm_mul_safety_wit_2.
Axiom proof_of_qcp_f16_arm_mul_safety_wit_3 : qcp_f16_arm_mul_safety_wit_3.
Axiom proof_of_qcp_f16_arm_mul_return_wit_1 : qcp_f16_arm_mul_return_wit_1.
Axiom proof_of_qcp_f16_arm_mul_return_wit_2 : qcp_f16_arm_mul_return_wit_2.
Axiom proof_of_qcp_f16_arm_mul_return_wit_3 : qcp_f16_arm_mul_return_wit_3.
Axiom proof_of_qcp_f16_arm_mul_return_wit_4 : qcp_f16_arm_mul_return_wit_4.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_1 : qcp_f16_arm_mul_partial_solve_wit_1.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_2 : qcp_f16_arm_mul_partial_solve_wit_2.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_3 : qcp_f16_arm_mul_partial_solve_wit_3.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_4 : qcp_f16_arm_mul_partial_solve_wit_4.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_5 : qcp_f16_arm_mul_partial_solve_wit_5.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_6 : qcp_f16_arm_mul_partial_solve_wit_6.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_7 : qcp_f16_arm_mul_partial_solve_wit_7.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_8 : qcp_f16_arm_mul_partial_solve_wit_8.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_9 : qcp_f16_arm_mul_partial_solve_wit_9.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_10 : qcp_f16_arm_mul_partial_solve_wit_10.
Axiom proof_of_qcp_f16_arm_mul_partial_solve_wit_11 : qcp_f16_arm_mul_partial_solve_wit_11.
Axiom proof_of_qcp_f16_rvv_mul_safety_wit_1 : qcp_f16_rvv_mul_safety_wit_1.
Axiom proof_of_qcp_f16_rvv_mul_return_wit_1 : qcp_f16_rvv_mul_return_wit_1.
Axiom proof_of_qcp_f16_rvv_mul_return_wit_2 : qcp_f16_rvv_mul_return_wit_2.
Axiom proof_of_qcp_f16_rvv_mul_partial_solve_wit_1 : qcp_f16_rvv_mul_partial_solve_wit_1.
Axiom proof_of_qcp_f16_rvv_mul_partial_solve_wit_2 : qcp_f16_rvv_mul_partial_solve_wit_2.
Axiom proof_of_qcp_f16_rvv_mul_partial_solve_wit_3 : qcp_f16_rvv_mul_partial_solve_wit_3.

End VC_Correct.
