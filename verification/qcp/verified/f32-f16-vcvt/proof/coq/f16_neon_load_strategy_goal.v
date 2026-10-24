Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import F32F16.Types.
Require Import F32F16.UShortStoreModel.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import F32F16.ProgramModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition f16_neon_load_strategy1 :=
  forall (lo : Z) (hi : Z) (q : Z) (p : Z) (l : (@list fp32)),
    TT &&
    (“ (q = (Z.add p (Z.mul lo (@sizeof_front_end_type FET_float)))) ”) &&
    (“ (Z.le 0 lo) ”) &&
    (“ (Z.le (Z.add lo 4) hi) ”) &&
    emp **
    ((FloatArray.seg p lo hi l))
    |--
    (
    TT &&
    emp **
    ((FloatArray.seg p (Z.add lo 4) hi ( fp32_slice 4 (Z.sub hi lo) l)))
    ) ** (
    ALL (x3 : fp32) (__default_fp32 : fp32) (x1 : fp32) (x0 : fp32) (x2 : fp32),
      TT &&
      (“ (x0 = (Znth 0 l __default_fp32)) ”) &&
      (“ (x1 = (Znth 1 l __default_fp32)) ”) &&
      (“ (x2 = (Znth 2 l __default_fp32)) ”) &&
      (“ (x3 = (Znth 3 l __default_fp32)) ”) &&
      emp -*
      TT &&
      emp **
      ((store_float (Z.add q (Z.mul 0 (@sizeof_front_end_type FET_float))) x0)) **
      ((store_float (Z.add q (Z.mul 1 (@sizeof_front_end_type FET_float))) x1)) **
      ((store_float (Z.add q (Z.mul 2 (@sizeof_front_end_type FET_float))) x2)) **
      ((store_float (Z.add q (Z.mul 3 (@sizeof_front_end_type FET_float))) x3))
      ).

Module Type f16_neon_load_Strategy_Correct.

  Axiom f16_neon_load_strategy1_correctness : f16_neon_load_strategy1.

End f16_neon_load_Strategy_Correct.
