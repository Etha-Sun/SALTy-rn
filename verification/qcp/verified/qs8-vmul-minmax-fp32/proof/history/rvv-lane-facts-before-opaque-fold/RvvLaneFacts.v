From Coq Require Import ZArith Lia.
From Qs8Mul Require Export IntrinsicModel ProgramModel ScalarBitsFacts.
Local Open Scope Z_scope.
(* Pure bit-exact folding only. These lemmas grant no read/write permissions,
   impose no finite/positive scale condition, and do not constrain inactive lanes. *)
Lemma qm_rvv_fold_no_nan : forall a b az bz scale oz lo hi,
 qm_ne scale scale=0 ->
 qm_min(qm_max(qm_sat8(qm_sat16(qm_sat32(qm_signed_bits(bits_of_fp32(qm_rvv_add(qm_rvv_mul(qm_of_int((a-az)*(b-bz)))scale)qm_magic))-(1262485504-oz)))))lo)hi =
 qm_rvv_lane a b az bz scale oz lo hi.
Proof. intros;unfold qm_rvv_lane;rewrite H;reflexivity. Qed.
Lemma qm_rvv_fold_nan : forall a b az bz scale oz lo hi,
 qm_ne scale scale<>0 ->
 qm_min(qm_max(qm_sat8(qm_sat16(qm_sat32(qm_signed_bits(bits_of_fp32(qm_sign(qm_rvv_add(qm_rvv_mul(qm_of_int((a-az)*(b-bz)))scale)qm_magic)scale))-(1262485504-oz)))))lo)hi =
 qm_rvv_lane a b az bz scale oz lo hi.
Proof.
 intros;unfold qm_rvv_lane.
 assert(E:Z.eqb(qm_ne scale scale)0=false)by(apply Z.eqb_neq;assumption).
 rewrite E;reflexivity.
Qed.
Lemma qm_rvv_at_neon : forall M pa pb az bz scale oz lo hi i,
 -32768<=oz<=32767 ->
 qm_rvv_at M pa pb az bz scale oz lo hi i=qm_lane M pa pb az bz scale oz lo hi i.
Proof. intros;unfold qm_rvv_at,qm_lane;symmetry;apply qm_pointwise_equivalence;assumption. Qed.
Print Assumptions qm_rvv_fold_no_nan.
Print Assumptions qm_rvv_fold_nan.
Print Assumptions qm_rvv_at_neon.
