From X32Transpose Require Export ProgramModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma xt_total_bounds:forall F W G,xt_valid F W G->0<=xt_total G<18446744073709551616.
Proof.
 intros F W G [He _];unfold xt_entry in He;unfold xt_total,xt_effective_width.
 destruct He as[Hw[Hh Rest]];destruct(Z.eqb_spec(xt_height G)0);[lia|].
 destruct(Z.eqb_spec(xt_width G)0);lia.
Qed.
Lemma xt_total_positive_height:forall F W G,xt_valid F W G->0<xt_total G->0<xt_height G.
Proof.
 intros F W G [He _];unfold xt_entry in He;unfold xt_total,xt_effective_width.
 destruct He as[Hw[Hh Rest]];destruct(Z.eqb_spec(xt_height G)0);lia.
Qed.
Lemma xt_total_cols:forall F W G,xt_valid F W G->0<xt_height G->xt_total G=xt_cols G.
Proof.
 intros F W G [He _] Hh;unfold xt_entry in He;destruct He as[Hw Rest].
 unfold xt_total,xt_effective_width,xt_cols.
 destruct(Z.eqb_spec(xt_height G)0);[lia|].
 destruct(Z.eqb_spec(xt_width G)0)as[Hw0|Hw0];[rewrite Hw0;reflexivity|].
 symmetry;apply Z.max_r;lia.
Qed.
Lemma xt_input_address_bounds:forall F W G r c,
 xt_valid F W G->0<=r<xt_height G->0<=c<=xt_cols G->
 0<xt_input_address G r c<18446744073709551616.
Proof.
 intros F W G r c [He[Hf Hs]] Hr Hc.
 assert(Hh:0<xt_height G)by lia;specialize(Hs Hh).
 unfold xt_entry in He;unfold xt_storage in Hs;unfold xt_input_address.
 destruct He as[Hw[Hheight[HS[HT _]]]].
 destruct Hs as[Hp[Hout[Ha[Hb[Hc1[Hd[Hbound Rest]]]]]]].
 assert(Hupper:r*xt_input_stride G<=(xt_height G-1)*xt_input_stride G).
 { apply Z.mul_le_mono_nonneg_r;lia. }
 assert(Hlower:0<=r*xt_input_stride G)by(apply Z.mul_nonneg_nonneg;lia).
 lia.
Qed.
Lemma xt_output_address_bounds:forall F W G r c,
 xt_valid F W G->0<=r<xt_height G->0<=c<xt_cols G->
 0<xt_output_address G r c<18446744073709551616.
Proof.
 intros F W G r c [He[Hf Hs]] Hr Hc.
 assert(Hh:0<xt_height G)by lia;specialize(Hs Hh).
 unfold xt_entry in He;unfold xt_storage in Hs;unfold xt_output_address.
 destruct He as[Hw[Hheight[HS[HT _]]]].
 destruct Hs as[Hp[Hout[Ha[Hb[Hc1[Hd[Hin[Hbound Rest]]]]]]]].
 assert(Hupper:c*xt_output_stride G<=(xt_cols G-1)*xt_output_stride G).
 { apply Z.mul_le_mono_nonneg_r;lia. }
 assert(Hlower:0<=c*xt_output_stride G)by(apply Z.mul_nonneg_nonneg;lia).
 lia.
Qed.
Lemma xt_current_input_exact:forall F W G k r,
 xt_valid F W G->0<=r<xt_height G->0<=k<=xt_cols G->
 xt_current_input G k r=xt_input_address G r k.
Proof.
 intros F W G k r H Hr Hk;pose proof(xt_input_address_bounds F W G r k H Hr Hk).
 unfold xt_current_input,xt_input_address,xt_mod64 in *.
 replace(xt_input G+4*k+r*xt_input_stride G)with(xt_input G+r*xt_input_stride G+4*k)by ring.
 apply Z.mod_small;lia.
Qed.
Lemma xt_current_output_exact:forall F W G k r,
 xt_valid F W G->0<=r<xt_height G->0<=k<xt_cols G->
 xt_current_output G k r=xt_output_address G r k.
Proof.
 intros F W G k r H Hr Hk;pose proof(xt_output_address_bounds F W G r k H Hr Hk).
 unfold xt_current_output,xt_output_address,xt_mod64 in *;apply Z.mod_small;nia.
Qed.
Lemma xt_current_input_window:forall F W G k r vl,
 xt_valid F W G->0<=r<xt_height G->0<=k->0<=vl->k+vl<=xt_cols G->
 xt_window F(xt_current_input G k r)vl.
Proof.
 intros F W G k r vl Hv Hr Hk Hvl Hend.
 assert(Hkc:0<=k<=xt_cols G)by lia.
 rewrite(xt_current_input_exact F W G k r Hv Hr Hkc).
 split;[pose proof(xt_input_address_bounds F W G r k Hv Hr Hkc);lia|].
 split;[exact Hvl|].
 intros j Hj.
 destruct Hv as[He[HF HS]];specialize(HS ltac:(lia)).
 unfold xt_storage in HS.
 destruct HS as[_[_[_[_[_[_[_[_[_[_[Hpresent _]]]]]]]]]]].
 replace(xt_input_address G r k+4*j)with(xt_input_address G r(k+j))by(unfold xt_input_address;ring).
 apply Hpresent;[exact Hr|lia].
Qed.
Lemma xt_current_output_stride:forall F W G k r vl,
 xt_valid F W G->0<=r<xt_height G->0<=k->0<=vl<=32->k+vl<=xt_cols G->
 xt_stride_valid W(xt_current_output G k r)(xt_output_stride G)vl /\
 xt_stride_distinct(xt_current_output G k r)(xt_output_stride G)vl.
Proof.
 intros F W G k r vl Hv Hr Hk Hvl Hend.
 assert(Haddr:forall j,0<=j<vl->xt_addr(xt_current_output G k r)(xt_output_stride G)j=xt_output_address G r(k+j)).
 { intros j Hj.
   assert(Hkc:0<=k<xt_cols G)by lia.
   rewrite(xt_current_output_exact F W G k r Hv Hr Hkc).
   pose proof(xt_output_address_bounds F W G r(k+j)Hv Hr ltac:(lia)).
   unfold xt_addr,xt_mod64,xt_output_address in *.
   replace(xt_output_base G+k*xt_output_stride G+4*r+xt_output_stride G*j)
    with(xt_output_base G+(k+j)*xt_output_stride G+4*r)by ring.
   apply Z.mod_small;lia. }
 destruct Hv as[He[HF HS]];specialize(HS ltac:(lia));unfold xt_storage in HS.
 destruct HS as[_[_[_[_[_[_[_[_[Hstride[Hnd[Hpresent Howned]]]]]]]]]]].
 split.
 - split;[exact Hnd|].
 split;[exact Hvl|].
 intros j Hj;rewrite Haddr by exact Hj;apply Howned;[exact Hr|lia].
 - intros a b Ha Hb Eq;rewrite !Haddr in Eq by assumption.
   pose proof(xt_output_address_injective G r(k+a)r(k+b)ltac:(lia)Hr Hr ltac:(lia)ltac:(lia)Hstride Eq);lia.
Qed.
Print Assumptions xt_total_bounds.
Print Assumptions xt_total_positive_height.
Print Assumptions xt_total_cols.
Print Assumptions xt_input_address_bounds.
Print Assumptions xt_output_address_bounds.
Print Assumptions xt_current_input_exact.
Print Assumptions xt_current_output_exact.
Print Assumptions xt_current_input_window.
Print Assumptions xt_current_output_stride.
