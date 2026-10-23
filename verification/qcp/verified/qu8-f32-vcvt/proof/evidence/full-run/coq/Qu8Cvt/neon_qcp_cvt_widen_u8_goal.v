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
Require Import Qu8Cvt.Model.
Require Import Qu8Cvt.Types.
Require Import Qu8Cvt.UnsignedModel.
Local Open Scope sac.

(*----- Function qcp_cvt_widen_u8 -----*)

Definition qcp_cvt_widen_u8_return_wit_1 := 
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))))
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (cvt_addw (a0) (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (cvt_addw (a1) (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (cvt_addw (a2) (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (cvt_addw (a3) (b3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (cvt_addw (a4) (b4)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (cvt_addw (a5) (b5)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (cvt_addw (a6) (b6)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (cvt_addw (a7) (b7)))
) \/
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  TT && emp 
|--
  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))) = (cvt_addw (a7) (b7))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))) = (cvt_addw (a6) (b6))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))) = (cvt_addw (a5) (b5))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))) = (cvt_addw (a4) (b4))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))) = (cvt_addw (a3) (b3))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))) = (cvt_addw (a2) (b2))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))) = (cvt_addw (a1) (b1))) ” 
  &&  “ ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))) = (cvt_addw (a0) (b0))) ”
  &&  emp
).

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))) = (cvt_addw (a7) (b7)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_2 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))) = (cvt_addw (a6) (b6)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_3 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))) = (cvt_addw (a5) (b5)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_4 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))) = (cvt_addw (a4) (b4)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_5 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))) = (cvt_addw (a3) (b3)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_6 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))) = (cvt_addw (a2) (b2)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_7 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))) = (cvt_addw (a1) (b1)))
.

Definition qcp_cvt_widen_u8_return_wit_1_split_goal_8 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))) = (cvt_addw (a0) (b0)))
.

Definition qcp_cvt_widen_u8_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "ua" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "ua" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  (UndefStructPreduint16x8_t ( &( "ua" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition qcp_cvt_widen_u8_partial_solve_wit_1 := qcp_cvt_widen_u8_partial_solve_wit_1_pure -> qcp_cvt_widen_u8_partial_solve_wit_1_aux.

Definition qcp_cvt_widen_u8_partial_solve_wit_2 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((&((retval)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  (UndefStructPreduint16x8_t ( &( "ua" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure := 
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ” 
  &&  “ ((cvt_u16 (a7)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a7))) ” 
  &&  “ ((cvt_u16 (a6)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a6))) ” 
  &&  “ ((cvt_u16 (a5)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a5))) ” 
  &&  “ ((cvt_u16 (a4)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a4))) ” 
  &&  “ ((cvt_u16 (a3)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a3))) ” 
  &&  “ ((cvt_u16 (a2)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a2))) ” 
  &&  “ ((cvt_u16 (a1)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a1))) ” 
  &&  “ ((cvt_u16 (a0)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a0))) ”
) \/
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a0))) ” 
  &&  “ ((cvt_u16 (a0)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a1))) ” 
  &&  “ ((cvt_u16 (a1)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a2))) ” 
  &&  “ ((cvt_u16 (a2)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a3))) ” 
  &&  “ ((cvt_u16 (a3)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a4))) ” 
  &&  “ ((cvt_u16 (a4)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a5))) ” 
  &&  “ ((cvt_u16 (a5)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a6))) ” 
  &&  “ ((cvt_u16 (a6)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a7))) ” 
  &&  “ ((cvt_u16 (a7)) <= 65535) ”
).

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a0))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_2 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a0)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_3 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a1))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_4 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a1)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_5 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a2))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_6 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a2)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_7 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a3))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_8 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a3)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a4))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_10 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a4)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_11 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a5))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_12 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a5)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_13 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a6))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_14 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a6)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_15 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= (cvt_u16 (a7))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_pure_split_goal_16 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((cvt_u16 (a7)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ” 
  &&  “ ((cvt_u16 (a7)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a7))) ” 
  &&  “ ((cvt_u16 (a6)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a6))) ” 
  &&  “ ((cvt_u16 (a5)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a5))) ” 
  &&  “ ((cvt_u16 (a4)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a4))) ” 
  &&  “ ((cvt_u16 (a3)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a3))) ” 
  &&  “ ((cvt_u16 (a2)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a2))) ” 
  &&  “ ((cvt_u16 (a1)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a1))) ” 
  &&  “ ((cvt_u16 (a0)) <= 65535) ” 
  &&  “ (0 <= (cvt_u16 (a0))) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition qcp_cvt_widen_u8_partial_solve_wit_3 := qcp_cvt_widen_u8_partial_solve_wit_3_pure -> qcp_cvt_widen_u8_partial_solve_wit_3_aux.

