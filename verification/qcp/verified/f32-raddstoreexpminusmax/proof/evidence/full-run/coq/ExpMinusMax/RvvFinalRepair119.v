From Coq Require Import ZArith Lia List.
From ExpMinusMax Require Import RvvTactics RvvMemoryFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque em_rvv_reint_i_f em_rvv_reint_f_i em_rvv_mac_vv_p em_rvv_mac_vf_p em_rvv_mad_vf_p em_rvv_sub_p em_rvv_dup_p em_rvv_shift_p em_rvv_load_p em_rvv_slide_p em_rvv_acc_prefix em_rvv_output_prefix em_c1 em_c2 em_c3 em_c4 em_c5 em_magic_bias em_log2e em_minus_ln2.
Local Opaque StructPredvfloat32m4_t UndefStructPredvfloat32m4_t StructPredvint32m4_t UndefStructPredvint32m4_t StructPredvbool8_t UndefStructPredvbool8_t em_data em_output.
Ltac em119_common_leaves l q := lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   first [match q with context[v] => let cell:=fresh "shared_cell" in set(cell:=v);clearbody cell end | idtac];
   em119_common_leaves tail q end.
Ltac em119_common_frame := match goal with|-?P|--?Q=>let leaves:=All_listasrts P in em119_common_leaves leaves Q end.
Ltac em119_set_leaves l:=lazymatch l with
 | nil=>idtac
 |cons(norm_asrt ?v)?tail=>let cell:=fresh "frozen_cell"in set(cell:=v);clearbody cell;em119_set_leaves tail end.
Ltac em119_set_frame:=match goal with|-?P|--?Q=>let leaves:=All_listasrts P in em119_set_leaves leaves end;sepcon_assoc_change;fast_cancel.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_119 : ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_119.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_119.
 em_intro.
 rewrite ?emrm_eta16.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - em_pure.
 - em119_common_frame.
   Local Transparent StructPredvfloat32m4_t UndefStructPredvfloat32m4_t.
   unfold StructPredvfloat32m4_t,UndefStructPredvfloat32m4_t.
   rewrite ?em_local_field_address.
   em119_set_frame.
Qed.
End Checked.
Definition ExactSecond119 : ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_119 := Checked.proof_of_test_rvv_partial_solve_wit_119.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_119.
Print Assumptions ExactSecond119.
