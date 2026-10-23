From Coq Require Import ZArith Lia.
From Qs8I8Cvt Require Import Types NeonFrame RvvModel rvv___riscv_vsadd_vx_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart3.
Lemma proof_of___riscv_vsadd_vx_i16m4_safety_wit_3 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_3.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_3;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_safety_wit_12 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_12.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_12;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_safety_wit_21 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_21.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_21;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_safety_wit_30 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_30.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_safety_wit_30;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_3 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_3.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_3, Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_3_aux;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_8_pure : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_8_pure.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_8_pure;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_12 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_12.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_12, Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_12_aux;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_17_pure : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_17_pure.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_17_pure;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_21 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_21.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_21, Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_21_aux;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_26_pure : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_26_pure.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_26_pure;try left;intros;
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
Lemma proof_of___riscv_vsadd_vx_i16m4_partial_solve_wit_30 : Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_30.
Proof. unfold Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_30, Qs8I8Cvt.rvv___riscv_vsadd_vx_i16m4_goal.__riscv_vsadd_vx_i16m4_partial_solve_wit_30_aux;try left;intros;
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
End CheckedPart3.
