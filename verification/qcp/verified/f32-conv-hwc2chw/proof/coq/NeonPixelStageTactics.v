From HwcConv Require Export neon_pixel_unit_goal NeonPixelStageFacts FastFrame AddressFacts.
From Coq Require Import Lia.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hc_stage_eta:forall R:Recordfloat32x4_t,
 make_record_float32x4_t R.(float32x4_t_s0)R.(float32x4_t_s1)R.(float32x4_t_s2)R.(float32x4_t_s3)=R.
Proof. intros [];reflexivity. Qed.
Lemma hc_stage_xbound:forall x width,0<width->0<=x->x<(width+1)/2->0<=2*x<width.
Proof.
 intros;pose proof(Z.div_mod(width+1)2 ltac:(lia));pose proof(Z.mod_pos_bound(width+1)2 ltac:(lia));lia.
Qed.
Ltac hc_stage_normalize:=
 try change(sizeof(FLOAT))with 4 in *;rewrite ?hc_stage_eta,?hc_stage_literal_zero in *;subst;
 repeat match goal with H:hc_footprint _ _|-_=>unfold hc_footprint,hc_u64_limit in H;destruct H as[?[??]]end;
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);
 try match goal with H:?x<(?width+1)/2|-_=>let B:=fresh "Hxb"in assert(B:0<=2*x<width)by(apply hc_stage_xbound;assumption)end;
 repeat multimatch goal with
 | H:context[unsigned_last_nbits ?v 64]|-_=>
   let E:=fresh "Hwrap"in
   assert(E:unsigned_last_nbits v 64=v)by
    (apply unsigned_last_nbits_eq;change((0<=v<18446744073709551616)%Z);lia);
   rewrite E in H;clear E
 end.
Ltac hc_stage_closed_z a:=
 lazymatch a with
 | Z0=>idtac
 | Zpos ?p=>let rec go q:=lazymatch q with xH=>idtac|xO ?r=>go r|xI ?r=>go r end in go p
 | Zneg ?p=>let rec go q:=lazymatch q with xH=>idtac|xO ?r=>go r|xI ?r=>go r end in go p
 end.
Ltac hc_stage_numbers:=
 repeat match goal with
 | |-context[Z.div ?a ?b]=>hc_stage_closed_z a;hc_stage_closed_z b;
   let z:=eval vm_compute in((a/b)%Z)in change((a/b)%Z)with z
 | |-context[Z.modulo ?a ?b]=>hc_stage_closed_z a;hc_stage_closed_z b;
   let z:=eval vm_compute in((a mod b)%Z)in change((a mod b)%Z)with z
 end.
Ltac hc_stage_dup:=
 hc_stage_numbers;
 unfold hc_neon_dup4;intros;
 match goal with H:hc_neon_dup4 ?R ?v|-hc_fget ?R ?j=_=>rewrite(H j ltac:(lia))end;
 unfold hc_neon_row_input;
 repeat match goal with|-context[if ?b then _ else _]=>destruct b eqn:? end;
 try match goal with H:Z.ltb _ _=true|-_=>apply Z.ltb_lt in H end;
 try match goal with H:Z.ltb _ _=false|-_=>apply Z.ltb_ge in H end;
 try solve[exfalso;lia];
 first[reflexivity|f_equal;ring].
Ltac hc_stage_load:=
 hc_stage_numbers;
 unfold hc_neon_load4;intros;
 match goal with H:hc_neon_load4 ?R ?F ?p|-hc_fget ?R ?j=_=>rewrite(H j ltac:(lia))end;
 f_equal;ring.
Ltac hc_stage_solve:=
 hc_stage_normalize;
 lazymatch goal with|-context[hc_neon_rows_acc ?R ?F ?p0 ?p1 ?p2 ?w ?width ?x ?s]=>
 let H:=fresh "Hstage"in assert(H:hc_neon_rows_acc R F p0 p1 p2 w width x s)by
 (first[apply hc_stage_initial;assumption|
 let k:=eval vm_compute in((s-1)%Z)in
 replace s with((k+1)%Z)by lia;
 first[eapply(hc_stage_skip R F p0 p1 p2 w width x k);[cbn;lia|cbn;lia|eassumption]|
 eapply(hc_stage_next R _ _ _ _ _ _ _ F p0 p1 p2 w width x k);[cbn;lia|cbn;lia|eassumption|eassumption|hc_stage_load|hc_stage_load|hc_stage_load|hc_stage_dup|hc_stage_dup|hc_stage_dup]]])end;
 entailer!.
