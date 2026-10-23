From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame RvvModel rvv___riscv_vrsub_vx_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart5.
Lemma proof_of___riscv_vrsub_vx_i16m4_safety_wit_5 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_5.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_5;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_safety_wit_14 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_14.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_14;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_safety_wit_23 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_23.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_23;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_safety_wit_32 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_32.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_safety_wit_32;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_4 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_4.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_4, Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_4_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_9_pure : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_9_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_9_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_13 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_13.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_13, Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_13_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_18_pure : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_18_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_18_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_22 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_22.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_22, Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_22_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_27_pure : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_27_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_27_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vrsub_vx_i16m4_partial_solve_wit_31 : Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_31.
Proof. unfold Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_31, Qs8Lrelu.rvv___riscv_vrsub_vx_i16m4_goal.__riscv_vrsub_vx_i16m4_partial_solve_wit_31_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
End CheckedPart5.
