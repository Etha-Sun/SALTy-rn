(* Arithmetic mapping obligation, NOT a theorem about the whole ISA kernels.
   The 16-bit bound must be established by the NEON loop invariant. *)
From Coq Require Import ZArith Lia.
Open Scope Z_scope.

Definition neon_pair (a x y : Z) := (a + x + y) mod 65536.
Definition rvv_pair (p q x y : Z) :=
  ((p + x) mod 4294967296 + (q + y) mod 4294967296) mod 4294967296.
Definition pair_spec (a x y : Z) := a + x + y.

Lemma neon_meets_spec a x y :
  0 <= a + x + y < 65536 -> neon_pair a x y = pair_spec a x y.
Proof. intros H. unfold neon_pair, pair_spec. apply Z.mod_small; lia. Qed.

Lemma rvv_meets_spec p q x y :
  0 <= p + x -> 0 <= q + y -> p + q + x + y < 65536 ->
  rvv_pair p q x y = pair_spec (p + q) x y.
Proof.
  intros. unfold rvv_pair, pair_spec.
  rewrite (Z.mod_small (p+x) 4294967296) by lia.
  rewrite (Z.mod_small (q+y) 4294967296) by lia.
  rewrite Z.mod_small by lia. lia.
Qed.

(* Route A: a common functional spec. *)
Theorem bridge_via_shared_spec a p q x y :
  a = p + q -> 0 <= p + x -> 0 <= q + y -> a + x + y < 65536 ->
  neon_pair a x y = rvv_pair p q x y.
Proof.
  intros -> Hp Hq Hbound.
  rewrite neon_meets_spec by lia.
  rewrite rvv_meets_spec by lia. reflexivity.
Qed.

(* Route B: prove the relation directly; the same bound is needed. *)
Theorem bridge_direct a p q x y :
  a = p + q -> 0 <= p + x -> 0 <= q + y -> a + x + y < 65536 ->
  neon_pair a x y = rvv_pair p q x y.
Proof.
  intros -> Hp Hq Hbound. unfold neon_pair, rvv_pair.
  rewrite (Z.mod_small (p+x) 4294967296) by lia.
  rewrite (Z.mod_small (q+y) 4294967296) by lia.
  rewrite !Z.mod_small by lia. lia.
Qed.

Example dropping_range_is_wrong :
  neon_pair 65535 1 0 = 0 /\ rvv_pair 65535 0 1 0 = 65536.
Proof. vm_compute; auto. Qed.

Lemma neon_2048_byte_block_bound iterations accumulator x y :
  0 <= iterations < 128 -> 0 <= accumulator <= iterations * 510 ->
  0 <= x <= 255 -> 0 <= y <= 255 ->
  0 <= accumulator + x + y < 65536.
Proof. intros; lia. Qed.

Print Assumptions bridge_via_shared_spec.
Print Assumptions bridge_direct.
Print Assumptions dropping_range_is_wrong.
Print Assumptions neon_2048_byte_block_bound.
