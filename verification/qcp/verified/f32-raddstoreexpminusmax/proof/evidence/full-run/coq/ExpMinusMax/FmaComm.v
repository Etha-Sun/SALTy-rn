(* Migrated from DW FmaSwap source SHA256 576e8965281c71057c19d8d7e83f8c171f5ece8ef2716d50fb3153589453b70a. Namespace/definition prefix adapted; ordinary fresh compilation required, no object credit. *)
From Coq Require Import ZArith Bool.
From Flocq.Core Require Import Defs.
From Flocq.Core Require Import Zaux.
From Flocq.Calc Require Import Operations.
From ExpMinusMax Require Export Model.
Local Open Scope Z_scope.
Local Lemma fmult_swap : forall(x y:float radix2),Fmult x y=Fmult y x.
Proof. intros [mx ex][my ey];unfold Fmult;f_equal;[apply Z.mul_comm|apply Z.add_comm]. Qed.
Lemma single_nan_fma_swap : forall
 (a b c:BinarySingleNaN.binary_float 24 128),
 @BinarySingleNaN.Bfma 24 128 eq_refl eq_refl BinarySingleNaN.mode_NE a b c=
 @BinarySingleNaN.Bfma 24 128 eq_refl eq_refl BinarySingleNaN.mode_NE b a c.
Proof.
 intros a b c;destruct a;destruct b;destruct c;
 cbn[BinarySingleNaN.Bfma BinarySingleNaN.Bfma_szero BinarySingleNaN.Bsign];
 try rewrite Bool.xorb_comm;try reflexivity.
 all: try unfold BinarySingleNaN.Bfma_szero;
  cbn[BinarySingleNaN.Bsign];try rewrite Bool.xorb_comm;try reflexivity.
 all: rewrite fmult_swap;reflexivity.
Qed.
Lemma em_rvv_fma_swap : forall c a b,
 em_rvv_fma c a b=em_rvv_fma c b a.
Proof.
 intros c a b;unfold em_rvv_fma,fma_rne,Binary.Bfma.
 rewrite single_nan_fma_swap.
 destruct(@BinarySingleNaN.Bfma 24 128 eq_refl eq_refl BinarySingleNaN.mode_NE
  (@Binary.B2BSN 24 128 b)(@Binary.B2BSN 24 128 a)(@Binary.B2BSN 24 128 c));
 cbn[Binary.BSN2B em_canonicalize em_nan fp32_unary_nan];reflexivity.
Qed.
Print Assumptions single_nan_fma_swap.
Print Assumptions em_rvv_fma_swap.
