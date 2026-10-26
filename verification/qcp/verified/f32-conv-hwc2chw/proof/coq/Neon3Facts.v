From HwcConv Require Export Neon3Model.
Local Open Scope Z_scope.
Lemma hc_neon_record_eta:forall A,
 make_record_float32x4_t A.(float32x4_t_s0) A.(float32x4_t_s1) A.(float32x4_t_s2) A.(float32x4_t_s3)=A.
Proof. intros[];reflexivity. Qed.
Lemma hc_neon3_chain:forall A W0 W1 W2 X0 X1 X2 R0 R1 R2 lane,
 hc_neon_fma4 R0 A W0 X0 lane->hc_neon_fma4 R1 R0 W1 X1 lane->hc_neon_fma4 R2 R1 W2 X2 lane->
 hc_neon3 R2 A W0 W1 W2 X0 X1 X2 lane.
Proof. intros A W0 W1 W2 X0 X1 X2 R0 R1 R2 lane H0 H1 H2 i Hi.
 rewrite H2,H1,H0 by exact Hi;reflexivity. Qed.
Print Assumptions hc_neon_record_eta.
Print Assumptions hc_neon3_chain.
