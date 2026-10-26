From Coq Require Import ZArith Lia.
From ExpMinusMax Require Export KernelModel ExpressionFacts SignedWord.
Local Open Scope Z_scope.
Lemma em_masked_decode:forall x mask,(mask=0\/mask=4294967295)->
 fp32_of_bits(unsigned_last_nbits(Z.land(bits_of_fp32 x)(Z.lxor 4294967295 mask))32)=em_bic x mask.
Proof.
 intros x mask H;destruct H as[Hm|Hm];subst mask;unfold em_bic.
 - rewrite Z.lxor_0_r;replace 4294967295 with(Z.ones 32)by reflexivity.
   rewrite Z.land_ones by lia;change(2^32)with 4294967296.
   rewrite Z.mod_small by(pose proof(fp32_bits_range x);lia).
   rewrite unsigned_last_nbits_eq by(pose proof(fp32_bits_range x);change(2^32)with 4294967296;lia);reflexivity.
 - rewrite Z.lxor_nilpotent,Z.land_0_r;reflexivity.
Qed.
Lemma em_neon_expression_lane:forall vi maximum j,0<=j<4->
 em_get_float32x4_t(em_neon_expression vi maximum)j=
 em_arm_value(em_get_float32x4_t vi j)(em_get_float32x4_t maximum j).
Proof.
 intros vi maximum j Hj.
 unfold em_neon_expression,em_neon_sub,em_neon_fma,em_neon_dup,
 em_neon_reint_i_f,em_neon_reint_f_i,em_neon_slli,em_neon_mul,
 em_neon_reint_u_f,em_neon_reint_f_u,em_neon_bic,em_neon_clt.
 repeat first[rewrite em_get_make_float32x4_t by exact Hj|rewrite em_get_make_int32x4_t by exact Hj|rewrite em_get_make_uint32x4_t by exact Hj].
 rewrite !em_shift_power.
 repeat first[rewrite em_get_make_float32x4_t by exact Hj|rewrite em_get_make_int32x4_t by exact Hj|rewrite em_get_make_uint32x4_t by exact Hj].
 rewrite em_masked_decode by apply em_clt_cases.
 reflexivity.
Qed.
Print Assumptions em_masked_decode.
Print Assumptions em_neon_expression_lane.
