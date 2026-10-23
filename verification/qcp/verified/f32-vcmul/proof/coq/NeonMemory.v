From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import FastFrame.
From ByValue Require Import neon_copy_checked.
From VCMul Require Import Model ComplexModel NeonFacts neon_unit_goal.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque vcmul_mla vcmul_mls fp32_mul fp32_add fp32_sub complex_real_prefix complex_imag_prefix.

(* The 64-bit address bounds follow from the original FloatArray resources.
   They add no address precondition and place no restriction on float values. *)
Lemma vcmul_full_index_valid : forall p n xs i (d:fp32),
  0 <= i < n -> FloatArray.full p n xs |--
  “ 0 <= p+i*4 /\ p+i*4+3 <= 18446744073709551615 ”.
Proof.
 intros p n xs i d Hi.
 sep_apply (FloatArray.full_split_to_missing_i p i n xs d Hi).
 unfold StoreFloatAsElement.storeA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 prop_apply (valid_store_float (p+i*4) (Znth i xs d)). Intros_p Hv.
 unfold isvalidptr_float in Hv.
 change addr_max_unsigned with 18446744073709551615 in Hv.
 entailer!.
Qed.

Lemma vcmul_undef_index_valid : forall p n i,
  0 <= i < n -> FloatArray.undef_full p n |--
  “ 0 <= p+i*4 /\ p+i*4+3 <= 18446744073709551615 ”.
Proof.
 intros p n i Hi.
 sep_apply (FloatArray.undef_full_split_to_undef_missing_i p i n Hi).
 unfold StoreFloatAsElement.undefstoreA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 unfold undef_store_float. Intros_p Hv.
 unfold isvalidptr_float in Hv.
 change addr_max_unsigned with 18446744073709551615 in Hv.
 entailer!.
Qed.

Ltac memory_frame :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?VCMul.Model.local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;repeat first[assumption|split|reflexivity];lia
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].

Lemma vcmul_uintptr_add : forall p b,
  0 <= p -> 0 <= b -> p+b < 18446744073709551616 ->
  unsigned_last_nbits (unsigned_last_nbits p 64+b) 64 = p+b.
Proof.
 intros p b Hp Hb Hpb.
 rewrite (unsigned_last_nbits_eq p 64 ltac:(change (0<=p<18446744073709551616);lia)).
 apply unsigned_last_nbits_eq. change (0<=p+b<18446744073709551616);lia.
Qed.

Lemma vcmul_initial_output_split : forall p n,
  0 <= n -> FloatArray.undef_full p (2*n) |--
  FloatArray.full p 0 [] ** FloatArray.undef_full p n **
  FloatArray.full (p+n*4) 0 [] ** FloatArray.undef_full (p+n*4) n.
Proof.
 intros p n Hn.
 sep_apply (FloatArray.undef_full_split_to_undef_full p n (2*n) ltac:(lia)).
 replace (2*n-n) with n by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 unfold FloatArray.full, store_array. cbn [store_array_rec]. entailer!.
Qed.

