From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export MemoryModel Pointwise Types.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition qm_lane (M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo hi i:Z):Z :=
 qm_neon_lane (rd_get M (pa+i)) (rd_get M (pb+i)) az bz scale oz lo hi.
Definition qm_rvv_at (M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo hi i:Z):Z :=
 qm_rvv_lane (rd_get M (pa+i)) (rd_get M (pb+i)) az bz scale oz lo hi.
Definition qm_values (n:Z)(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo hi:Z):list Z :=
 map (fun i=>qm_lane M pa pb az bz scale oz lo hi (Z.of_nat i)) (seq 0 (Z.to_nat n)).
Definition qm_rvv_values (n:Z)(M:RDMap)(pa pb az bz:Z)(scale:fp32)(oz lo hi:Z):list Z :=
 map (fun i=>qm_rvv_at M pa pb az bz scale oz lo hi (Z.of_nat i)) (seq 0 (Z.to_nat n)).
Definition qm_inputs (M:RDMap)(pa pb n:Z):Prop :=
 rd_window M pa (n+7) /\ rd_window M pb (n+7).
Lemma qm_values_equivalence : forall n M pa pb az bz scale oz lo hi,
 -32768<=oz<=32767 ->
 qm_values n M pa pb az bz scale oz lo hi=qm_rvv_values n M pa pb az bz scale oz lo hi.
Proof. intros;unfold qm_values,qm_rvv_values;apply map_ext;intro i;unfold qm_lane,qm_rvv_at;apply qm_pointwise_equivalence;assumption. Qed.
Lemma qm_values_length : forall n M pa pb az bz scale oz lo hi,
 length(qm_values n M pa pb az bz scale oz lo hi)=Z.to_nat n.
Proof. intros;unfold qm_values;rewrite map_length,seq_length;reflexivity. Qed.
Lemma qm_sat8_range : forall x,-128<=qm_sat8 x<=127.
Proof. intro x;unfold qm_sat8,qm_clip;split;[apply Z.le_max_l|apply Z.max_lub;[lia|apply Z.le_min_l]]. Qed.
Lemma qm_quant_range : forall u oz lo hi,
 -128<=lo<=127 -> -128<=hi<=127 -> -128<=qm_quant_bits u oz lo hi<=127.
Proof.
 intros u oz lo hi Hl Hh;unfold qm_quant_bits.
 pose proof(qm_sat8_range(qm_sat16(qm_sat32(qm_signed_bits u-(1262485504-oz)))))as Hq.
 split.
 - apply Z.min_glb;[eapply Z.le_trans;[exact(proj1 Hq)|apply Z.le_max_l]|lia].
 - eapply Z.le_trans;[apply Z.le_min_r|lia].
Qed.
Lemma qm_lane_range : forall M pa pb az bz scale oz lo hi i,
 -128<=lo<=127 ->-128<=hi<=127 -> -128<=qm_lane M pa pb az bz scale oz lo hi i<=127.
Proof. intros;unfold qm_lane,qm_neon_lane;apply qm_quant_range;assumption. Qed.
Print Assumptions qm_values_equivalence.
Print Assumptions qm_values_length.
Print Assumptions qm_sat8_range.
Print Assumptions qm_quant_range.
Print Assumptions qm_lane_range.
