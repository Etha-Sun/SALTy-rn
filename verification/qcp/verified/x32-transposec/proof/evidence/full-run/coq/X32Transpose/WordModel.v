From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic IntLib.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Definition xt_u32(x:Z):Prop:=0<=x<4294967296.
Definition xt_mod64(x:Z):Z:=x mod 18446744073709551616.
(* Address functions take ghost integer byte addresses, never C pointer p+i. *)
Definition xt_addr(p stride i:Z):Z:=xt_mod64(p+stride*i).
Definition xt_effective_width(w h:Z):Z:=
 if Z.eqb h 0 then 0 else if Z.eqb w 0 then 1 else w.
Definition xt_legal_vl(avl vl:Z):Prop:=
 (0<=avl<=32 /\ vl=avl) \/
 (32<avl<64 /\ (avl+1)/2<=vl<=32) \/
 (64<=avl /\ vl=32).

Lemma xt_effective_empty:forall w,xt_effective_width w 0=0.
Proof. intros;unfold xt_effective_width;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma xt_effective_zero_width:forall h,h<>0->xt_effective_width 0 h=1.
Proof. intros;unfold xt_effective_width;destruct(Z.eqb_spec h 0);[contradiction|reflexivity]. Qed.
Lemma xt_effective_positive_width:forall w h,w<>0->h<>0->xt_effective_width w h=w.
Proof. intros;unfold xt_effective_width;destruct(Z.eqb_spec h 0);[contradiction|];destruct(Z.eqb_spec w 0);[contradiction|reflexivity]. Qed.
Lemma xt_vl_bounds:forall avl vl,xt_legal_vl avl vl->0<=vl<=32.
Proof.
 intros avl vl H;unfold xt_legal_vl in H;destruct H as[[? ->]|[[Havl Hvl]|[? ->]]];try lia.
 assert(0<=(avl+1)/2)by(apply Z.div_pos;lia);lia.
Qed.
Lemma xt_vl_positive:forall avl vl,0<avl->xt_legal_vl avl vl->0<vl<=avl.
Proof.
 intros avl vl Ha H;unfold xt_legal_vl in H;destruct H as[[? ->]|[[Havl Hvl]|[? ->]]];try lia.
 assert(1<=(avl+1)/2).
 { apply Z.div_le_lower_bound;lia. }
 lia.
Qed.
Lemma xt_addr_positive_stride:forall p s i,
 0<=p+s*i<18446744073709551616->xt_addr p s i=p+s*i.
Proof. intros;unfold xt_addr,xt_mod64;apply Z.mod_small;assumption. Qed.
Print Assumptions xt_effective_empty.
Print Assumptions xt_effective_zero_width.
Print Assumptions xt_effective_positive_width.
Print Assumptions xt_vl_bounds.
Print Assumptions xt_vl_positive.
Print Assumptions xt_addr_positive_stride.
