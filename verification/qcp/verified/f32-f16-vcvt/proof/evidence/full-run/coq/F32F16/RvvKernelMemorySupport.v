From Coq Require Import ZArith Lia List.
From F32F16 Require Export RvvKernelCallsSupport ArrayMemory ProgramFacts RvvNamedPack.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Ltac f16_rvv_memory_prepare :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?sizeof_float,?sizeof_ushort,?f16_scale_hi_decimal,?f16_scale_lo_decimal in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 unfold rvv_length in *.

Lemma f16_rvv_memory_byte_count : forall batch,
 0<batch -> batch<=18446744073709551615 -> Z.rem batch 4=0 ->
 0<Z.quot batch 4<=4611686018427387903.
Proof. intros;pose proof(Z.quot_rem batch 4 ltac:(lia));lia. Qed.

Lemma f16_rvv_memory_vl : forall n,0<n -> 0<vadd_vl n<=32 /\ vadd_vl n<=n.
Proof. intros;unfold vadd_vl;lia. Qed.

Lemma f16_rvv_memory_output_append : forall p k vl (A:list fp32),
 0<=k -> 0<=vl ->
 UShortArray.seg p 0 k(f16_rvv_values k A) **
 UShortArray.full(p+k*sizeof(USHORT))vl
   (f16_rvv_values vl(rvv_slice k(k+vl)A)) |--
 UShortArray.seg p 0(k+vl)(f16_rvv_values(k+vl)A).
Proof.
 intros;rewrite f16_rvv_append by assumption.
 apply f16_ushort_prefix_append;assumption.
Qed.

Print Assumptions f16_rvv_memory_byte_count.
Print Assumptions f16_rvv_memory_vl.
Print Assumptions f16_rvv_memory_output_append.
