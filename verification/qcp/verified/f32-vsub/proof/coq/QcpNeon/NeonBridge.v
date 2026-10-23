Require Import Coq.ZArith.ZArith Coq.Lists.List Coq.Strings.String Coq.micromega.Psatz.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_ .
Definition UndefStructPredfloat32x2_t (p:Z) : Assertion :=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_ .

Lemma float_full_open4 : forall p n (l:list fp32) d,
  4 <= n -> FloatArray.full p n l |--
    (p+0*sizeof(FLOAT)) # Float |-> (Znth 0 l d) **
    (p+1*sizeof(FLOAT)) # Float |-> (Znth 1 l d) **
    (p+2*sizeof(FLOAT)) # Float |-> (Znth 2 l d) **
    (p+3*sizeof(FLOAT)) # Float |-> (Znth 3 l d) **
    FloatArray.seg p 4 n (sublist 4 n l).
Proof.
  intros p n l d Hge.
  prop_apply (FloatArray.full_Zlength p n l). Intros_p Hlen.
  destruct l as [|a0 l]; [rewrite Zlength_nil in Hlen; lia|].
  rewrite Zlength_cons in Hlen.
  destruct l as [|a1 l]; [rewrite Zlength_nil in Hlen; lia|].
  rewrite Zlength_cons in Hlen.
  destruct l as [|a2 l]; [rewrite Zlength_nil in Hlen; lia|].
  rewrite Zlength_cons in Hlen.
  destruct l as [|a3 l]; [rewrite Zlength_nil in Hlen; lia|].
  rewrite Zlength_cons in Hlen.
  repeat rewrite sublist_cons2 by (repeat rewrite Zlength_cons; lia).
  replace (4-1-1-1-1) with 0 by lia.
  rewrite sublist_self by lia.
  unfold FloatArray.full, FloatArray.seg, store_array.
  simpl store_array_rec.
  unfold StoreFloatAsElement.storeA.
  cbn [Znth Z.to_nat List.nth].
  entailer!.
Qed.
Print Assumptions float_full_open4.
Definition fp32_slice : Z -> Z -> list fp32 -> list fp32 := @sublist fp32.
Lemma byte_batch_readable4 : forall batch,
  0 < batch -> Z.rem batch 4 = 0 -> 4 <= Z.quot batch 4 + 3.
Proof.
  intros batch Hpos Hrem.
  assert (Hge:4 <= batch).
  { destruct (Z_lt_ge_dec batch 4); [rewrite Z.rem_small in Hrem by lia; lia|lia]. }
  rewrite Z.quot_div_nonneg by lia.
  assert (1 <= batch / 4) by (apply Z.div_le_lower_bound; lia).
  lia.
Qed.
Lemma float_undef_open4 : forall p n,
  4 <= n -> FloatArray.undef_full p n |--
    (p+0*sizeof(FLOAT)) # Float |->_ **
    (p+1*sizeof(FLOAT)) # Float |->_ **
    (p+2*sizeof(FLOAT)) # Float |->_ **
    (p+3*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg p 4 n.
Proof.
  intros p n Hge.
  sep_apply_l_atomic (FloatArray.undef_full_split_to_undef_seg p 4 n).
  - dump_pre_spatial. lia.
  - unfold FloatArray.undef_seg at 1. simpl.
    unfold StoreFloatAsElement.undefstoreA. entailer!.
Qed.
Print Assumptions byte_batch_readable4.
Print Assumptions float_undef_open4.
Lemma byte_batch_writable4 : forall batch,
  0 <= batch -> batch < 16 \/ 4 <= Z.quot batch 4.
Proof.
  intros batch Hnonneg.
  destruct (Z_lt_ge_dec batch 16); [auto|right].
  rewrite Z.quot_div_nonneg by lia.
  apply Z.div_le_lower_bound; lia.
Qed.
Print Assumptions byte_batch_writable4.
