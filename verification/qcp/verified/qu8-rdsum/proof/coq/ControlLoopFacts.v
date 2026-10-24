From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export ControlFacts RvvFacts.
Local Open Scope Z_scope.
Lemma rd_ceil252_zero : rd_ceil252 0=0.
Proof. reflexivity. Qed.
Lemma rd_ceil252_zero_iff : forall r,0<=r ->(rd_ceil252 r=0 <->r=0).
Proof.
 intros r Hr;split;[|intro;subst;reflexivity].
 unfold rd_ceil252;pose proof(Z.div_mod r 252 ltac:(lia));pose proof(Z.mod_pos_bound r 252 ltac:(lia));pose proof(rd_quot252_bounds r Hr).
 destruct(Z.eqb_spec(r mod 252)0);lia.
Qed.
Lemma rd_ceil252_small : forall r,0<r<=252 ->rd_ceil252 r=1.
Proof.
 intros r Hr;unfold rd_ceil252;pose proof(Z.div_mod r 252 ltac:(lia));pose proof(Z.mod_pos_bound r 252 ltac:(lia));pose proof(rd_quot252_bounds r ltac:(lia));destruct(Z.eqb_spec(r mod 252)0);lia.
Qed.
Lemma rd_ceil252_step : forall r,0<r ->rd_ceil252(Z.max 0(r-252))=rd_ceil252 r-1.
Proof.
 intros r Hr;destruct(Z_le_gt_dec r 252).
 - rewrite Z.max_l by lia;rewrite rd_ceil252_zero,rd_ceil252_small by lia;lia.
 - rewrite Z.max_r by lia.
   pose proof(Z.div_mod r 252 ltac:(lia))as E;pose proof(Z.mod_pos_bound r 252 ltac:(lia))as Hrem.
   pose proof(Z.div_mod(r-252)252 ltac:(lia))as E';pose proof(Z.mod_pos_bound(r-252)252 ltac:(lia))as Hrem'.
   assert(D:(r-252)/252=r/252-1)by lia;assert(R:(r-252)mod 252=r mod 252)by lia.
   unfold rd_ceil252;rewrite D,R;lia.
Qed.
Lemma rd_min252_remainder : forall r,0<=r ->r-rd_min252 r=Z.max 0(r-252).
Proof. intros;unfold rd_min252;destruct(Z_le_gt_dec r 252);[rewrite Z.min_l,Z.max_l by lia|rewrite Z.min_r,Z.max_r by lia];lia. Qed.
Lemma rd_rows_step : forall rows r,0<=r ->rows-Z.max 0(r-252)=rows-r+rd_min252 r.
Proof. intros;rewrite <-rd_min252_remainder by assumption;lia. Qed.
Lemma rd_progress_step : forall rows r,0<r ->rd_progress rows r ->rd_progress rows(Z.max 0(r-252)).
Proof.
 intros rows r Hr [E|E];[lia|].
 destruct(Z_le_gt_dec r 252).
 - rewrite Z.max_l by lia;left;reflexivity.
 - rewrite Z.max_r by lia;right;unfold rd_mod252 in *.
   replace(rows-(r-252))with((rows-r)+252)by ring;rewrite Z.add_mod by lia;rewrite E;reflexivity.
Qed.
Print Assumptions rd_ceil252_zero_iff.
Print Assumptions rd_ceil252_small.
Print Assumptions rd_ceil252_step.
Print Assumptions rd_min252_remainder.
Print Assumptions rd_rows_step.
Print Assumptions rd_progress_step.
