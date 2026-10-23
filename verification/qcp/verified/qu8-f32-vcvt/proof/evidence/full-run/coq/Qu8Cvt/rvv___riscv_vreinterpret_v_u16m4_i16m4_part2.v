From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart2.
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_1_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_1_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_4_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_4_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_4_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_7_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_7_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_7_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_10_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_10_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_10_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_13_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_13_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_13_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_16_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_16_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_16_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_19_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_19_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_19_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_22_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_22_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_22_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_25_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_25_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_25_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_28_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_28_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_28_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_31_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_31_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_31_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
