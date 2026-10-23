From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame RvvModel LreluModel LreluActiveModel rvv___riscv_vmerge_vxm_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart2.
Lemma proof_of___riscv_vmerge_vxm_i16m4_safety_wit_2 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_2.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_2;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_safety_wit_11 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_11.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_11;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_safety_wit_20 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_20.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_20;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_safety_wit_29 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_29.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_safety_wit_29;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_3_pure : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_3_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_3_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_7 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_7.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_7, Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_7_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_12_pure : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_12_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_12_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_16 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_16.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_16, Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_16_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_21_pure : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_21_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_21_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_25 : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_25.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_25, Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_25_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vmerge_vxm_i16m4_partial_solve_wit_30_pure : Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_30_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vmerge_vxm_i16m4_goal.__riscv_vmerge_vxm_i16m4_partial_solve_wit_30_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
End CheckedPart2.
