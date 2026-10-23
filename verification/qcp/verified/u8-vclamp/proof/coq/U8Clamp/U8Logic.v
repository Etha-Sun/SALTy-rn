From Coq Require Import ZArith Lia List.
Open Scope Z_scope.
Definition u8_min : Z -> Z -> Z := Z.min.
Definition u8_max : Z -> Z -> Z := Z.max.
Definition u8_bound (x:Z) := x mod 256.
Definition u8_vl (n:Z) := Z.min n 128.
Definition u8_prefix (x lo hi:Z) := Z.min (Z.max x lo) hi.
Definition u8_suffix (x lo hi:Z) := Z.max (Z.min x hi) lo.
Definition u8_result (n i x lo hi:Z) :=
 if Z.ltb i (n / 64 * 64) then u8_prefix x lo hi else u8_suffix x lo hi.
Lemma u8_reversed_phase: u8_prefix 123 200 20 = 20 /\ u8_suffix 123 200 20 = 200.
Proof. vm_compute;auto. Qed.
Lemma u8_bounds_modulo: forall x, 0 <= u8_bound x < 256.
Proof. intro;unfold u8_bound;apply Z.mod_pos_bound;lia. Qed.
Lemma u8_vl_positive: forall n,0<n -> 0<u8_vl n<=128 /\ u8_vl n<=n.
Proof. unfold u8_vl;intros;destruct(Z_le_gt_dec n 128);[rewrite Z.min_l by lia|rewrite Z.min_r by lia];lia. Qed.
Lemma u8_phase_split: forall n, 0<=n ->
  0 <= n / 64 * 64 <= n /\ 0 <= n - n / 64 * 64 < 64.
Proof. intros;pose proof(Z.mod_pos_bound n 64 ltac:(lia));pose proof(Z.div_mod n 64 ltac:(lia));lia. Qed.
Lemma u8_full_prefix_chunk: forall n rest,
  0<=n -> rest=n/64*64 -> rest>0 ->
  0<u8_vl rest<=128 /\ u8_vl rest<=rest /\ u8_vl rest mod 64=0.
Proof.
 intros n rest Hn Hr Hpos. pose proof(u8_vl_positive rest ltac:(lia)) as [Ha Hb].
 split;[exact Ha|]. split;[exact Hb|]. unfold u8_vl.
 destruct(Z_le_gt_dec rest 128).
 - rewrite Z.min_l by lia. subst rest. rewrite Z.mul_mod by lia. rewrite Z.mod_same by lia. rewrite Z.mul_0_r. reflexivity.
 - rewrite Z.min_r by lia. reflexivity.
Qed.
Print Assumptions u8_phase_split.
Print Assumptions u8_full_prefix_chunk.

Definition u8_max_list (x:Z) (ys:list Z) := List.map (fun y => u8_max y x) ys.
Definition u8_min_list (x:Z) (ys:list Z) := List.map (fun y => u8_min y x) ys.
