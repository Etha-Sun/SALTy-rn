From X32Transpose Require Export NeonProgramModel.
From Coq Require Import ZArith Lia Bool Ring.
Local Open Scope Z_scope.
Lemma xt_u64_is_mod64:forall x,unsigned_last_nbits x 64=xt_mod64 x.
Proof. intros;unfold unsigned_last_nbits,xt_mod64;reflexivity. Qed.
Lemma xt_mod_add_l:forall x y,xt_mod64(xt_mod64 x+y)=xt_mod64(x+y).
Proof. intros;unfold xt_mod64;rewrite Z.add_mod_idemp_l by lia;reflexivity. Qed.
Lemma xt_mod_add_r:forall x y,xt_mod64(x+xt_mod64 y)=xt_mod64(x+y).
Proof. intros;unfold xt_mod64;rewrite Z.add_mod_idemp_r by lia;reflexivity. Qed.
Lemma xt_mod_current_input:forall G k r,
 xt_mod64(xt_current_input G k r)=xt_mod64(xt_input G+4*k+r*xt_input_stride G).
Proof.
 intros;unfold xt_current_input.
 destruct(andb(Z.eqb k 0)(Z.eqb r 0))eqn:E.
 - apply Bool.andb_true_iff in E;destruct E as[E1 E2];apply Z.eqb_eq in E1;apply Z.eqb_eq in E2;subst;f_equal;ring.
 - unfold xt_mod64;apply Z.mod_mod;lia.
Qed.
Lemma xt_mod_current_output:forall G k r,
 xt_mod64(xt_current_output G k r)=xt_mod64(xt_output_base G+k*xt_output_stride G+4*r).
Proof.
 intros;unfold xt_current_output.
 destruct(andb(Z.eqb k 0)(Z.eqb r 0))eqn:E.
 - apply Bool.andb_true_iff in E;destruct E as[E1 E2];apply Z.eqb_eq in E1;apply Z.eqb_eq in E2;subst;f_equal;ring.
 - unfold xt_mod64;apply Z.mod_mod;lia.
Qed.
Lemma xt_current_input_row_step:forall G k r step,
 0<=r->0<step->
 xt_mod64(xt_current_input G k r+xt_mod64(step*xt_input_stride G))=xt_current_input G k(r+step).
Proof.
 intros G k r step Hr Hs.
 rewrite<-(xt_mod_add_l(xt_current_input G k r)(xt_mod64(step*xt_input_stride G))).
 rewrite xt_mod_current_input,xt_mod_add_l,xt_mod_add_r.
 unfold xt_current_input.
 assert(E:Z.eqb(r+step)0=false)by(apply Z.eqb_neq;lia).
 rewrite E,Bool.andb_false_r;f_equal;ring.
Qed.
Lemma xt_current_output_row_step:forall G k r step,
 0<=r->0<step->
 xt_mod64(xt_current_output G k r+4*step)=xt_current_output G k(r+step).
Proof.
 intros G k r step Hr Hs.
 rewrite<-(xt_mod_add_l(xt_current_output G k r)(4*step)).
 rewrite xt_mod_current_output,xt_mod_add_l.
 unfold xt_current_output.
 assert(E:Z.eqb(r+step)0=false)by(apply Z.eqb_neq;lia).
 rewrite E,Bool.andb_false_r;f_equal;ring.
Qed.
Lemma xt_neon_input_reset_step:forall G k r,
 0<=k->r=xt_round_down(xt_height G)2->
 xt_mod64(xt_current_input G k r+xt_neon_input_reset G)=xt_current_input G(k+2)0.
Proof.
 intros G k r Hk Hr;unfold xt_neon_input_reset.
 rewrite<-(xt_mod_add_l(xt_current_input G k r)(xt_mod64(8-xt_round_down(xt_height G)2*xt_input_stride G))).
 rewrite xt_mod_current_input,xt_mod_add_l,xt_mod_add_r.
 unfold xt_current_input.
 assert(E:Z.eqb(k+2)0=false)by(apply Z.eqb_neq;lia).
 rewrite E;cbn [andb];f_equal;rewrite Hr;ring.
Qed.
Lemma xt_neon_output_reset_step:forall G k r,
 0<=k->r=xt_round_down(xt_height G)2->
 xt_mod64(xt_current_output G k r+xt_neon_output_reset G)=xt_current_output G(k+2)0.
Proof.
 intros G k r Hk Hr;unfold xt_neon_output_reset.
 rewrite<-(xt_mod_add_l(xt_current_output G k r)(xt_mod64(2*xt_output_stride G-xt_round_down(xt_height G)2*4))).
 rewrite xt_mod_current_output,xt_mod_add_l,xt_mod_add_r.
 unfold xt_current_output.
 assert(E:Z.eqb(k+2)0=false)by(apply Z.eqb_neq;lia).
 rewrite E;cbn [andb];f_equal;rewrite Hr;ring.
Qed.
Print Assumptions xt_u64_is_mod64.
Print Assumptions xt_mod_add_l.
Print Assumptions xt_mod_add_r.
Print Assumptions xt_mod_current_input.
Print Assumptions xt_mod_current_output.
Print Assumptions xt_current_input_row_step.
Print Assumptions xt_current_output_row_step.
Print Assumptions xt_neon_input_reset_step.
Print Assumptions xt_neon_output_reset_step.