Lemma vcmul_real_append1 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+1 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_real_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth k A d) (Znth k B d)) (Znth (n+k) A d) (Znth (n+k) B d))) |--
  FloatArray.full p (k+1) (complex_real_prefix (k+1) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_real_mls by lia.
 rewrite complex_real_prefix_append1 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append1 p k (complex_real_prefix k n A B) (complex_real (Z.to_nat n) A B (Z.to_nat k)) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_real_append2 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+2 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_real_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth k A d) (Znth k B d)) (Znth (n+k) A d) (Znth (n+k) B d))) **
  ((p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth (k+1) A d) (Znth (k+1) B d)) (Znth (n+(k+1)) A d) (Znth (n+(k+1)) B d))) |--
  FloatArray.full p (k+2) (complex_real_prefix (k+2) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_real_mls by lia.
 rewrite complex_real_prefix_append2 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append2 p k (complex_real_prefix k n A B) (complex_real (Z.to_nat n) A B (Z.to_nat k)) (complex_real (Z.to_nat n) A B (Z.to_nat (k+1))) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_real_append3 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+3 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_real_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth k A d) (Znth k B d)) (Znth (n+k) A d) (Znth (n+k) B d))) **
  ((p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth (k+1) A d) (Znth (k+1) B d)) (Znth (n+(k+1)) A d) (Znth (n+(k+1)) B d))) **
  ((p+k*sizeof(FLOAT)+2*sizeof(FLOAT)) # Float |-> (vcmul_mls (fp32_mul (Znth (k+2) A d) (Znth (k+2) B d)) (Znth (n+(k+2)) A d) (Znth (n+(k+2)) B d))) |--
  FloatArray.full p (k+3) (complex_real_prefix (k+3) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_real_mls by lia.
 rewrite complex_real_prefix_append3 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append3 p k (complex_real_prefix k n A B) (complex_real (Z.to_nat n) A B (Z.to_nat k)) (complex_real (Z.to_nat n) A B (Z.to_nat (k+1))) (complex_real (Z.to_nat n) A B (Z.to_nat (k+2))) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_real_append4 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+4 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_real_prefix k n A B) **
  float_cells4 (p+k*sizeof(FLOAT))
  (vcmul_mls (fp32_mul (Znth k A d) (Znth k B d)) (Znth (n+k) A d) (Znth (n+k) B d))
  (vcmul_mls (fp32_mul (Znth (k+1) A d) (Znth (k+1) B d)) (Znth (n+(k+1)) A d) (Znth (n+(k+1)) B d))
  (vcmul_mls (fp32_mul (Znth (k+2) A d) (Znth (k+2) B d)) (Znth (n+(k+2)) A d) (Znth (n+(k+2)) B d))
  (vcmul_mls (fp32_mul (Znth (k+3) A d) (Znth (k+3) B d)) (Znth (n+(k+3)) A d) (Znth (n+(k+3)) B d)) |--
  FloatArray.full p (k+4) (complex_real_prefix (k+4) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 unfold float_cells4.
 repeat rewrite complex_real_mls by lia.
 rewrite complex_real_prefix_append4 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append4 p k (complex_real_prefix k n A B) (complex_real (Z.to_nat n) A B (Z.to_nat k)) (complex_real (Z.to_nat n) A B (Z.to_nat (k+1))) (complex_real (Z.to_nat n) A B (Z.to_nat (k+2))) (complex_real (Z.to_nat n) A B (Z.to_nat (k+3))) Hk) as Happend.
 unfold float_cells4 in Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_imag_append1 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+1 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_imag_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth k A d) (Znth (n+k) B d)) (Znth (n+k) A d) (Znth k B d))) |--
  FloatArray.full p (k+1) (complex_imag_prefix (k+1) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_imag_mla by lia.
 rewrite complex_imag_prefix_append1 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append1 p k (complex_imag_prefix k n A B) (complex_imag (Z.to_nat n) A B (Z.to_nat k)) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_imag_append2 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+2 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_imag_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth k A d) (Znth (n+k) B d)) (Znth (n+k) A d) (Znth k B d))) **
  ((p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth (k+1) A d) (Znth (n+(k+1)) B d)) (Znth (n+(k+1)) A d) (Znth (k+1) B d))) |--
  FloatArray.full p (k+2) (complex_imag_prefix (k+2) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_imag_mla by lia.
 rewrite complex_imag_prefix_append2 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append2 p k (complex_imag_prefix k n A B) (complex_imag (Z.to_nat n) A B (Z.to_nat k)) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+1))) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_imag_append3 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+3 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_imag_prefix k n A B) **
  ((p+k*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth k A d) (Znth (n+k) B d)) (Znth (n+k) A d) (Znth k B d))) **
  ((p+k*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth (k+1) A d) (Znth (n+(k+1)) B d)) (Znth (n+(k+1)) A d) (Znth (k+1) B d))) **
  ((p+k*sizeof(FLOAT)+2*sizeof(FLOAT)) # Float |-> (vcmul_mla (fp32_mul (Znth (k+2) A d) (Znth (n+(k+2)) B d)) (Znth (n+(k+2)) A d) (Znth (k+2) B d))) |--
  FloatArray.full p (k+3) (complex_imag_prefix (k+3) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 
 repeat rewrite complex_imag_mla by lia.
 rewrite complex_imag_prefix_append3 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append3 p k (complex_imag_prefix k n A B) (complex_imag (Z.to_nat n) A B (Z.to_nat k)) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+1))) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+2))) Hk) as Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_imag_append4 : forall p k n A B d,
  0 <= k -> 0 <= n -> k+4 <= n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  FloatArray.full p k (complex_imag_prefix k n A B) **
  float_cells4 (p+k*sizeof(FLOAT))
  (vcmul_mla (fp32_mul (Znth k A d) (Znth (n+k) B d)) (Znth (n+k) A d) (Znth k B d))
  (vcmul_mla (fp32_mul (Znth (k+1) A d) (Znth (n+(k+1)) B d)) (Znth (n+(k+1)) A d) (Znth (k+1) B d))
  (vcmul_mla (fp32_mul (Znth (k+2) A d) (Znth (n+(k+2)) B d)) (Znth (n+(k+2)) A d) (Znth (k+2) B d))
  (vcmul_mla (fp32_mul (Znth (k+3) A d) (Znth (n+(k+3)) B d)) (Znth (n+(k+3)) A d) (Znth (k+3) B d)) |--
  FloatArray.full p (k+4) (complex_imag_prefix (k+4) n A B).
