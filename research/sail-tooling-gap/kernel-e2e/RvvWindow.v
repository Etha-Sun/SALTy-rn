Require Import isla.riscv64.riscv64 RvvLoadSharedDefs RvvLaneMath.
Definition window_bytes (xs : list (bv 8)) (i : N) : bv 8 :=
  nth (N.to_nat i) xs (BV 8 0).
Lemma input8_window xs :
  (8 <= length xs)%nat -> input8 (window_bytes xs) = take 8 xs.
Proof.
  intros Hlen.
  do 8 (let x := fresh "byte" in destruct xs as [|x xs]; [cbn [length] in Hlen; lia|]).
  reflexivity.
Qed.
Lemma window_prefix xs padding k :
  (k <= 8)%nat -> (k <= length xs)%nat ->
  (8 <= length (xs ++ padding))%nat ->
  take k (byte_lanes8 (window_bytes (xs ++ padding))) = take k xs.
Proof.
  intros Hk Hxs Hlength.
  change (take k (input8 (window_bytes (xs ++ padding))) = take k xs).
  rewrite (input8_window _ Hlength) take_take Nat.min_l; [|lia].
  rewrite take_app_le; done.
Qed.
Print Assumptions input8_window.
Print Assumptions window_prefix.
