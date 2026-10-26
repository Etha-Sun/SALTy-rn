From ExpMinusMax Require Export VectorNormalization.
Lemma em_record_eta_i4:forall r,make_record_int32x4_t(int32x4_t_s0 r)(int32x4_t_s1 r)(int32x4_t_s2 r)(int32x4_t_s3 r)=r.
Proof. intros [];reflexivity. Qed.
Lemma em_record_eta_u4:forall r,make_record_uint32x4_t(uint32x4_t_s0 r)(uint32x4_t_s1 r)(uint32x4_t_s2 r)(uint32x4_t_s3 r)=r.
Proof. intros [];reflexivity. Qed.