Proof.
 intros p k n A B d Hk Hn Hkn HA HB.
 unfold float_cells4.
 repeat rewrite complex_imag_mla by lia.
 rewrite complex_imag_prefix_append4 by exact Hk.
 repeat rewrite logic_equiv_sepcon_assoc.
 pose proof (float_prefix_append4 p k (complex_imag_prefix k n A B) (complex_imag (Z.to_nat n) A B (Z.to_nat k)) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+1))) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+2))) (complex_imag (Z.to_nat n) A B (Z.to_nat (k+3))) Hk) as Happend.
 unfold float_cells4 in Happend.
 repeat rewrite logic_equiv_sepcon_assoc in Happend.
 exact Happend.
Qed.

Lemma vcmul_output_merge : forall p n A B,
  0 <= n ->
  FloatArray.full p n (complex_real_prefix n n A B) **
  FloatArray.full (p+n*4) n (complex_imag_prefix n n A B) |--
  FloatArray.full p (2*n) (vcmul_values n A B).
Proof.
 intros p n A B Hn. rewrite vcmul_values_parts.
 pose proof (FloatArray.full_merge_to_full p n (2*n)
   (complex_real_prefix n n A B) (complex_imag_prefix n n A B) ltac:(lia)) as HM.
 replace (2*n-n) with n in HM by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HM.
 exact HM.
Qed.

Module CheckedNeonMemory.
Lemma proof_of_test_neon_entail_wit_3_1 : VCMul.neon_unit_goal.test_neon_entail_wit_3_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_3_1; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_3_2 : VCMul.neon_unit_goal.test_neon_entail_wit_3_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_3_2; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_3_3 : VCMul.neon_unit_goal.test_neon_entail_wit_3_3.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_3_3; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_4_1 : VCMul.neon_unit_goal.test_neon_entail_wit_4_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_4_1; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_4_2 : VCMul.neon_unit_goal.test_neon_entail_wit_4_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_4_2; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_4_3 : VCMul.neon_unit_goal.test_neon_entail_wit_4_3.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_4_3; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_5_1 : VCMul.neon_unit_goal.test_neon_entail_wit_5_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_5_1; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_5_2 : VCMul.neon_unit_goal.test_neon_entail_wit_5_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_5_2; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_5_3 : VCMul.neon_unit_goal.test_neon_entail_wit_5_3.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_5_3; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_6_1 : VCMul.neon_unit_goal.test_neon_entail_wit_6_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_6_1; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_6_2 : VCMul.neon_unit_goal.test_neon_entail_wit_6_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_6_2; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_entail_wit_6_3 : VCMul.neon_unit_goal.test_neon_entail_wit_6_3.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_6_3; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 first [solve [subst batch; repeat match goal with H:context[Z.land] |- _ => vm_compute in H end; exfalso; congruence]
 | memory_frame].
