From Coq Require Import ZArith Lia Lra Reals SpecFloat.
From ExpMinusMax Require Import Constants Bits LiteralFacts.
Local Open Scope R_scope.
Lemma em_log2e_literal:fp32_of_real(1.44269502162933349609375)=em_log2e.
Proof.
 unfold em_log2e.
 replace (1.44269502162933349609375)%R with (Binary.B2R 24 128(fp32_of_bits 1069066811)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_log2e_literal.
Lemma em_magic_bias_literal:fp32_of_real(12583039.0)=em_magic_bias.
Proof.
 unfold em_magic_bias.
 replace (12583039.0)%R with (Binary.B2R 24 128(fp32_of_bits 1262485631)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_magic_bias_literal.
Lemma em_c5_literal:fp32_of_real(0.00828929059207439422607421875)=em_c5.
Proof.
 unfold em_c5.
 replace (0.00828929059207439422607421875)%R with (Binary.B2R 24 128(fp32_of_bits 1007144910)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_c5_literal.
Lemma em_c4_literal:fp32_of_real(0.0418978221714496612548828125)=em_c4.
Proof.
 unfold em_c4.
 replace (0.0418978221714496612548828125)%R with (Binary.B2R 24 128(fp32_of_bits 1026268429)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_c4_literal.
Lemma em_c3_literal:fp32_of_real(0.16667652130126953125)=em_c3.
Proof.
 unfold em_c3.
 replace (0.16667652130126953125)%R with (Binary.B2R 24 128(fp32_of_bits 1042984256)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_c3_literal.
Lemma em_c2_literal:fp32_of_real(0.4999915063381195068359375)=em_c2.
Proof.
 unfold em_c2.
 replace (0.4999915063381195068359375)%R with (Binary.B2R 24 128(fp32_of_bits 1056964323)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_c2_literal.
Lemma em_c1_literal:fp32_of_real(0.999999701976776123046875)=em_c1.
Proof.
 unfold em_c1.
 replace (0.999999701976776123046875)%R with (Binary.B2R 24 128(fp32_of_bits 1065353211)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_c1_literal.
Lemma em_denorm_cutoff_literal:fp32_of_real(-87.33654022216796875)=em_denorm_cutoff.
Proof.
 unfold em_denorm_cutoff.
 replace (-87.33654022216796875)%R with (Binary.B2R 24 128(fp32_of_bits 3266227279)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_denorm_cutoff_literal.
Lemma em_minus_ln2_literal:fp32_of_real(-0.693147182464599609375)=em_minus_ln2.
Proof.
 unfold em_minus_ln2.
 replace (-0.693147182464599609375)%R with (Binary.B2R 24 128(fp32_of_bits 3207688728)) by(vm_compute;field).
 apply em_real_roundtrip;vm_compute;reflexivity.
Qed.
Print Assumptions em_minus_ln2_literal.
