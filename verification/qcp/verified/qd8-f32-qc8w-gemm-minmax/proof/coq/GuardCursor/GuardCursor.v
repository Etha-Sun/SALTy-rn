From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Public Require Import CandidateLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.

Lemma current_loaded_pointer_range : forall (N K a wb c p k w:Z) (Ps:list panel_data),
  domain_shape 1 N K Ps -> data_capacity N K a wb c ->
  0<=p -> p<Zlength Ps -> 0<=k<=K ->
  w=wb+p*(96+8*K)+32+8*(K-k) ->
  0<=w+64<=UINT64_MAX.
Proof.
 intros N K a wb c p k w Ps Hshape Hcapacity Hp Hplen Hk Hw.
 unfold domain_shape in Hshape;destruct Hshape as (_&HN&HK&Hlength&Hwf).
 unfold data_capacity in Hcapacity;destruct Hcapacity as (Ha&Hwb&Hc&Halign&Haend&Hwend&Hcend).
 unfold panel_bytes in Hwend;rewrite Hlength in Hplen.
 nia.
Qed.

Lemma uintptr_cast_identity : forall x:Z,
  0<=x<=UINT64_MAX -> unsigned_last_nbits x 64=x.
Proof.
 intros x Hrange;apply unsigned_last_nbits_eq.
 change (0<=x<18446744073709551616).
 change (0<=x<=18446744073709551615) in Hrange;lia.
Qed.

Lemma guard_after_cursor_cast : forall x:Z,
  0<=x<=UINT64_MAX -> unsigned_last_nbits x 64<=UINT64_MAX-448 ->
  0<=x+448<=UINT64_MAX.
Proof. intros x Hr Hg;rewrite uintptr_cast_identity in Hg by exact Hr;lia. Qed.
Print Assumptions current_loaded_pointer_range.
Print Assumptions uintptr_cast_identity.
Print Assumptions guard_after_cursor_cast.
