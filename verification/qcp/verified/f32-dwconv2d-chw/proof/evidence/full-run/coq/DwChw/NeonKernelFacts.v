From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelFacts Mask7IndexFacts NeonVectorPixelFacts.
Local Open Scope Z_scope.
Lemma dw_neon_position_exact:forall N w,w mod 4=0 ->4*((4*N-w)/4)=4*N-w.
Proof.
 intros N w Hw;pose proof(Z.div_mod w 4 ltac:(lia))as Hdiv;rewrite Hw in Hdiv.
 replace(4*N-w)with((N-w/4)*4)by lia;rewrite Z.div_mul by lia;ring.
Qed.
Lemma dw_neon_position_bounds:forall N w,0<=w<=4*N ->w mod 4=0 ->0<=(4*N-w)/4<=N.
Proof. intros;pose proof(dw_neon_position_exact N w H0);lia. Qed.
Lemma dw_neon_width_padding:forall F input zero weights params H N,
 dw_inputs F input zero weights params H N ->4*N+15<=18446744073709551615.
Proof.
 intros;pose proof(dw_input_geometry _ _ _ _ _ _ _ H0)as[HH[HN[HI HZ]]].
 unfold dw_footprint,dw_u64_limit in HZ;lia.
Qed.
Lemma dw_neon_round16_bounds:forall N,0<N ->
 4*N+15<=18446744073709551615 ->
 4*N<=((4*N+15)/16)*16<=18446744073709551615.
Proof.
 intros;pose proof(Z.div_mod(4*N+15)16 ltac:(lia));
 pose proof(Z.mod_pos_bound(4*N+15)16 ltac:(lia));lia.
Qed.
Lemma dw_neon_fp4_0:forall a b c d,dw_fp4 a b c d 0=a.
Proof. reflexivity. Qed.
Lemma dw_neon_fp4_3:forall a b c d,dw_fp4 a b c d 3=d.
Proof. reflexivity. Qed.
#[export] Hint Rewrite dw_neon_fp4_0 dw_neon_fp4_3:dw_neon_fields.
Print Assumptions dw_neon_position_exact.
Print Assumptions dw_neon_position_bounds.
Print Assumptions dw_neon_width_padding.
Print Assumptions dw_neon_round16_bounds.
Print Assumptions dw_neon_fp4_0.
Print Assumptions dw_neon_fp4_3.
