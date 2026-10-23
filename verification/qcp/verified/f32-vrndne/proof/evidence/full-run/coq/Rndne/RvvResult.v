From Coq Require Import ZArith Lia List Reals.
From QcpRvv32 Require Import RvvStoreModel RvvResultBridge.
From AUXLib Require Import ListLib.
From Rndne Require Import Model ProgramModel VectorModel Literal.
Import ListNotations.
Local Open Scope Z_scope.
Definition rndne_rvv_lane (vl:Z) (a:list fp32) (i:nat) : fp32 :=
 let ix:=Z.of_nat i in
 let x:=rvv_read_value ix vl a in
 let ab:=rndne_active___riscv_vfabs_v_f32m8 ix vl x in
 let cmp:=rndne_active___riscv_vmfgt_vf_f32m8_b4 ix vl ab (fp32_of_real (8388608.0)%R) in
 let plus:=rndne_active___riscv_vfadd_vf_f32m8 ix vl ab (fp32_of_real (8388608.0)%R) in
 let minus:=rndne_active___riscv_vfsub_vf_f32m8 ix vl plus (fp32_of_real (8388608.0)%R) in
 let signed:=rndne_active___riscv_vfsgnj_vv_f32m8 ix vl minus x in
 let merged:=rndne_active___riscv_vmerge_vvm_f32m8 ix vl signed x cmp in
 let is_nan:=rndne_active_self_ne ix vl x in
 let quiet:=rndne_active___riscv_vor_vx_u32m8 ix vl (bits_of_fp32 x) 4194304 in
 rndne_active___riscv_vmerge_vvm_f32m8 ix vl merged (fp32_of_bits quiet) is_nan.
Lemma rndne_rvv_lane_active : forall vl a i,0<=Z.of_nat i<vl ->
 rndne_rvv_lane vl a i=rndne_rvv (Znth (Z.of_nat i) a fp32_zero).
Proof.
 intros vl a i Hi. unfold rndne_rvv_lane.
 unfold rndne_active___riscv_vfabs_v_f32m8,rndne_active___riscv_vmfgt_vf_f32m8_b4,
 rndne_active___riscv_vfadd_vf_f32m8,rndne_active___riscv_vfsub_vf_f32m8,
 rndne_active___riscv_vfsgnj_vv_f32m8,rndne_active___riscv_vmerge_vvm_f32m8,
 rndne_active_self_ne,rndne_active___riscv_vor_vx_u32m8,rvv_read_value.
 assert(Ht:(Z.of_nat i <? vl)=true)by(apply Z.ltb_lt;lia).
 rewrite Ht,rndne_magic_decimal. cbv zeta.
 unfold rndne_rvv,rndne_quiet;reflexivity.
Qed.
Definition rndne_rvv_result32 (vl:Z)(a:list fp32):list fp32 :=
 map (rndne_rvv_lane vl a)(seq 0 32).
Lemma rndne_rvv_result_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl(rndne_rvv_result32 vl a)=rndne_rvv_values vl a.
Proof.
 intros vl a Hv Ha. apply nth_ext with(d:=fp32_zero)(d':=fp32_zero).
 - unfold rvv_take,rndne_rvv_result32,rndne_rvv_values.
   rewrite !length_firstn,!length_map,length_seq,Zlength_correct in *.
   rewrite !Nat.min_l by lia;reflexivity.
 - intros i Hi. unfold rvv_take,rndne_rvv_result32 in *.
   rewrite length_firstn,length_map,length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   rewrite rndne_rvv_lane_active by lia. unfold Znth. rewrite Nat2Z.id.
   unfold rndne_rvv_values. rewrite nth_firstn by lia.
   symmetry. rewrite nth_indep with(d':=rndne_rvv fp32_zero)by(rewrite length_map;rewrite Zlength_correct in Ha;lia).
   exact(map_nth rndne_rvv a fp32_zero i).
Qed.
Definition rndne_rvv_packed (vl:Z)(a:list fp32):list fp32 :=
 rvv_pack32
 (rndne_rvv_lane vl a 0%nat)
 (rndne_rvv_lane vl a 1%nat)
 (rndne_rvv_lane vl a 2%nat)
 (rndne_rvv_lane vl a 3%nat)
 (rndne_rvv_lane vl a 4%nat)
 (rndne_rvv_lane vl a 5%nat)
 (rndne_rvv_lane vl a 6%nat)
 (rndne_rvv_lane vl a 7%nat)
 (rndne_rvv_lane vl a 8%nat)
 (rndne_rvv_lane vl a 9%nat)
 (rndne_rvv_lane vl a 10%nat)
 (rndne_rvv_lane vl a 11%nat)
 (rndne_rvv_lane vl a 12%nat)
 (rndne_rvv_lane vl a 13%nat)
 (rndne_rvv_lane vl a 14%nat)
 (rndne_rvv_lane vl a 15%nat)
 (rndne_rvv_lane vl a 16%nat)
 (rndne_rvv_lane vl a 17%nat)
 (rndne_rvv_lane vl a 18%nat)
 (rndne_rvv_lane vl a 19%nat)
 (rndne_rvv_lane vl a 20%nat)
 (rndne_rvv_lane vl a 21%nat)
 (rndne_rvv_lane vl a 22%nat)
 (rndne_rvv_lane vl a 23%nat)
 (rndne_rvv_lane vl a 24%nat)
 (rndne_rvv_lane vl a 25%nat)
 (rndne_rvv_lane vl a 26%nat)
 (rndne_rvv_lane vl a 27%nat)
 (rndne_rvv_lane vl a 28%nat)
 (rndne_rvv_lane vl a 29%nat)
 (rndne_rvv_lane vl a 30%nat)
 (rndne_rvv_lane vl a 31%nat).
Lemma rndne_rvv_packed_prefix : forall vl a,0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl(rndne_rvv_packed vl a)=rndne_rvv_values vl a.
Proof. exact rndne_rvv_result_prefix. Qed.
Print Assumptions rndne_rvv_lane_active.
Print Assumptions rndne_rvv_packed_prefix.
