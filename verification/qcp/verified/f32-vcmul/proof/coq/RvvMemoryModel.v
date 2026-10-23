From Coq Require Import ZArith Lia List Reals.
From VCMul Require Export Model.
From QcpVadd Require Export VaddBits.
Local Open Scope Z_scope.
Definition vcmul_read_lane_model (i vl idx:Z)(xs:list fp32) : fp32 :=
 if Z.ltb i vl then Znth (idx+i) xs fp32_zero else fp32_zero.
Definition vcmul_vl16 (n:Z) : Z := Z.min n 16.
Lemma vcmul_read_active : forall i vl idx xs d,
  i<vl -> 0<=idx+i<Zlength xs ->
  same_fp32 (Znth (idx+i) xs d) (vcmul_read_lane_model i vl idx xs).
Proof.
 intros i vl idx xs d Hi Hrange. unfold same_fp32,vcmul_read_lane_model.
 destruct (Z.ltb_spec i vl); [apply Znth_indep; exact Hrange|lia].
Qed.
Lemma vcmul_read_inactive : forall i vl idx xs,
 vl<=i -> same_fp32 (fp32_of_real (0.0%R)) (vcmul_read_lane_model i vl idx xs).
Proof.
 intros i vl idx xs Hi. unfold same_fp32,vcmul_read_lane_model.
 destruct (Z.ltb_spec i vl); [lia|apply vcmul_c_zero].
Qed.
