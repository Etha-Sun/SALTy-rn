Require Import isla.riscv64.riscv64.
Require Import RvvLoadSharedDefs RvvLaneMath.

Lemma byte_array_append `{!islaG Σ} (p : Z) (xs ys : list (bv 8)) :
  p ↦ₘ∗ (xs ++ ys) ⊣⊢ p ↦ₘ∗ xs ∗ (p + Z.of_nat (length xs)) ↦ₘ∗ ys.
Proof.
  rewrite !mem_mapsto_array_eq. iSplit.
  - iDestruct 1 as (len Hlen Hrange) "Hmem".
    assert (len = 1)%N by lia. subst len.
    rewrite big_sepL_app. iDestruct "Hmem" as "[Hx Hy]".
    iSplitL "Hx".
    + iExists 1%N. iSplit; [done|]. iSplit; [iPureIntro; rewrite length_app in Hrange; lia|]. iExact "Hx".
    + iExists 1%N. iSplit; [done|]. iSplit; [iPureIntro; rewrite length_app in Hrange; lia|].
      iApply (big_sepL_mono with "Hy"). intros i x Hx.
      replace (p + (Z.of_nat (length xs) + Z.of_nat i) * Z.of_N 1)%Z
        with (p + Z.of_nat (length xs) + Z.of_nat i * Z.of_N 1)%Z by lia.
      Show.

Abort.
