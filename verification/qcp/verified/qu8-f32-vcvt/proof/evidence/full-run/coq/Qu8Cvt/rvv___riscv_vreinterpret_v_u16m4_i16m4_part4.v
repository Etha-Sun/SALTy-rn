From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart4.
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_2_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_2_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_2_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_5_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_5_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_5_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_8_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_8_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_8_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_11_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_11_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_11_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_14_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_14_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_14_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_17_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_17_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_17_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_20_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_20_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_20_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_23_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_23_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_23_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_26_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_26_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_26_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_29_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_29_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_29_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_32_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_32_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_32_pure;try left;intros;
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
End CheckedPart4.
