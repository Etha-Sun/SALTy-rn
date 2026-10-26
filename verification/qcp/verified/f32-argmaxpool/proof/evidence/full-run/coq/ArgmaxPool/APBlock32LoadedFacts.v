From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export APBlock32Facts.
From ArgmaxPool Require Import PackModel ReadWindows APOptionalMemoryModel.
Local Open Scope Z_scope.
Lemma apbc_previous_pair:forall F O I ab ib p0 idx vl lane f i,
 ab<>0->ap_block32_previous ab ib->
 ap_optional_output_readable O ab vl->ap_optional_index_readable I ib vl->
 0<=lane<vl->ap_output_active_loaded lane vl O ab f->ap_index_active_loaded lane vl I ib i->
 (f,i)=ap_block32_initial F O I ab ib p0 idx lane.
Proof.
 intros F O I ab ib p0 idx vl lane f i HN HP HF HI HL Hf Hi.
 assert(Hib:ib<>0)by(unfold ap_block32_previous in HP;tauto).
 unfold ap_optional_output_readable in HF;destruct HF as[Hbad|HF];[contradiction|].
 unfold ap_optional_index_readable in HI;destruct HI as[Hbad|HI];[contradiction|].
 destruct(HF lane HL)as[f0 EF];destruct(HI lane HL)as[i0 EI].
 specialize(Hf ltac:(lia));specialize(Hi ltac:(lia)).
 unfold ap_output_loaded_lane,ap_output_loaded in Hf;rewrite EF in Hf.
 unfold ap_index_loaded_lane,ap_index_loaded in Hi;rewrite EI in Hi.
 unfold ap_block32_initial;assert(HB:(ab=?0)=false)by(apply Z.eqb_neq;exact HN).
 rewrite HB,EF,EI;now rewrite Hf,Hi.
Qed.
Print Assumptions apbc_previous_pair.
