From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export RecordLoopModel KernelFacts ProgramFacts.
Import ListNotations. Local Open Scope Z_scope.
Lemma qm_record_compute_loaded_lane:forall M pa pb vl A B R az bz scale oz lo hi,
 (forall p,rd_present M p->-128<=rd_get M p<=127)->
 rd_window M pa vl->rd_window M pb vl->
 qm_record_load_match M pa vl A->qm_record_load_match M pb vl B->
 qm_record_compute_match vl A B R az bz scale oz lo hi->
 -128<=az<=127->-128<=bz<=127->
 forall i,0<=i<vl->qm_record_lanes_vint8m2_t R i=qm_rvv_at M pa pb az bz scale oz lo hi i.
Proof.
 intros M pa pb vl A B R az bz scale oz lo hi HM HA HB HLA HLB HC HAZ HBZ i Hi.
 unfold qm_record_compute_match in HC;rewrite HC by exact Hi.
 unfold qm_record_load_match in HLA,HLB;rewrite HLA,HLB by exact Hi.
 rewrite !qm_sub16_byte by(first[assumption|apply HM;first[apply HA|apply HB];exact Hi]).
 unfold qm_rvv_at,qm_rvv_lane;rewrite !Z.sub_0_r;reflexivity.
Qed.
Lemma qm_record_list32_seq:forall R,
 qm_record_list32 R=map(fun i=>qm_record_lanes_vint8m2_t R(Z.of_nat i))(seq 0 32).
Proof. intro R;reflexivity. Qed.
Lemma qm_firstn_seq_bounded:forall(n m k:nat),(n<=m)%nat->firstn n(seq k m)=seq k n.
Proof.
 induction n;intros[|m]k H;cbn;try reflexivity;try lia.
 f_equal;apply IHn;lia.
Qed.
Lemma qm_record_prefix_seq:forall vl R,0<=vl<=32->
 qm_record_prefix vl R=map(fun i=>qm_record_lanes_vint8m2_t R(Z.of_nat i))(seq 0(Z.to_nat vl)).
Proof.
 intros vl R Hvl;unfold qm_record_prefix,qm_take32;rewrite qm_record_list32_seq,firstn_map.
 rewrite qm_firstn_seq_bounded;[reflexivity|change(Z.to_nat vl<=Z.to_nat 32)%nat;apply Z2Nat.inj_le;lia].
Qed.
Lemma qm_record_prefix_loaded:forall M pa pb vl A B R az bz scale oz lo hi,
 0<=vl<=32->(forall p,rd_present M p->-128<=rd_get M p<=127)->
 rd_window M pa vl->rd_window M pb vl->
 qm_record_load_match M pa vl A->qm_record_load_match M pb vl B->
 qm_record_compute_match vl A B R az bz scale oz lo hi->
 -128<=az<=127->-128<=bz<=127->
 qm_record_prefix vl R=qm_rvv_values vl M pa pb az bz scale oz lo hi.
Proof.
 intros M pa pb vl A B R az bz scale oz lo hi HV HM HA HB HLA HLB HC HAZ HBZ.
 rewrite qm_record_prefix_seq by exact HV;unfold qm_rvv_values;apply map_ext_in;intros i Hi.
 apply in_seq in Hi;cbn in Hi.
 apply(qm_record_compute_loaded_lane M pa pb vl A B R az bz scale oz lo hi HM HA HB HLA HLB HC HAZ HBZ).
 pose proof(Z2Nat.id vl ltac:(lia))as E;lia.
Qed.
Lemma qm_record_prefix_loaded_neon:forall M pa pb vl A B R az bz scale oz lo hi,
 0<=vl<=32->(forall p,rd_present M p->-128<=rd_get M p<=127)->
 rd_window M pa vl->rd_window M pb vl->
 qm_record_load_match M pa vl A->qm_record_load_match M pb vl B->
 qm_record_compute_match vl A B R az bz scale oz lo hi->
 -128<=az<=127->-128<=bz<=127->-32768<=oz<=32767->
 qm_record_prefix vl R=qm_values vl M pa pb az bz scale oz lo hi.
Proof.
 intros;rewrite qm_values_equivalence by assumption;eapply qm_record_prefix_loaded;eassumption.
Qed.
Print Assumptions qm_record_compute_loaded_lane.
Print Assumptions qm_record_list32_seq.
Print Assumptions qm_firstn_seq_bounded.
Print Assumptions qm_record_prefix_seq.
Print Assumptions qm_record_prefix_loaded.
Print Assumptions qm_record_prefix_loaded_neon.
