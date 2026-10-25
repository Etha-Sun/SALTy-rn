From Coq Require Import ZArith Lia.
From MaxPool Require Export KernelState KernelFacts KernelTail MemoryViews PackModel RvvMemoryModel RvvStepFacts PassFacts.
Local Open Scope Z_scope.
Local Opaque mp_first mp_more mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_load_lane.
Definition mp_loop_first_lane(F:MPFloatMap)(PT:MPPtrMap)
 (table offset K done lane:Z)(lo hi:fp32):fp32:=
 mp_first lo hi(mp_tree9(fun row=>mp_load_lane F(mp_row_cursor PT table offset K 0 row done)lane)).
Lemma mp_loop_tree_cursor:forall F PT table offset K group done lane,
 mp_tree9(fun row=>mp_load_lane F(mp_row_cursor PT table offset K group row done)lane)=
 mp_group_lane F PT table offset K group(done+lane).
Proof. intros;rewrite mp_group_lane_rows;unfold mp_tree9;rewrite !mp_row_load_cursor;reflexivity. Qed.
Lemma mp_loop_first_lane_correct:forall F PT table offset K done lane lo hi,
 mp_loop_first_lane F PT table offset K done lane lo hi=
 mp_after_groups F PT table offset K 0(done+lane)lo hi.
Proof. intros;unfold mp_loop_first_lane;rewrite mp_after_groups_zero;f_equal;apply mp_loop_tree_cursor. Qed.
Lemma mp_loop_partial_zero:forall F PT old table offset output K channels lo hi,
 mp_pass_partial F PT old table offset output K channels 0 0 lo hi=old.
Proof. reflexivity. Qed.
Lemma mp_loop_store_first4:forall F PT old table offset output K channels done lo hi,
 0<=done->
 mp_write(mp_pass_partial F PT old table offset output K channels 0 done lo hi)
 (mp_output_cursor output done)4
 (mp_pack4(mp_loop_first_lane F PT table offset K done 0 lo hi)
 (mp_loop_first_lane F PT table offset K done 1 lo hi)
 (mp_loop_first_lane F PT table offset K done 2 lo hi)
 (mp_loop_first_lane F PT table offset K done 3 lo hi))=
 mp_pass_partial F PT old table offset output K channels 0(done+4)lo hi.
Proof.
 intros;apply mp_rvv_write_step;[assumption|lia|].
 intros j Hj;assert(Hcases:j=0\/j=1\/j=2\/j=3)by lia;destruct Hcases as[Hj0|[Hj1|[Hj2|Hj3]]];subst j;
 cbn[mp_pack4];apply mp_loop_first_lane_correct.
Qed.
Lemma mp_loop_mod4_step:forall n,(n+4)mod 4=n mod 4.
Proof. intro;rewrite Z.add_mod by lia;cbn;rewrite Z.add_0_r,Z.mod_mod by lia;reflexivity. Qed.
Lemma mp_loop_rem4_step:forall n,0<=n->Z.rem(n+4)4=Z.rem n 4.
Proof. intros;rewrite !Z.rem_mod_nonneg by lia;apply mp_loop_mod4_step. Qed.
Print Assumptions mp_loop_tree_cursor.
Print Assumptions mp_loop_first_lane_correct.
Print Assumptions mp_loop_partial_zero.
Print Assumptions mp_loop_store_first4.
