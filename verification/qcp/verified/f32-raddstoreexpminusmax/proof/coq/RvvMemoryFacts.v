From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Export RvvTailDomainFacts ProgramMemoryFacts NeonMemoryPart12.
Local Open Scope Z_scope.
Lemma emrm_acc_last:forall g get m a k,
 em_rvv_accumulate(S g)get m a k=
 em_rvv_acc_step(em_rvv_accumulate g get m a k)
 (em_rvv_value(get(k+4*Z.of_nat g))m)
 (em_rvv_value(get(k+4*Z.of_nat g+1))m)
 (em_rvv_value(get(k+4*Z.of_nat g+2))m)
 (em_rvv_value(get(k+4*Z.of_nat g+3))m).
Proof.
 induction g;intros get m a k.
 - cbn[em_rvv_accumulate];replace(k+4*Z.of_nat 0)with k by ring;reflexivity.
 - change(em_rvv_accumulate(S g)get m
    (em_rvv_acc_step a(em_rvv_value(get k)m)(em_rvv_value(get(k+1))m)
      (em_rvv_value(get(k+2))m)(em_rvv_value(get(k+3))m))(k+4)=
    em_rvv_acc_step(em_rvv_accumulate(S g)get m a k)
    (em_rvv_value(get(k+4*Z.of_nat(S g)))m)
    (em_rvv_value(get(k+4*Z.of_nat(S g)+1))m)
    (em_rvv_value(get(k+4*Z.of_nat(S g)+2))m)
    (em_rvv_value(get(k+4*Z.of_nat(S g)+3))m)).
   rewrite (IHg get m(em_rvv_acc_step a(em_rvv_value(get k)m)
    (em_rvv_value(get(k+1))m)(em_rvv_value(get(k+2))m)(em_rvv_value(get(k+3))m))(k+4)).
   cbn[em_rvv_accumulate].
   rewrite Nat2Z.inj_succ.
   replace(k+4+4*Z.of_nat g)with(k+4*Z.succ(Z.of_nat g))by lia.
   reflexivity.
Qed.

Definition em_rvv_pair_record(a:Recordvfloat32m4_t):fp32:=
 fp32_add(fp32_add(em_get_vfloat32m4_t a 0)(em_get_vfloat32m4_t a 1))
 (fp32_add(em_get_vfloat32m4_t a 2)(em_get_vfloat32m4_t a 3)).
Lemma emrm_acc_zero:forall F P M a,em_rvv_dup_p fp32_zero 16 a->em_rvv_acc_prefix F P M 0 a.
Proof.
 unfold em_rvv_dup_p,em_rvv_acc_prefix,em_rvv_active_float,em_rvv_acc_record.
 intros F P M a HA j Hj;rewrite HA by lia.
 cbn[Z.to_nat em_rvv_accumulate em_acc_record em_acc_zero em_acc0 em_acc1 em_acc2 em_acc3].
 unfold em_get_float32x4_t;assert(Hcases:j=0\/j=1\/j=2\/j=3)by lia.
 destruct Hcases as[He|[He|[He|He]]];subst j;reflexivity.
Qed.
Lemma emrm_output_prefix_zero:forall F P M Q O,em_rvv_output_prefix F P M Q 0 O=O.
Proof. reflexivity. Qed.
Lemma emrm_output_append:forall F P M Q done count O V,
 0<=done->0<=count->
 (forall j,0<=j<count->em_get_vfloat32m4_t V j=em_rvv_value(em_get F(P+4*(done+j)))(em_get F M))->
 em_rvv_write(em_rvv_output_prefix F P M Q done O)(Q+4*done)count V=
 em_rvv_output_prefix F P M Q(done+count)O.
Proof.
 intros F P M Q done count O V Hd Hc HV;unfold em_rvv_write.
 transitivity(em_output_write(em_rvv_output_prefix F P M Q done O)(Q+4*done)count
   (fun j=>em_rvv_value(em_get F(P+4*(done+j)))(em_get F M))).
 - apply em_output_write_ext;assumption.
 - apply em_rvv_prefix_append;assumption.
Qed.
Lemma emrm_slide_first:forall A offset vl B,
 em_rvv_slide_p A offset vl B->0<vl->0<=offset<16->em_get_vfloat32m4_t B 0=em_get_vfloat32m4_t A offset.
Proof.
 unfold em_rvv_slide_p,em_rvv_active_float;intros A offset vl B HB Hv Ho.
 rewrite HB by lia;unfold em_rvv_slide_lane;rewrite Z.add_0_l.
 assert(Hlt:Z.ltb offset 16=true)by(apply Z.ltb_lt;lia). rewrite Hlt;reflexivity.
