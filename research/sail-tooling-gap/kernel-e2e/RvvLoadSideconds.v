Require Import isla.riscv64.riscv64.
Lemma load_address_offset (p : bv 64) (k : Z) :
 (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
 (0 <= k < 8)%Z ->
 bv_unsigned (bv_add p (Z_to_bv 64 k)) = (bv_unsigned p + k)%Z.
Proof. intros Hr Hk. bv_solve. Qed.
Lemma load_array_index (p : bv 64) (k : Z) :
 (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
 (0 <= k < 8)%Z ->
 ((bv_unsigned (bv_add p (Z_to_bv 64 k)) - bv_unsigned p) `mod` 1 = 0 /\
 0 <= (bv_unsigned (bv_add p (Z_to_bv 64 k)) - bv_unsigned p) `div` 1 /\
 (Z.to_nat ((bv_unsigned (bv_add p (Z_to_bv 64 k)) - bv_unsigned p) `div` 1) < 8)%nat)%Z.
Proof. intros Hr Hk. rewrite (load_address_offset p k Hr Hk).
 replace (bv_unsigned p + k - bv_unsigned p)%Z with k by lia.
 rewrite Z.div_1_r Z.mod_1_r. repeat split; lia.
Qed.
Print Assumptions load_array_index.
