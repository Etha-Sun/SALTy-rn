From Coq Require Import ZArith Lia Lra Reals FunctionalExtensionality.
From DwChw Require Export ProgressModel RvvKernelFacts.
Local Open Scope Z_scope.

(* Migrated from verified/f32-vcmul Model.v:vcmul_c_zero. *)
Lemma dw_c_literal_zero:fp32_of_real(0.0%R)=fp32_zero.
Proof.
 replace(0.0%R)with(0%R)by(unfold Q2R;simpl;ring).
 unfold fp32_of_real,rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0,Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra;reflexivity.
Qed.
Lemma dw_row_base_before:forall input zero H N y,y<0->dw_row_base input zero H N y=zero.
Proof. intros;unfold dw_row_base;destruct(Z.ltb_spec y 0);[reflexivity|lia]. Qed.
Lemma dw_row_base_after:forall input zero H N y,H<=y->dw_row_base input zero H N y=zero.
Proof.
 intros;unfold dw_row_base;destruct(Z.ltb_spec y 0);[reflexivity|];
 destruct(Z.leb_spec H y);[reflexivity|lia].
Qed.
Lemma dw_row_base_inside:forall input zero H N y,0<=y<H->
 dw_row_base input zero H N y=input+4*y*N.
Proof.
 intros;unfold dw_row_base;destruct(Z.ltb_spec y 0);[lia|];
 destruct(Z.leb_spec H y);[lia|reflexivity].
Qed.
Lemma dw_prev_at_zero:forall F p,dw_prev F p 0=fp32_zero.
Proof. reflexivity. Qed.
Lemma dw_progress_start:forall R O output H N,0<N->dw_progress R O output H N 0 0=O.
Proof.
 intros R O output H N HN;apply functional_extensionality;intro p;unfold dw_progress.
 destruct(Z.leb_spec output p);[|reflexivity].
 destruct(Z.ltb_spec p(output+4*H*N));[|reflexivity].
 destruct(Z.eqb_spec((p-output)mod 4)0);[|reflexivity].
 assert(Hk:0<=(p-output)/4)by(apply Z.div_pos;lia).
 assert(Hrow:0<=((p-output)/4)/N)by(apply Z.div_pos;lia).
 pose proof(Z.mod_pos_bound((p-output)/4)N HN)as Hcol.
 destruct(Z.ltb_spec(((p-output)/4)/N)0);[lia|].
 destruct(Z.ltb_spec((((p-output)/4)mod N))0);[lia|].
 rewrite Bool.andb_false_r;reflexivity.
Qed.
Lemma dw_progress_tile_end:forall R O output H N y,
 0<N->y<=H->
 dw_progress R O output H N y N=dw_progress R O output H N(Z.min H(y+3))0.
Proof.
 intros R O output H N y HN Hy;apply functional_extensionality;intro p;unfold dw_progress.
 destruct(andb(andb(output<=?p)(p<?output+4*H*N))(Z.eqb((p-output)mod 4)0));[|reflexivity].
 pose proof(Z.mod_pos_bound((p-output)/4)N HN)as Hcol.
 destruct(Z.ltb_spec((((p-output)/4)mod N))N);[|lia].
 destruct(Z.ltb_spec((((p-output)/4)mod N))0);[lia|].
 rewrite Bool.andb_false_r.
 assert(Hz:y<=Z.min H(y+3))by(apply Z.min_glb;lia).
 destruct(Z.ltb_spec(((p-output)/4)/N)y);
 destruct(Z.ltb_spec(((p-output)/4)/N)(Z.min H(y+3)));try lia;reflexivity.
Qed.
Print Assumptions dw_c_literal_zero.
Print Assumptions dw_row_base_before.
Print Assumptions dw_row_base_after.
Print Assumptions dw_row_base_inside.
Print Assumptions dw_prev_at_zero.
Print Assumptions dw_progress_start.
Print Assumptions dw_progress_tile_end.

Lemma dw_width_quot:forall N,Z.quot(4*N)4=N.
Proof. intros;rewrite Z.mul_comm;apply Z.quot_mul;lia. Qed.
Print Assumptions dw_width_quot.