Definition qcp_cvt_widen_u8_partial_solve_wit_4 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((&((retval)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  (UndefStructPreduint16x8_t ( &( "sum" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |->_)
  **  ((&((retval)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure := 
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a7))) (b7)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a7))) (b7))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a6))) (b6)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a6))) (b6))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a5))) (b5)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a5))) (b5))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a4))) (b4)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a4))) (b4))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a3))) (b3)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a3))) (b3))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a2))) (b2)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a2))) (b2))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a1))) (b1)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a1))) (b1))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a0))) (b0)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a0))) (b0))) ”
) \/
(
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a0))) (b0))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a0))) (b0)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a1))) (b1))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a1))) (b1)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a2))) (b2))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a2))) (b2)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a3))) (b3))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a3))) (b3)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a4))) (b4))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a4))) (b4)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a5))) (b5))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a5))) (b5)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a6))) (b6))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a6))) (b6)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a7))) (b7))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a7))) (b7)) <= 65535) ”
).

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a0))) (b0))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_2 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a0))) (b0)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_3 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a1))) (b1))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_4 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a1))) (b1)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_5 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a2))) (b2))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_6 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a2))) (b2)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_7 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a3))) (b3))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_8 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a3))) (b3)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a4))) (b4))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_10 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a4))) (b4)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_11 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a5))) (b5))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_12 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a5))) (b5)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_13 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a6))) (b6))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_14 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a6))) (b6)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_15 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= (cvt_add_u16 ((cvt_u16 (a7))) (b7))) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_pure_split_goal_16 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a7))) (b7)) <= 65535) ”
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ ((cvt_add_u16 ((cvt_u16 (a7))) (b7)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a7))) (b7))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a6))) (b6)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a6))) (b6))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a5))) (b5)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a5))) (b5))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a4))) (b4)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a4))) (b4))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a3))) (b3)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a3))) (b3))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a2))) (b2)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a2))) (b2))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a1))) (b1)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a1))) (b1))) ” 
  &&  “ ((cvt_add_u16 ((cvt_u16 (a0))) (b0)) <= 65535) ” 
  &&  “ (0 <= (cvt_add_u16 ((cvt_u16 (a0))) (b0))) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
  **  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition qcp_cvt_widen_u8_partial_solve_wit_5 := qcp_cvt_widen_u8_partial_solve_wit_5_pure -> qcp_cvt_widen_u8_partial_solve_wit_5_aux.

Definition qcp_cvt_widen_u8_partial_solve_wit_6 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  ((&((retval)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))))
  **  (UndefStructPredint16x8_t ( &( "result" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "result" ) )->ₛ "s7")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))))
  **  ((&(( &( "result" ) )->ₛ "s6")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))))
  **  ((&(( &( "result" ) )->ₛ "s5")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))))
  **  ((&(( &( "result" ) )->ₛ "s4")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))))
  **  ((&(( &( "result" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))))
  **  ((&(( &( "result" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))))
  **  ((&(( &( "result" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))))
  **  ((&(( &( "result" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
.

Definition qcp_cvt_widen_u8_partial_solve_wit_7 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "result" ) )->ₛ "s7")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))))
  **  ((&(( &( "result" ) )->ₛ "s6")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))))
  **  ((&(( &( "result" ) )->ₛ "s5")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))))
  **  ((&(( &( "result" ) )->ₛ "s4")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))))
  **  ((&(( &( "result" ) )->ₛ "s3")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))))
  **  ((&(( &( "result" ) )->ₛ "s2")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))))
  **  ((&(( &( "result" ) )->ₛ "s1")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))))
  **  ((&(( &( "result" ) )->ₛ "s0")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s7")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a7))) (b7)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s6")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a6))) (b6)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s5")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a5))) (b5)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s4")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a4))) (b4)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s3")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a3))) (b3)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s2")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a2))) (b2)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s1")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a1))) (b1)))))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "result" ) )->ₛ "s0")) # Short  |-> (cvt_s16 ((cvt_add_u16 ((cvt_u16 (a0))) (b0)))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "ua" ) )->ₛ "s0")) # UShort  |-> (cvt_u16 (a0)))
  **  ((&(( &( "ua" ) )->ₛ "s1")) # UShort  |-> (cvt_u16 (a1)))
  **  ((&(( &( "ua" ) )->ₛ "s2")) # UShort  |-> (cvt_u16 (a2)))
  **  ((&(( &( "ua" ) )->ₛ "s3")) # UShort  |-> (cvt_u16 (a3)))
  **  ((&(( &( "ua" ) )->ₛ "s4")) # UShort  |-> (cvt_u16 (a4)))
  **  ((&(( &( "ua" ) )->ₛ "s5")) # UShort  |-> (cvt_u16 (a5)))
  **  ((&(( &( "ua" ) )->ₛ "s6")) # UShort  |-> (cvt_u16 (a6)))
  **  ((&(( &( "ua" ) )->ₛ "s7")) # UShort  |-> (cvt_u16 (a7)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
  **  ((&(( &( "sum" ) )->ₛ "s0")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a0))) (b0)))
  **  ((&(( &( "sum" ) )->ₛ "s1")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a1))) (b1)))
  **  ((&(( &( "sum" ) )->ₛ "s2")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a2))) (b2)))
  **  ((&(( &( "sum" ) )->ₛ "s3")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a3))) (b3)))
  **  ((&(( &( "sum" ) )->ₛ "s4")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a4))) (b4)))
  **  ((&(( &( "sum" ) )->ₛ "s5")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a5))) (b5)))
  **  ((&(( &( "sum" ) )->ₛ "s6")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a6))) (b6)))
  **  ((&(( &( "sum" ) )->ₛ "s7")) # UShort  |-> (cvt_add_u16 ((cvt_u16 (a7))) (b7)))
.

Module Type VC_Correct.


Axiom proof_of_qcp_cvt_widen_u8_return_wit_1 : qcp_cvt_widen_u8_return_wit_1.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_1_pure : qcp_cvt_widen_u8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_1 : qcp_cvt_widen_u8_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_2 : qcp_cvt_widen_u8_partial_solve_wit_2.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_3_pure : qcp_cvt_widen_u8_partial_solve_wit_3_pure.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_3 : qcp_cvt_widen_u8_partial_solve_wit_3.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_4 : qcp_cvt_widen_u8_partial_solve_wit_4.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_5_pure : qcp_cvt_widen_u8_partial_solve_wit_5_pure.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_5 : qcp_cvt_widen_u8_partial_solve_wit_5.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_6 : qcp_cvt_widen_u8_partial_solve_wit_6.
Axiom proof_of_qcp_cvt_widen_u8_partial_solve_wit_7 : qcp_cvt_widen_u8_partial_solve_wit_7.

End VC_Correct.
