From Coq Require Import ZArith Lia Bool.
From DwChw Require Export ProgressModel ProgramFactsFast.
Local Open Scope Z_scope.

Definition dw_public_observed(ON OR:DwOutput)(outN outR H N:Z):Prop:=
 forall k,0<=k<H*N->exists a b,
 ON(outN+4*k)=Some a /\ OR(outR+4*k)=Some b /\ dw_observe a b.

Lemma dw_progress_complete_at:forall R O output H N k,
 0<H->0<N->0<=k<H*N->
 dw_progress R O output H N H 0(output+4*k)=Some(R k).
Proof.
 intros R O output H N k HH HN Hk;unfold dw_progress.
 destruct(Z.leb_spec output(output+4*k));[|nia].
 destruct(Z.ltb_spec(output+4*k)(output+4*H*N));[|nia].
 replace(output+4*k-output)with(4*k)by ring.
 replace((4*k)mod 4)with 0 by(rewrite Z.mul_comm,Z.mod_mul by lia;reflexivity).
 replace((4*k)/4)with k by(rewrite Z.mul_comm,Z.div_mul;lia).
 cbn[andb Z.eqb].
 destruct(Z.ltb_spec(k/N)H)as[Hrow|Hrow];[reflexivity|].
 assert(k/N<H)by(apply Z.div_lt_upper_bound;nia);lia.
Qed.
Theorem dw_progress_unwritten_frame:forall R O output H N y x p,
 ~(output<=p<output+4*H*N /\ (p-output)mod 4=0)->
 dw_progress R O output H N y x p=O p.
Proof.
 intros R O output H N y x p Houtside;unfold dw_progress.
 destruct(Z.leb_spec output p);[|reflexivity].
 destruct(Z.ltb_spec p(output+4*H*N));[|reflexivity].
 destruct(Z.eqb_spec((p-output)mod 4)0);[|reflexivity].
 exfalso;apply Houtside;auto.
Qed.
Theorem dw_complete_program_observation:forall F input zero weights H N lo hi
 outN outR ON OR,
 0<H->0<N->
 dw_public_observed
 (dw_progress(dw_neon_results F input zero weights H N lo hi)ON outN H N H 0)
 (dw_progress(dw_rvv_results F input zero weights H N lo hi)OR outR H N H 0)
 outN outR H N.
Proof.
 intros F input zero weights H N lo hi outN outR ON OR HH HN k Hk.
 exists(dw_neon_results F input zero weights H N lo hi k),
 (dw_rvv_results F input zero weights H N lo hi k).
 split;[apply dw_progress_complete_at;assumption|].
 split;[apply dw_progress_complete_at;assumption|].
 unfold dw_neon_results,dw_rvv_results;apply dw_pixel_observation.
Qed.
Theorem dw_complete_program_own_frames:forall RN RR ON OR outN outR H N p q,
 ~(outN<=p<outN+4*H*N /\ (p-outN)mod 4=0)->
 ~(outR<=q<outR+4*H*N /\ (q-outR)mod 4=0)->
 dw_progress RN ON outN H N H 0 p=ON p /\
 dw_progress RR OR outR H N H 0 q=OR q.
Proof. intros;split;apply dw_progress_unwritten_frame;assumption. Qed.
Print Assumptions dw_progress_complete_at.
Print Assumptions dw_progress_unwritten_frame.
Print Assumptions dw_complete_program_observation.
Print Assumptions dw_complete_program_own_frames.
