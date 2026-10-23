From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Export NeonMemorySupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac cvt_numeric_resources :=
 cbv beta iota zeta delta[Z.add Z.mul Pos.mul Pos.add Pos.add_carry Pos.succ];
 repeat first[progress rewrite sepcon_emp_equiv|match goal with |- context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P)end];
 opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac cvt_numeric_frame :=
 rewrite ?local_field_address,?Z.add_0_r;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |cvt_numeric_resources]|cvt_numeric_resources].
Ltac cvt_numeric_or := first[solve[cvt_numeric_frame]
 |lazymatch goal with |- ?P |-- (?Q || ?R) =>
 first[solve[eapply(derivable1_trans P Q(Q||R));[cvt_numeric_or|apply derivable1_orp_intros1]]
 |solve[eapply(derivable1_trans P R(Q||R));[cvt_numeric_or|apply derivable1_orp_intros2]]]
 end].
Lemma cvt_prefix_two4 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) **
 FloatArray.full(p+4*k)4[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale] **
 FloatArray.full((p+4*k)+16)4[cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale] |--
 FloatArray.full p(k+8)(cvt_values(k+8)A z scale).
Proof.
 intros p k A z scale Hk.
 pose proof(cvt_prefix_cells8 p k A z scale Hk)as Hmerge.
 rewrite !cvt_float_full4_cells.
 eapply derivable1_trans;[|exact Hmerge].
 replace(((p+4*k)+16)+4*0)with((p+4*k)+4*4)by lia.
 replace(((p+4*k)+16)+4*1)with((p+4*k)+4*5)by lia.
 replace(((p+4*k)+16)+4*2)with((p+4*k)+4*6)by lia.
 replace(((p+4*k)+16)+4*3)with((p+4*k)+4*7)by lia.
 cvt_numeric_frame.
Qed.
Print Assumptions cvt_prefix_two4.
