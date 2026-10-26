From HwcConv Require Export StoreViewsModel.
Lemma hc_store_f4_eta:forall A,make_record_float32x4_t A.(float32x4_t_s0) A.(float32x4_t_s1) A.(float32x4_t_s2) A.(float32x4_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Lemma hc_store_f2_eta:forall A,make_record_float32x2_t A.(float32x2_t_s0) A.(float32x2_t_s1)=A.
Proof. intros [];reflexivity. Qed.