Qed.
Print Assumptions emrm_acc_last.
Print Assumptions emrm_acc_zero.
Print Assumptions emrm_output_append.
Print Assumptions emrm_slide_first.

Lemma emrm_acc_step:forall F P M G A V,0<=G->
 em_rvv_acc_prefix F P M G A ->
 em_rvv_active_float 4 V(fun j=>em_rvv_value(em_get F(P+16*G+4*j))(em_get F M))->
 em_rvv_acc_prefix F P M(G+1)(em_rvv_add_tu A V 4).
Proof.
 intros F P M G A V HG HA HV.
 unfold em_rvv_acc_prefix,em_rvv_active_float in *;intros j Hj.
 unfold em_rvv_add_tu;rewrite em_get_make_vfloat32m4_t by lia.
 assert(Hlt:Z.ltb j 4=true)by(apply Z.ltb_lt;lia);rewrite Hlt,HA,HV by exact Hj.
 unfold em_rvv_acc_record.
 rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r.
 rewrite emrm_acc_last,Z2Nat.id by lia.
 unfold em_acc_record,em_rvv_acc_step,em_input.
 assert(Hcases:j=0\/j=1\/j=2\/j=3)by lia.
 destruct Hcases as[He|[He|[He|He]]];subst j;cbn[em_get_float32x4_t em_make_float32x4_t em_acc0 em_acc1 em_acc2 em_acc3];
 try replace(P+16*G+4*0)with(P+4*(4*G))by ring;
 try replace(P+16*G+4*1)with(P+4*(4*G+1))by ring;
 try replace(P+16*G+4*2)with(P+4*(4*G+2))by ring;
 try replace(P+16*G+4*3)with(P+4*(4*G+3))by ring;
 try replace(P+4*(4*G))with(P+4*(0+4*G))by ring;reflexivity.
Qed.
Lemma emrm_pair_record:forall F P M G A,
 em_rvv_acc_prefix F P M G A->
 em_rvv_pair_record A=em_rvv_pair_sum(em_rvv_accumulate(Z.to_nat G)(em_input F P)(em_get F M)em_acc_zero 0).
Proof.
 intros F P M G A HA;unfold em_rvv_acc_prefix,em_rvv_active_float in HA.
 unfold em_rvv_pair_record;rewrite !HA by lia.
 unfold em_rvv_acc_record,em_acc_record,em_rvv_pair_sum;reflexivity.
Qed.
Print Assumptions emrm_acc_step.
Print Assumptions emrm_pair_record.

Lemma emrm_sum_tail:forall F P M N A,0<=N->
 em_rvv_acc_prefix F P M(Z.quot N 4)A->
 em_rvv_sum N(em_input F P)(em_get F M)=
 em_rvv_tail(em_rvv_pair_record A)(Z.rem N 4)
 (em_rvv_value(em_get F(P+16*Z.quot N 4))(em_get F M))
 (em_rvv_value(em_get F(P+16*Z.quot N 4+4))(em_get F M))
 (em_rvv_value(em_get F(P+16*Z.quot N 4+8))(em_get F M)).
Proof.
 intros F P M N A HN HA;rewrite(emrm_pair_record F P M(Z.quot N 4)A HA).
 rewrite Z.quot_div_nonneg,Z.rem_mod_nonneg by lia.
 unfold em_rvv_sum,em_input.
 replace(P+4*(4*(N/4)))with(P+16*(N/4))by ring.
 replace(P+4*(4*(N/4)+1))with(P+16*(N/4)+4)by ring.
 replace(P+4*(4*(N/4)+2))with(P+16*(N/4)+8)by ring.
 reflexivity.
Qed.
Lemma emrm_eta16:forall V,make_record_vfloat32m4_t (V.(vfloat32m4_t_s0)) (V.(vfloat32m4_t_s1)) (V.(vfloat32m4_t_s2)) (V.(vfloat32m4_t_s3)) (V.(vfloat32m4_t_s4)) (V.(vfloat32m4_t_s5)) (V.(vfloat32m4_t_s6)) (V.(vfloat32m4_t_s7)) (V.(vfloat32m4_t_s8)) (V.(vfloat32m4_t_s9)) (V.(vfloat32m4_t_s10)) (V.(vfloat32m4_t_s11)) (V.(vfloat32m4_t_s12)) (V.(vfloat32m4_t_s13)) (V.(vfloat32m4_t_s14)) (V.(vfloat32m4_t_s15))=V.
Proof. intros [];reflexivity. Qed.
Print Assumptions emrm_sum_tail.
Print Assumptions emrm_eta16.
