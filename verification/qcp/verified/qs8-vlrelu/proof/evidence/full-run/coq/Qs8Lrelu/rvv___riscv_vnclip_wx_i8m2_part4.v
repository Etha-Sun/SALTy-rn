From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame RvvModel rvv___riscv_vnclip_wx_i8m2_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart4.
Lemma proof_of___riscv_vnclip_wx_i8m2_safety_wit_4 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_4.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_4;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_safety_wit_13 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_13.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_13;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_safety_wit_22 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_22.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_22;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_safety_wit_31 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_31.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_safety_wit_31;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_4_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_4_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_4_pure;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_8 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_8.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_8, Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_8_aux;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_13_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_13_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_13_pure;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_17 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_17.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_17, Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_17_aux;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_22_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_22_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_22_pure;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_26 : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_26.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_26, Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_26_aux;try left;intros;
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
Lemma proof_of___riscv_vnclip_wx_i8m2_partial_solve_wit_31_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_31_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i8m2_goal.__riscv_vnclip_wx_i8m2_partial_solve_wit_31_pure;try left;intros;
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
End CheckedPart4.
