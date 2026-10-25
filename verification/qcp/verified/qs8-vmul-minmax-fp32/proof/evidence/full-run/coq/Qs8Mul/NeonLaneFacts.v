From Coq Require Import ZArith.
From Qs8Mul Require Export IntrinsicModel ProgramModel.
Local Open Scope Z_scope.
(* Pure numeric folding grants no memory read permission. *)
Lemma qm_neon_fold : forall a b az bz scale oz lo hi,
 qm_min(qm_max(qm_sat8(qm_sat16(qm_sat32(qm_signed_bits(bits_of_fp32(qm_arm_add(qm_arm_mul(qm_of_int((a-az)*(b-bz)))scale)qm_magic))-(1262485504-oz)))))lo)hi =
 qm_neon_lane a b az bz scale oz lo hi.
Proof. reflexivity. Qed.
Print Assumptions qm_neon_fold.
