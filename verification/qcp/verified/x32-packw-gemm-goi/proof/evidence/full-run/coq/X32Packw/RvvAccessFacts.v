From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export AccessFacts TileAccessFacts StrideAccessModel VectorModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_legal_vl_positive:forall avl vl,
 0<avl->pw_legal_vl avl vl->0<vl<=avl /\vl<=16.
Proof.
 intros avl vl Ha [[Hrange Heq]|[[Hrange Hvl]|[Hrange Heq]]];subst;try lia.
 assert(Hceil:1<=(avl+1)/2)by(apply Z.div_le_lower_bound;lia);lia.
Qed.
Lemma pw_segment_from_window:forall W p vl,
 pw_write_window W p(2*vl)->0<=vl<=16->pw_segment_window W p vl.
Proof.
 intros W p vl[Hp[Hnon Hlanes]]Hvl;unfold pw_segment_window,pw_stride_window.
 split;split;try lia;split;try lia;intros i Hi.
 - replace(p+8*i)with(p+4*(2*i))by ring;apply Hlanes;lia.
 - replace(p+4+8*i)with(p+4*(2*i+1))by ring;apply Hlanes;lia.
Qed.
Lemma pw_pair_rvv_windows:forall F W a b p kc done vl,
 pw_pair_pre F W a b p kc->0<=done->0<vl<=16->done+vl<=kc->
 pw_window F(a+4*done)vl /\pw_window F(b+4*done)vl /\pw_segment_window W(p+8*done)vl.
Proof.
 intros F W a b p kc done vl Hpre Hd Hvl Hend.
 destruct(pw_pair_inner_windows F W a b p kc done vl Hpre Hd ltac:(lia)Hend)as[Ha[Hb Hp]].
 split;[exact Ha|];split;[exact Hb|apply pw_segment_from_window;assumption||lia].
Qed.
Lemma pw_odd_rvv_windows:forall F W a p kc done vl,
 pw_odd_pre F W a p kc->0<=done->0<vl<=16->done+vl<=kc->
 pw_window F(a+4*done)vl /\pw_stride_window W(p+8*done)vl.
Proof.
 intros F W a p kc done vl Hpre Hd Hvl Hend.
 unfold pw_odd_pre in Hpre;destruct Hpre as[Hkc[Ha[Hp[Hae[Hpe[Haw[Hpw Hnd]]]]]]].
 split.
 - apply pw_window_shift with(cap:=kc);assumption||lia.
 - unfold pw_stride_window;split;[lia|];split;[lia|].
   intros i Hi;destruct Hpw as[_[_ Hlanes]].
   replace(p+8*done+8*i)with(p+4*(2*(done+i)))by ring.
   apply Hlanes;lia.
Qed.
Lemma pw_pair_rvv_progress:forall done vl F a b p O A B,
 0<=done->0<=vl->pw_rvv_lanes F(a+4*done)vl A->pw_rvv_lanes F(b+4*done)vl B->
 pw_segmented vl A B(p+8*done)(pw_pair_run done F a b p O)=
 pw_pair_run(done+vl)F a b p O.
Proof.
 intros done vl F a b p O A B Hd Hvl[Halen[HvlA HA]][Hblen[HvlB HB]].
 rewrite(pw_segmented_matches vl A B F(a+4*done)(b+4*done)(p+8*done)(pw_pair_run done F a b p O)Hvl HA HB).
 symmetry;apply pw_pair_run_chunk;assumption.
Qed.
Lemma pw_odd_rvv_progress:forall done vl F a p O A,
 0<=done->0<=vl->pw_rvv_lanes F(a+4*done)vl A->
 pw_strided vl A(p+8*done)(pw_odd_run done F a p O)=
 pw_odd_run(done+vl)F a p O.
Proof.
 intros done vl F a p O A Hd Hvl[Halen[HvlA HA]].
 rewrite(pw_strided_matches vl A F(a+4*done)(p+8*done)(pw_odd_run done F a p O)Hvl HA).
 symmetry;apply pw_odd_run_chunk;assumption.
Qed.
Print Assumptions pw_legal_vl_positive.
Print Assumptions pw_segment_from_window.
Print Assumptions pw_pair_rvv_windows.
Print Assumptions pw_odd_rvv_windows.
Print Assumptions pw_pair_rvv_progress.
Print Assumptions pw_odd_rvv_progress.
