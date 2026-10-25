From X32Packw Require Export TileAccessModel.
From Coq Require Import ZArith List Lia.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_header_word_read:forall F W b p count,
 pw_header_pre F W b p count->b<>0->0<b /\ pw_map_nodup F /\ pw_present F b.
Proof.
 intros F W b p count[Hc[Hp[Hnd[HF Hb]]]]Hnz.
 destruct Hb as[Hb|Hb];[contradiction|].
 destruct Hb as[Hb[Hcount Hlane]].
 split;[assumption|];split;[assumption|].
 replace b with(b+4*0)by lia;apply Hlane;destruct Hc;lia.
Qed.
Lemma pw_header_word_write:forall F W b p count,
 pw_header_pre F W b p count->0<p /\ NoDup W /\ In p W.
Proof.
 intros F W b p count[Hc[[Hp[Htwo Hlane]][Hnd Hrest]]].
 split;[assumption|];split;[assumption|].
 replace p with(p+4*0)by lia;apply Hlane;lia.
Qed.
Lemma pw_header_pair_load:forall F W b p count,
 pw_header_pre F W b p count->b<>0->count=2->pw_window F b 2.
Proof. intros F W b p count[Hc[Hp[Hnd[HF[Hz|Hb]]]]]Hnz Htwo;[contradiction|subst count;assumption]. Qed.
Lemma pw_header_store_window:forall F W b p count,
 pw_header_pre F W b p count->pw_write_window W p 2.
Proof. intros F W b p count[Hc[Hp _]];assumption. Qed.
Lemma pw_odd_next_read:forall F W a p kc done,
 pw_odd_pre F W a p kc->0<=done<kc->
 0<a+4*done /\ pw_present F(a+4*done).
Proof.
 intros F W a p kc done Hpre Hd.
 unfold pw_odd_pre in Hpre;destruct Hpre as[Hkc[Ha[Hp[Hae[Hpe[Haw Hrest]]]]]].
 split;[lia|];destruct Haw as[_[_ Hlanes]];apply Hlanes;assumption.
Qed.
Lemma pw_odd_next_write:forall F W a p kc done,
 pw_odd_pre F W a p kc->0<=done<kc->
 0<p+8*done /\NoDup W /\In(p+8*done)W.
Proof.
 intros F W a p kc done Hpre Hd.
 unfold pw_odd_pre in Hpre;destruct Hpre as[Hkc[Ha[Hp[Hae[Hpe[Haw[Hpw Hnd]]]]]]].
 split;[lia|];split;[assumption|].
 destruct Hpw as[_[_ Hlanes]].
 replace(p+8*done)with(p+4*(2*done))by ring;apply Hlanes;lia.
Qed.
Print Assumptions pw_header_word_read.
Print Assumptions pw_header_word_write.
Print Assumptions pw_header_pair_load.
Print Assumptions pw_header_store_window.
Print Assumptions pw_odd_next_read.
Print Assumptions pw_odd_next_write.
