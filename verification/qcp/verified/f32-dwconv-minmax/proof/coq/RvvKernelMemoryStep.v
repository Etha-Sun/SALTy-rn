From Coq Require Import ZArith Lia List.
From Dwconv Require Import RvvKernelMemorySupport RvvKernelStepFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_add dw_rvv_mul dw_rvv_fma fp32_max_number fp32_min_number dw_rvv_merge dw_rvv_nanmask.
Ltac dwrm_subst_float lo hi := repeat progress multimatch goal with H : ?x = ?y |- _ =>
 let T:=type of x in lazymatch T with fp32=>first[is_var x;tryif constr_eq x lo then fail else idtac;tryif constr_eq x hi then fail else idtac;subst x|is_var y;tryif constr_eq y lo then fail else idtac;tryif constr_eq y hi then fail else idtac;subst y]end end.
Ltac dwrm_specialize_active lo hi :=
 repeat match goal with
 | H:dw_active ?vl ?i _ _|-_=>unfold dw_active in H;first[specialize(H ltac:(lia))|clear H]
 | H:dw_active_mask ?vl ?i _ _|-_=>unfold dw_active_mask in H;first[specialize(H ltac:(lia))|clear H]
 end;
 idtac "ACTIVE_DONE";dwrm_subst_float lo hi;dw_subst_z;idtac "SUBST_DONE".

Lemma proof_of_test_rvv_entail_wit_6:Dwconv.rvv_unit_goal.test_rvv_entail_wit_6.
Proof.
 unfold Dwconv.rvv_unit_goal.test_rvv_entail_wit_6;left;dw_intro.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;rewrite ?sizeof_float in *;unfold dw_same in *.
 subst channels weights input_stride output_increment input_pixel_stride zero input input_offset output i0 i1 i2 w.
 rewrite <-PreH384,<-PreH385 in *.
 pose proof(dw_take_positive c ltac:(lia))as Htake.
 idtac "STAGE span". Time prop_apply(dw_channels_within_word F P W D ltac:(assumption));Intros.
 assert(Hsmall:unsigned_last_nbits(c-vl)64=c-vl).
 { apply unsigned_last_nbits_eq;change(2^64)with 18446744073709551616;lia. }
 rewrite Hsmall.
 set(k:=dw_channels D-c)in *.
 set(pixel:=dw_width D-output_width)in *.
 assert(Hk:0<=k)by(unfold k;lia).
 assert(Hmod:k mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;assumption).
 idtac "STAGE packet". assert(Hpacket:sublist 0 vl(dw_pack16 r0_19 r1_19 r2_19 r3_19 r4_19 r5_19 r6_19 r7_19 r8_19 r9_19 r10_19 r11_19 r12_19 r13_19 r14_19 r15_19)=
 map(fun i=>dw_value false F P D pixel(Z.of_nat i)lo hi)(seq(Z.to_nat k)(Z.to_nat vl))).
 {
  assert(Hvl:vl=1\/vl=2\/vl=3\/vl=4)by lia.
  destruct Hvl as[Hvl|[Hvl|[Hvl|Hvl]]];rewrite Hvl in *;clear Hvl.
  all:time dwrm_specialize_active lo hi.
  all:time(unfold sublist,dw_pack16;replace(Z.to_nat 0)with 0%nat by reflexivity;try replace(Z.to_nat 1)with 1%nat by reflexivity;try replace(Z.to_nat 2)with 2%nat by reflexivity;try replace(Z.to_nat 3)with 3%nat by reflexivity;try replace(Z.to_nat 4)with 4%nat by reflexivity;cbn[firstn skipn seq map]).
  all:time(repeat rewrite Nat2Z.inj_succ;rewrite ?Z2Nat.id by lia).
  all:try replace(Z.succ(Z.succ(Z.succ k)))with(k+3)by lia.
  all:try replace(Z.succ(Z.succ k))with(k+2)by lia.
  all:try replace(Z.succ k)with(k+1)by lia.
  all:try rewrite <-(dwrm_block_lane F P D pixel k 1 lo hi Hk Hmod ltac:(lia)).
  all:try rewrite <-(dwrm_block_lane F P D pixel k 2 lo hi Hk Hmod ltac:(lia)).
  all:try rewrite <-(dwrm_block_lane F P D pixel k 3 lo hi Hk Hmod ltac:(lia)).
  all:pose proof(dwrm_block_lane F P D pixel k 0 lo hi Hk Hmod ltac:(lia))as Hlane0;
  rewrite Z.add_0_r in Hlane0;rewrite<-Hlane0;
  unfold dw_rvv_lane,dw_repaired_max,dw_repaired_min;
  repeat first[solve[reflexivity|lia|ring]|f_equal].
  all:lazymatch goal with|-?G=>idtac "PK_REMAIN" G end.
 }
 idtac "STAGE packet-done". rewrite Hpacket.
 replace(dw_channels D-(c-vl))with(k+vl)by(unfold k;ring).
 unfold dw_rvv_progress;rewrite <-dw_progress_chunk by lia.
 assert(Halign:dw_aligned_cursor(dw_channels D)c)by(left;exact Hmod).
 pose proof(dw_aligned_after_take(dw_channels D)c ltac:(lia)Halign)as Hnextalign.
 rewrite<-PreH406 in Hnextalign.
 assert(Hnextcursor:dw_rvv_weight_cursor(dw_channels D)(c-vl)(dw_weights D+16*k+64)(dw_weights D)).
 { rewrite PreH406;apply dw_rvv_weight_cursor_step;[lia|right;unfold k;ring]. }
 change(((4+4)+4)+4)with 16.
 change(16*4)with 64.
 replace(dw_weights D+4*k*4+64)with(dw_weights D+16*k+64)by ring.
 dw_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6.
