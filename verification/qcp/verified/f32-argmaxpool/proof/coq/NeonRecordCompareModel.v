From ArgmaxPool Require Export VectorRecords.
Definition ap_record_gt4(a b:Recordfloat32x4_t):Recorduint32x4_t :=
 make_record_uint32x4_t
  (ap_gt_mask a.(float32x4_t_s0) b.(float32x4_t_s0))
  (ap_gt_mask a.(float32x4_t_s1) b.(float32x4_t_s1))
  (ap_gt_mask a.(float32x4_t_s2) b.(float32x4_t_s2))
  (ap_gt_mask a.(float32x4_t_s3) b.(float32x4_t_s3)).
Definition ap_record_same_u4(a b:Recorduint32x4_t):Prop := a=b.
Lemma ap_record_gt4_mask:forall a b,ap_record_mask4(ap_record_gt4 a b).
Proof. intros;unfold ap_record_mask4,ap_record_gt4;cbn;repeat split;apply ap_gt_mask_cases. Qed.
Print Assumptions ap_record_gt4_mask.
