Require Import isla.riscv64.riscv64.
Lemma normalize_lane_bound (vl : bv 64) :
  (bv_swrap 128 0 > bv_unsigned vl - 1)%Z ->
  (Z.of_N 7 < bv_unsigned vl)%Z -> False.
Proof.
  intros H1 H9.
  rewrite (bv_swrap_small 128 0 ltac:(change (-170141183460469231731687303715884105728 <= 0 < 170141183460469231731687303715884105728)%Z; lia)) in H1.
  cbn [Z.of_N] in H9. lia.
Qed.
