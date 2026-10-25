From Coq Require Import ZArith Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From Flocq.Calc Require Import Operations.
From GemmSpec Require Import FmaModel.

(** The migrated chosen-value model canonicalizes NaNs. This equality does
    not assert physical NaN-payload equality between ARM and RISC-V. *)
Lemma single_nan_fma_swap : forall m (x y z:BinarySingleNaN.binary_float 24 128),
 @BinarySingleNaN.Bfma 24 128 eq_refl eq_refl m x y z =
 @BinarySingleNaN.Bfma 24 128 eq_refl eq_refl m y x z.
Proof.
 intros m x y z.
 assert (Hs: BinarySingleNaN.Bfma_szero 24 128 m x y z =
             BinarySingleNaN.Bfma_szero 24 128 m y x z).
 { unfold BinarySingleNaN.Bfma_szero;now rewrite xorb_comm. }
 unfold BinarySingleNaN.Bfma;rewrite <- Hs.
 destruct x,y;try reflexivity;
 try (rewrite xorb_comm;reflexivity).
 destruct z;try reflexivity;
 unfold Operations.Fmult;cbn;
 rewrite (Z.mul_comm (SpecFloat.cond_Zopp _ _) (SpecFloat.cond_Zopp _ _)),
         (Z.add_comm _ _);reflexivity.
Qed.
Theorem fma_multiplicands_swap : forall x y z,
 fma_rne x y z = fma_rne y x z.
Proof.
 intros;unfold fma_rne,Binary.Bfma.
 rewrite single_nan_fma_swap;reflexivity.
Qed.
Print Assumptions single_nan_fma_swap.
Print Assumptions fma_multiplicands_swap.
