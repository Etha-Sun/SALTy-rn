From Coq Require Import ZArith Lia List.
From Dwconv Require Export RvvKernelFacts.
Import ListNotations. Local Open Scope Z_scope.
Local Opaque dw_rvv_add dw_rvv_mul dw_rvv_fma fp32_max_number fp32_min_number dw_rvv_merge dw_rvv_nanmask.
Lemma dwrm_block_divmod:forall k i,0<=k->k mod 4=0->0<=i<4->
 (k+i)/4=k/4 /\ Z.modulo(k+i)4=i /\ k=4*(k/4).
Proof.
 intros k i Hk Hr Hi;pose proof(Z.div_mod k 4 ltac:(lia))as Hd;rewrite Hr in Hd.
 assert(Hq:(k+i)/4=k/4)by(symmetry;apply Z.div_unique_pos with(r:=i);lia).
 split;[exact Hq|];split;[|lia].
 pose proof(Z.div_mod(k+i)4 ltac:(lia));rewrite Hq in H;lia.
Qed.
Lemma dwrm_block_lane:forall F P D pixel k i lo hi,
 0<=k->k mod 4=0->0<=i<4->
 dw_rvv_lane
 (dw_load_lane F(dw_weights D+16*k)i)
 (dw_load_lane F(dw_input_row P D pixel 0+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+16)i)
 (dw_load_lane F(dw_input_row P D pixel 1+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+32)i)
 (dw_load_lane F(dw_input_row P D pixel 2+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+48)i)lo hi=
 dw_value false F P D pixel(k+i)lo hi.
Proof.
 intros F P D pixel k i lo hi Hk Hr Hi.
 pose proof(dwrm_block_divmod k i Hk Hr Hi)as[Hq[Hm Hdiv]].
 unfold dw_value,dw_weight,dw_input_value,dw_load_lane;rewrite Hq,Hm.
 f_equal;f_equal;lia.
Qed.
Lemma dwrm_rvv_expression:forall F P D pixel k w i0 i1 i2 i lo hi,
 0<=k->k mod 4=0->0<=i<4->
 w=dw_weights D+16*k->
 i0=dw_input_row P D pixel 0+4*k->
 i1=dw_input_row P D pixel 1+4*k->
 i2=dw_input_row P D pixel 2+4*k->
 dw_rvv_lane (dw_load_lane F w i)
 (dw_load_lane F i0 i)(dw_load_lane F(w+4*4)i)
 (dw_load_lane F i1 i)(dw_load_lane F(w+(4+4)*4)i)
 (dw_load_lane F i2 i)(dw_load_lane F(w+((4+4)+4)*4)i)lo hi=
 dw_value false F P D pixel(k+i)lo hi.
Proof.
 intros F P D pixel k w i0 i1 i2 i lo hi Hk Hr Hi Hw H0 H1 H2;subst w i0 i1 i2.
 eapply eq_trans;[|apply(dwrm_block_lane F P D pixel k i lo hi Hk Hr Hi)].
 unfold dw_load_lane;repeat first[solve[reflexivity|lia|ring]|f_equal].
Qed.
Print Assumptions dwrm_block_divmod.
Print Assumptions dwrm_block_lane.
Print Assumptions dwrm_rvv_expression.
