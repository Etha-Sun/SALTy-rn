From Coq Require Import ZArith Lia List.
From QcpNeonLoop Require Import InvariantFacts.
From VCMul Require Import Model ComplexModel NeonFacts NeonMemory RvvFacts RvvMemoryModel RvvStoreModel rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque vcmul_read_lane_model vcmul_active_mul vcmul_active_add vcmul_active_sub.
Lemma vcmul_real_chunk_append : forall p k r n A B,
 0<=n -> 0<=k -> 0<=r<=16 -> k+r<=n -> Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 FloatArray.full p k (complex_real_prefix k n A B) **
 FloatArray.full(p+k*4)r(rvv_take r(vcmul_real16 r k n A B)) |--
 FloatArray.full p (k+r)(complex_real_prefix(k+r)n A B).
Proof.
 intros p k r n A B Hn Hk Hr Hcount HA HB.
 rewrite vcmul_real_chunk by lia.
 rewrite complex_real_prefix_append by lia.
 pose proof(FloatArray.full_merge_to_full p k (k+r)
   (complex_real_prefix k n A B)
   (map(complex_real(Z.to_nat n)A B)(seq(Z.to_nat k)(Z.to_nat r)))ltac:(lia))as HM.
 replace(k+r-k)with r in HM by lia.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in HM.
 exact HM.
Qed.
Lemma vcmul_imag_chunk_append : forall p k r n A B,
 0<=n -> 0<=k -> 0<=r<=16 -> k+r<=n -> Zlength A=2*n+3 -> Zlength B=2*n+3 ->
 FloatArray.full p k (complex_imag_prefix k n A B) **
 FloatArray.full(p+k*4)r(rvv_take r(vcmul_imag16 r k n A B)) |--
 FloatArray.full p (k+r)(complex_imag_prefix(k+r)n A B).
Proof.
 intros p k r n A B Hn Hk Hr Hcount HA HB.
 rewrite vcmul_imag_chunk by lia.
 rewrite complex_imag_prefix_append by lia.
 pose proof(FloatArray.full_merge_to_full p k (k+r)
   (complex_imag_prefix k n A B)
   (map(complex_imag(Z.to_nat n)A B)(seq(Z.to_nat k)(Z.to_nat r)))ltac:(lia))as HM.
 replace(k+r-k)with r in HM by lia.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in HM.
 exact HM.
