From Coq Require Import ZArith Lia Lra Reals SpecFloat.
From Flocq.Core Require Import Core.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary.
From ExpMinusMax Require Import Constants LiteralFacts.
Local Open Scope R_scope.
Lemma em_zero_literal:fp32_of_real 0=fp32_zero.
Proof.
 assert(Hround:rounded32 mode_NE 0=0).
 { unfold rounded32;apply round_0;apply valid_rnd_round_mode. }
 unfold fp32_of_real;rewrite Hround;cbv zeta.
 unfold scaled_mantissa;rewrite Rmult_0_l,Ztrunc_IZR.
 rewrite Rlt_bool_false by lra;reflexivity.
Qed.
Print Assumptions em_zero_literal.
