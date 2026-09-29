Require Import isla.riscv64.riscv64.
Lemma load_sideconds_zero (p : bv 64) :
 (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
 ((bv_unsigned (p + BV 64 0)%bv - bv_unsigned p) `mod` 1 = 0 /\
 0 <= (bv_unsigned (p + BV 64 0)%bv - bv_unsigned p) `div` 1 /\
 (Z.to_nat ((bv_unsigned (p + BV 64 0)%bv - bv_unsigned p) `div` 1) < 8)%nat)%Z.
Proof. intros Hr. bv_solve. Qed.
Print Assumptions load_sideconds_zero.
