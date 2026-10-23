Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeon Require Export NeonBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma float_undef_open2 : forall p n,
  2 <= n -> FloatArray.undef_full p n |--
    (p+0*sizeof(FLOAT)) # Float |->_ **
    (p+1*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg p 2 n.
Proof.
  intros p n Hge.
  sep_apply_l_atomic (FloatArray.undef_full_split_to_undef_seg p 2 n).
  - dump_pre_spatial. lia.
  - unfold FloatArray.undef_seg at 1. simpl.
    unfold StoreFloatAsElement.undefstoreA. entailer!.
Qed.
Lemma float_undef_open1 : forall p n,
  1 <= n -> FloatArray.undef_full p n |--
    (p+0*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg p 1 n.
Proof.
  intros p n Hge.
  sep_apply_l_atomic (FloatArray.undef_full_split_to_undef_seg p 1 n).
  - dump_pre_spatial. lia.
  - unfold FloatArray.undef_seg at 1. simpl.
    unfold StoreFloatAsElement.undefstoreA. entailer!.
Qed.
Print Assumptions float_undef_open2.
Print Assumptions float_undef_open1.
Lemma byte_batch_tail_cases : forall batch,
  0 <= batch -> Z.rem batch 4 = 0 ->
  batch = 0 \/ batch = 4 \/ batch = 8 \/ batch = 12 \/ 16 <= batch.
Proof.
  intros batch Hnonneg Hrem.
  pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
  rewrite Hrem in Hqr.
  assert (Hq:0 <= Z.quot batch 4).
  { rewrite Z.quot_div_nonneg by lia. apply Z.div_pos; lia. }
  lia.
Qed.
Print Assumptions byte_batch_tail_cases.
