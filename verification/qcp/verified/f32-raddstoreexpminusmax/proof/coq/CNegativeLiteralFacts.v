From Coq Require Import ZArith Lia Lra Reals SpecFloat.
From ExpMinusMax Require Export Constants Bits LiteralFacts.
Local Open Scope R_scope.
Lemma em_denorm_cutoff_C_literal:fp32_neg(fp32_of_real 87.33654022216796875)=em_denorm_cutoff.
Proof.
 assert(H:fp32_of_real 87.33654022216796875=fp32_of_bits 1118743631).
 { replace(87.33654022216796875)%R with(Binary.B2R 24 128(fp32_of_bits 1118743631))by(vm_compute;field).
   apply em_real_roundtrip;vm_compute;reflexivity. }
 rewrite H;apply Binary.B2R_inj;vm_compute;reflexivity.
Qed.
Lemma em_minus_ln2_C_literal:fp32_neg(fp32_of_real 0.693147182464599609375)=em_minus_ln2.
Proof.
 assert(H:fp32_of_real 0.693147182464599609375=fp32_of_bits 1060205080).
 { replace(0.693147182464599609375)%R with(Binary.B2R 24 128(fp32_of_bits 1060205080))by(vm_compute;field).
   apply em_real_roundtrip;vm_compute;reflexivity. }
 rewrite H;apply Binary.B2R_inj;vm_compute;reflexivity.
Qed.
Print Assumptions em_denorm_cutoff_C_literal.
Print Assumptions em_minus_ln2_C_literal.
