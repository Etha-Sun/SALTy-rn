From Coq Require Import ZArith List Lia.
From SpmmProof Require Export TupleFrame.
From SpmmSpec Require Export FlowFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma spmm_output_cursor_start : forall base stride,
 0<=base<modulus64 -> spmm_output_cursor base 0 stride 0=base.
Proof. intros;unfold spmm_output_cursor,word64;rewrite !Z.mul_0_r,!Z.add_0_r;now apply Z.mod_small. Qed.
Ltac spmm_entry_normalize :=
 spmm_normalize2;rewrite ?sizeof_uint in *;
 rewrite ?spmm_unsigned64 in *;
 spmm_shape_facts;
 try rewrite spmm_output_cursor_start by lia.
Print Assumptions spmm_output_cursor_start.
