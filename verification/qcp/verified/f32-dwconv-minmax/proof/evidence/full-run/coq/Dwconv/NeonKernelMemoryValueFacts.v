From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryWeights ProgramChunkFacts NeonTailModel.
Import ListNotations Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_neon_lane dw_arm_add dw_arm_mul dw_arm_fma dw_arm_max dw_arm_min.
Lemma dwm_block_divmod:forall k i,0<=k->Z.rem k 4=0->0<=i<4->
 (k+i)/4=k/4 /\ Z.modulo(k+i)4=i /\ k=4*(k/4).
Proof.
 intros k i Hk Hr Hi.
 rewrite Z.rem_mod_nonneg in Hr by lia.
 pose proof(Z.div_mod k 4 ltac:(lia))as Hdiv;rewrite Hr in Hdiv.
 assert(Hq:(k+i)/4=k/4).
 { symmetry;apply Z.div_unique_pos with(r:=i);lia. }
 split;[exact Hq|];split;[|lia].
 pose proof(Z.div_mod(k+i)4 ltac:(lia));rewrite Hq in H;lia.
Qed.
Lemma dwm_block_lane:forall F P D pixel k i lo hi,
 0<=k->Z.rem k 4=0->0<=i<4->
 dw_neon_lane
 (dw_load_lane F(dw_weights D+16*k)i)
 (dw_load_lane F(dw_input_row P D pixel 0+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+16)i)
 (dw_load_lane F(dw_input_row P D pixel 1+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+32)i)
 (dw_load_lane F(dw_input_row P D pixel 2+4*k)i)
 (dw_load_lane F(dw_weights D+16*k+48)i)lo hi=
 dw_neon_value F P D pixel(k+i)lo hi.
Proof.
 intros F P D pixel k i lo hi Hk Hr Hi.
 pose proof(dwm_block_divmod k i Hk Hr Hi)as[Hq[Hm Hdiv]].
 unfold dw_neon_value,dw_value,dw_weight,dw_input_value,dw_load_lane.
 rewrite Hq,Hm.
 f_equal;f_equal;lia.
Qed.
Print Assumptions dwm_block_divmod.
Print Assumptions dwm_block_lane.
