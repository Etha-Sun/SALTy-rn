From Coq Require Import ZArith Lia List.
From Qs8Add Require Export RvvKernelBounds KernelBounds.
Local Open Scope Z_scope.
Lemma qa_read_lane_range : forall i vl idx L,
 Forall(fun x:Z=>-128<=x<=127)L -> 0<=i -> 0<=idx -> idx+vl<=Zlength L ->
 -128<=s8_read_lane i vl idx L<=127.
Proof.
 intros i vl idx L HF Hi Hidx HL;unfold s8_read_lane;destruct(Z.ltb_spec i vl).
 - apply(qa_Forall_Znth_range L(idx+i)0 HF);lia.
 - lia.
Qed.
Print Assumptions qa_read_lane_range.
