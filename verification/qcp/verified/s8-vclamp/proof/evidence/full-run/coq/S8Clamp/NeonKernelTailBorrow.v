From Coq Require Import ZArith Lia String.
From S8Clamp Require Import NeonKernelArrayFrame ByteBridge neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelTailBorrow.
Lemma proof_of_test_neon_partial_solve_wit_84 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_84.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_84;intros;subst.
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *.
 repeat progress(lazymatch goal with |-?P |--?R=>s8_neon_norm_heap P;s8_neon_norm_heap R end).
 unfold UndefStructPreduint8x8_t,UndefStructPredint8x8_t,UndefStructPredint8x16_t.
 rewrite ?local_field_address.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - s8_neon_pure.
 - unfold undef_store_uchar.
   fold (undef_store_char(output_pre+batch_pre-2)).
   fold (undef_store_char(output_pre+batch_pre-1)).
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_85 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_85.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_85;intros;subst.
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *.
 repeat progress(lazymatch goal with |-?P |--?R=>s8_neon_norm_heap P;s8_neon_norm_heap R end).
 unfold UndefStructPreduint8x8_t,UndefStructPredint8x8_t,UndefStructPredint8x16_t.
 rewrite ?local_field_address.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - s8_neon_pure.
 - unfold undef_store_uchar.
   fold (undef_store_char(output_pre+batch_pre-3)).
   fold (undef_store_char(output_pre+batch_pre-2)).
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
End CheckedNeonKernelTailBorrow.
