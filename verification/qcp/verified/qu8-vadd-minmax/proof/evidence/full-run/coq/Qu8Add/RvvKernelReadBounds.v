From Coq Require Import ZArith Lia List.
From Qu8Add Require Export RvvKernelBounds KernelBounds.
Local Open Scope Z_scope.
Lemma qu_read_lane_range : forall i vl idx L,
 Forall(fun x:Z=>0<=x<=255)L -> 0<=i -> 0<=idx -> idx+vl<=Zlength L ->
 0<=u8_read_lane i vl idx L<=255.
Proof.
 intros i vl idx L HF Hi Hidx HL;unfold u8_read_lane;destruct(Z.ltb_spec i vl).
 - apply(qu_Forall_Znth_range L(idx+i)0 HF);lia.
 - lia.
Qed.
Print Assumptions qu_read_lane_range.
