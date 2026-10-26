From ExpMinusMax Require Export VectorRecords.
Lemma em_record_eta4:forall r,
 make_record_float32x4_t(float32x4_t_s0 r)(float32x4_t_s1 r)(float32x4_t_s2 r)(float32x4_t_s3 r)=r.
Proof. intros [];reflexivity. Qed.
Lemma em_record_eta2:forall r,make_record_float32x2_t(float32x2_t_s0 r)(float32x2_t_s1 r)=r.
Proof. intros [];reflexivity. Qed.