Qed.

Lemma proof_of_test_neon_return_wit_1 : VCMul.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_return_wit_1; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 assert (Htot:batch_pre ÷ 4 = k+3) by lia.
 assert (Hhalf:batch_pre ÷ 2 = 2*(batch_pre ÷ 4)).
 { replace batch_pre with ((2*(batch_pre ÷ 4))*2) at 1 by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 assert (Hidx:(batch_pre-batch) ÷ 4 = k).
 { replace (batch_pre-batch) with (k*4) by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 rewrite Hidx. subst or oi.
 replace (output_pre+(batch_pre ÷ 4+k)*4) with (output_pre+(batch_pre ÷ 4)*4+k*4) by ring.
 replace (batch_pre ÷ 4+k+1) with (batch_pre ÷ 4+(k+1)) by lia.
 replace (batch_pre ÷ 4+k+2) with (batch_pre ÷ 4+(k+2)) by lia.
 pose proof (vcmul_real_append3 output_pre k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HR.
 pose proof (vcmul_imag_append3 (output_pre+(batch_pre ÷ 4)*4) k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HI.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HR,HI.
 repeat rewrite logic_equiv_sepcon_assoc in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r.
 sep_apply HR. sep_apply HI.
 replace (batch_pre ÷ 4-k) with 3 by lia.
 replace (2+1) with 3 by lia.
 rewrite !FloatArray.undef_seg_empty.
 rewrite <- Htot.
 sep_apply (vcmul_output_merge output_pre (batch_pre ÷ 4) A B ltac:(lia)).
 rewrite Hhalf. memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_2 : VCMul.neon_unit_goal.test_neon_return_wit_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_return_wit_2; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 assert (Htot:batch_pre ÷ 4 = k+1) by lia.
 assert (Hhalf:batch_pre ÷ 2 = 2*(batch_pre ÷ 4)).
 { replace batch_pre with ((2*(batch_pre ÷ 4))*2) at 1 by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 assert (Hidx:(batch_pre-batch) ÷ 4 = k).
 { replace (batch_pre-batch) with (k*4) by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 rewrite Hidx. subst or oi.
 replace (output_pre+(batch_pre ÷ 4+k)*4) with (output_pre+(batch_pre ÷ 4)*4+k*4) by ring.
 replace (batch_pre ÷ 4+k+1) with (batch_pre ÷ 4+(k+1)) by lia.
 replace (batch_pre ÷ 4+k+2) with (batch_pre ÷ 4+(k+2)) by lia.
 pose proof (vcmul_real_append1 output_pre k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HR.
 pose proof (vcmul_imag_append1 (output_pre+(batch_pre ÷ 4)*4) k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HI.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HR,HI.
 repeat rewrite logic_equiv_sepcon_assoc in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r.
 sep_apply HR. sep_apply HI.
 replace (batch_pre ÷ 4-k) with 1 by lia.
 
 rewrite !FloatArray.undef_seg_empty.
 rewrite <- Htot.
 sep_apply (vcmul_output_merge output_pre (batch_pre ÷ 4) A B ltac:(lia)).
 rewrite Hhalf. memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_3 : VCMul.neon_unit_goal.test_neon_return_wit_3.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_return_wit_3; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 assert (Htot:batch_pre ÷ 4 = k+2) by lia.
 assert (Hhalf:batch_pre ÷ 2 = 2*(batch_pre ÷ 4)).
 { replace batch_pre with ((2*(batch_pre ÷ 4))*2) at 1 by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 assert (Hidx:(batch_pre-batch) ÷ 4 = k).
 { replace (batch_pre-batch) with (k*4) by lia.
    rewrite Z.quot_mul by lia; reflexivity. }
 rewrite Hidx. subst or oi.
 replace (output_pre+(batch_pre ÷ 4+k)*4) with (output_pre+(batch_pre ÷ 4)*4+k*4) by ring.
 replace (batch_pre ÷ 4+k+1) with (batch_pre ÷ 4+(k+1)) by lia.
 replace (batch_pre ÷ 4+k+2) with (batch_pre ÷ 4+(k+2)) by lia.
 pose proof (vcmul_real_append2 output_pre k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HR.
 pose proof (vcmul_imag_append2 (output_pre+(batch_pre ÷ 4)*4) k (batch_pre ÷ 4) A B __default_fp32
  ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HI.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HR,HI.
 repeat rewrite logic_equiv_sepcon_assoc in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r.
 sep_apply HR. sep_apply HI.
 replace (batch_pre ÷ 4-k) with 2 by lia.
 
 rewrite !FloatArray.undef_seg_empty.
 rewrite <- Htot.
 sep_apply (vcmul_output_merge output_pre (batch_pre ÷ 4) A B ltac:(lia)).
 rewrite Hhalf. memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_4 : VCMul.neon_unit_goal.test_neon_return_wit_4.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_return_wit_4; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 assert (Htot:batch_pre ÷ 4=k) by lia.
 assert (Hhalf:batch_pre ÷ 2=2*k).
 { replace batch_pre with ((2*k)*2) at 1 by lia.
   rewrite Z.quot_mul by lia; reflexivity. }
 rewrite Htot in *. replace (k-k) with 0 by lia.
 rewrite !FloatArray.undef_full_empty.
 sep_apply (vcmul_output_merge output_pre k A B ltac:(lia)).
 rewrite Hhalf. memory_frame.
Qed.

Local Transparent complex_real_prefix complex_imag_prefix.
Ltac vcmul_choose_initial :=
 first [solve [Exists 0;
   rewrite ?Z.mul_0_l, ?Z.add_0_r, ?Z.add_0_l, ?Z.sub_0_r;
   unfold complex_real_prefix,complex_imag_prefix;
   cbn [Z.to_nat List.seq List.map];
   memory_frame]
 | rewrite <- derivable1_orp_intros1; vcmul_choose_initial
 | rewrite <- derivable1_orp_intros2; vcmul_choose_initial].

Lemma proof_of_test_neon_entail_wit_1 : VCMul.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_1; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 prop_apply (FloatArray.full_Zlength input_a_pre (batch_pre ÷ 2+3) A). Intros_p HA.
 prop_apply (FloatArray.full_Zlength input_b_pre (batch_pre ÷ 2+3) B). Intros_p HB.
 unfold fp32_length.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 assert (Hn:0<batch_pre ÷ 4) by lia.
 assert (Hhalf:batch_pre ÷ 2=2*(batch_pre ÷ 4)).
 { replace batch_pre with ((2*(batch_pre ÷ 4))*2) at 1 by lia.
   rewrite Z.quot_mul by lia;reflexivity. }
 prop_apply (vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3) A 0 fp32_zero ltac:(lia)). Intros_p HA0.
 prop_apply (vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3) A (batch_pre ÷ 4) fp32_zero ltac:(lia)). Intros_p HAn.
 prop_apply (vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3) B 0 fp32_zero ltac:(lia)). Intros_p HB0.
 prop_apply (vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3) B (batch_pre ÷ 4) fp32_zero ltac:(lia)). Intros_p HBn.
 prop_apply (vcmul_undef_index_valid output_pre (batch_pre ÷ 2) 0 ltac:(lia)). Intros_p HO0.
 prop_apply (vcmul_undef_index_valid output_pre (batch_pre ÷ 2) (batch_pre ÷ 4) ltac:(lia)). Intros_p HOn.
 rewrite (vcmul_uintptr_add input_a_pre batch_pre ltac:(lia) ltac:(lia) ltac:(lia)).
 rewrite (vcmul_uintptr_add input_b_pre batch_pre ltac:(lia) ltac:(lia) ltac:(lia)).
 rewrite (vcmul_uintptr_add output_pre batch_pre ltac:(lia) ltac:(lia) ltac:(lia)).
 replace (output_pre+batch_pre) with (output_pre+(batch_pre ÷ 4)*4) by lia.
 rewrite Hhalf.
 sep_apply (vcmul_initial_output_split output_pre (batch_pre ÷ 4) ltac:(lia)).
 pose proof (byte_batch_tail_cases batch_pre ltac:(lia) PreH8) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]];try lia.
 all: vcmul_choose_initial.
Qed.

Local Opaque complex_real_prefix complex_imag_prefix.
Ltac vcmul_choose_step k :=
 first [solve [Exists (k+4);
   repeat match goal with |- context[?n-(k+4)] =>
    replace (n-(k+4)) with (n-k-4) by lia end;
   memory_frame]
 | rewrite <- derivable1_orp_intros1; vcmul_choose_step k
 | rewrite <- derivable1_orp_intros2; vcmul_choose_step k].

Lemma proof_of_test_neon_entail_wit_2 : VCMul.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold VCMul.neon_unit_goal.test_neon_entail_wit_2; intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 unfold fp32_length in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqrpre.
 assert (Hhalf:batch_pre ÷ 2=2*(batch_pre ÷ 4)).
 { replace batch_pre with ((2*(batch_pre ÷ 4))*2) at 1 by lia.
   rewrite Z.quot_mul by lia;reflexivity. }
 assert (Hidx:(batch_pre-batch) ÷ 4=k_2).
 { replace (batch_pre-batch) with (k_2*4) by lia.
   rewrite Z.quot_mul by lia;reflexivity. }
 assert (Hnewq:(batch-16) ÷ 4=batch ÷ 4-4).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.quot_mul by lia;reflexivity. }
 assert (Hnewrem:(batch-16)%4=0).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.rem_mul by lia;reflexivity. }
 prop_apply (vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3) A 0 fp32_zero ltac:(lia)). Intros_p HA0.
 prop_apply (vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3) B 0 fp32_zero ltac:(lia)). Intros_p HB0.
 match goal with |- ?P |-- _ =>
 lazymatch P with context[(oi+0*4) # Float |-> ?v] =>
 prop_apply (float_address_nonnegative (oi+0*4) v);Intros_p HOI end end.
 match goal with |- ?P |-- _ =>
 lazymatch P with context[(or+0*4) # Float |-> ?v] =>
 prop_apply (float_address_nonnegative (or+0*4) v);Intros_p HOR end end.
 rewrite Hidx.
 subst or oi ar ai br bi.
 replace (output_pre+(batch_pre ÷ 4+k_2)*4) with (output_pre+(batch_pre ÷ 4)*4+k_2*4) by ring.
 replace (batch_pre ÷ 4+k_2+1) with (batch_pre ÷ 4+(k_2+1)) by lia.
 replace (batch_pre ÷ 4+k_2+2) with (batch_pre ÷ 4+(k_2+2)) by lia.
 replace (batch_pre ÷ 4+k_2+3) with (batch_pre ÷ 4+(k_2+3)) by lia.
 pose proof (vcmul_real_append4 output_pre k_2 (batch_pre ÷ 4) A B __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HR.
 pose proof (vcmul_imag_append4 (output_pre+(batch_pre ÷ 4)*4) k_2 (batch_pre ÷ 4) A B __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HI.
 unfold float_cells4 in HR,HI.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HR,HI.
 repeat rewrite logic_equiv_sepcon_assoc in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r in HR,HI.
 rewrite ?Z.mul_0_l,?Z.add_0_r.
 sep_apply HR. sep_apply HI.
 sep_apply (FloatArray.undef_seg_to_undef_full (output_pre+k_2*4) 4 (batch_pre ÷ 4-k_2)).
 sep_apply (FloatArray.undef_seg_to_undef_full (output_pre+(batch_pre ÷ 4)*4+k_2*4) 4 (batch_pre ÷ 4-k_2)).
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 replace (batch_pre ÷ 4-(k_2+4)) with (batch_pre ÷ 4-k_2-4) by lia.
 replace (4*4) with 16 by reflexivity.
 rewrite Hnewq.
 pose proof (byte_batch_tail_cases (batch-16) ltac:(lia) Hnewrem) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]].
 all: vcmul_choose_step k_2.
Qed.

End CheckedNeonMemory.