Qed.
Module CheckedRvvMemory.
Lemma proof_of_test_rvv_entail_wit_1 : VCMul.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold VCMul.rvv_unit_goal.test_rvv_entail_wit_1;left;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 prop_apply(FloatArray.full_Zlength input_a_pre (batch_pre ÷ 2+3)A);Intros_p HA.
 prop_apply(FloatArray.full_Zlength input_b_pre (batch_pre ÷ 2+3)B);Intros_p HB.
 unfold fp32_length.
 pose proof(Z.quot_rem batch_pre 4 ltac:(lia))as Hqr.
 assert(Hn:0<batch_pre ÷ 4)by lia.
 assert(Hhalf:batch_pre ÷ 2=2*(batch_pre ÷ 4)).
 {replace batch_pre with((2*(batch_pre ÷ 4))*2)at 1 by lia;rewrite Z.quot_mul by lia;reflexivity. }
 prop_apply(vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3)A 0 fp32_zero ltac:(lia));Intros_p HA0.
 prop_apply(vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3)A (batch_pre ÷ 4)fp32_zero ltac:(lia));Intros_p HAn.
 prop_apply(vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3)B 0 fp32_zero ltac:(lia));Intros_p HB0.
 prop_apply(vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3)B (batch_pre ÷ 4)fp32_zero ltac:(lia));Intros_p HBn.
 prop_apply(vcmul_undef_index_valid output_pre (batch_pre ÷ 2)0 ltac:(lia));Intros_p HO0.
 prop_apply(vcmul_undef_index_valid output_pre (batch_pre ÷ 2)(batch_pre ÷ 4)ltac:(lia));Intros_p HOn.
 rewrite(vcmul_uintptr_add input_a_pre batch_pre ltac:(lia)ltac:(lia)ltac:(lia)).
 rewrite(vcmul_uintptr_add input_b_pre batch_pre ltac:(lia)ltac:(lia)ltac:(lia)).
 rewrite(vcmul_uintptr_add output_pre batch_pre ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(output_pre+batch_pre)with(output_pre+(batch_pre ÷ 4)*4)by lia.
 rewrite Hhalf.
 sep_apply(vcmul_initial_output_split output_pre (batch_pre ÷ 4)ltac:(lia)).
 Exists 0.
 rewrite ?Z.mul_0_l,?Z.add_0_r,?Z.add_0_l,?Z.sub_0_r.
 unfold complex_real_prefix,complex_imag_prefix;cbn[Z.to_nat List.seq List.map].
 memory_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : VCMul.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold VCMul.rvv_unit_goal.test_rvv_entail_wit_2;left;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 assert(Hvl:0<retval /\ retval<=n /\ retval<=16).
 {subst retval;unfold vcmul_vl16;destruct(Z_le_dec n 16);[rewrite Z.min_l by lia|rewrite Z.min_r by lia];repeat split;lia. }
 destruct Hvl as[Hpos[Hle Hmax]].
 Exists k_2.
 sep_apply_l_atomic(FloatArray.undef_full_split_to_undef_full out_r retval n ltac:(lia)).
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 sep_apply_l_atomic(FloatArray.undef_full_split_to_undef_full out_i retval n ltac:(lia)).
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 memory_frame.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : VCMul.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold VCMul.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 assert(n=0)by lia;subst n.
 assert(Htot:batch_pre ÷ 4=k)by lia.
 pose proof(Z.quot_rem batch_pre 4 ltac:(lia))as Hqr.
 assert(Hhalf:batch_pre ÷ 2=2*k).
 {replace batch_pre with((2*k)*2)at 1 by lia;rewrite Z.quot_mul by lia;reflexivity. }
 rewrite Htot in *.
 rewrite !FloatArray.undef_full_empty.
 sep_apply(vcmul_output_merge output_pre k A B ltac:(lia)).
 rewrite Hhalf;memory_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : VCMul.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold VCMul.rvv_unit_goal.test_rvv_entail_wit_3;left;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 unfold fp32_length in *.
 pose proof(Z.quot_rem batch_pre 4 ltac:(lia))as Hqr.
 assert(Hhalf:batch_pre ÷ 2=2*(batch_pre ÷ 4)).
 {replace batch_pre with((2*(batch_pre ÷ 4))*2)at 1 by lia;rewrite Z.quot_mul by lia;reflexivity. }
 replace(batch_pre ÷ 4+batch_pre ÷ 4-n)with(batch_pre ÷ 4+(batch_pre ÷ 4-n))by lia.
 fold(vcmul_real16 vl (batch_pre ÷ 4-n)(batch_pre ÷ 4)A B).
 fold(vcmul_imag16 vl (batch_pre ÷ 4-n)(batch_pre ÷ 4)A B).
 replace(batch_pre ÷ 4-n)with k_2 by lia.
 prop_apply(vcmul_full_index_valid input_a_pre (batch_pre ÷ 2+3)A 0 fp32_zero ltac:(lia));Intros_p HA0.
 prop_apply(vcmul_full_index_valid input_b_pre (batch_pre ÷ 2+3)B 0 fp32_zero ltac:(lia));Intros_p HB0.
 prop_apply(vcmul_full_index_valid out_r vl (rvv_take vl(vcmul_real16 vl k_2(batch_pre ÷ 4)A B))0 fp32_zero ltac:(lia));Intros_p HOR.
 prop_apply(vcmul_full_index_valid out_i vl (rvv_take vl(vcmul_imag16 vl k_2(batch_pre ÷ 4)A B))0 fp32_zero ltac:(lia));Intros_p HOI.
 subst ar ai br bi out_r out_i.
 replace(output_pre+(batch_pre ÷ 4+k_2)*4)with(output_pre+(batch_pre ÷ 4)*4+k_2*4)by ring.
 sep_apply(vcmul_real_chunk_append output_pre k_2 vl (batch_pre ÷ 4)A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)).
 sep_apply(vcmul_imag_chunk_append (output_pre+(batch_pre ÷ 4)*4)k_2 vl (batch_pre ÷ 4)A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)).
 Exists(k_2+vl).
 replace(batch_pre ÷ 4-(k_2+vl))with(n-vl)by lia.
 replace(output_pre+k_2*4+vl*4)with(output_pre+(k_2+vl)*4)by ring.
 replace(output_pre+(batch_pre ÷ 4)*4+k_2*4+vl*4)with(output_pre+(batch_pre ÷ 4+k_2+vl)*4)by ring.
 memory_frame.
Qed.
End CheckedRvvMemory.
