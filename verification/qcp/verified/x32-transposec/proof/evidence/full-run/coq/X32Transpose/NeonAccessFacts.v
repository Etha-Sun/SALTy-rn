From X32Transpose Require Export AddressFacts NeonProgramModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma xt_current_input_padded_window:forall F W G k r n,
 xt_valid F W G->0<=r<xt_height G->0<=k<=xt_cols G->0<=n->k+n<=xt_cols G+1->
 xt_window F(xt_current_input G k r)n.
Proof.
 intros F W G k r n Hv Hr Hk Hn Hend.
 rewrite(xt_current_input_exact F W G k r Hv Hr Hk).
 split;[pose proof(xt_input_address_bounds F W G r k Hv Hr Hk);lia|].
 split;[exact Hn|].
 intros j Hj;destruct Hv as[He[HF HS]];specialize(HS ltac:(lia)).
 unfold xt_storage in HS;destruct HS as[_[_[_[_[_[_[_[_[_[_[Hpresent _]]]]]]]]]]].
 replace(xt_input_address G r k+4*j)with(xt_input_address G r(k+j))by(unfold xt_input_address;ring).
 apply Hpresent;[exact Hr|lia].
Qed.
Lemma xt_current_output_vertical_window:forall F W G k r n,
 xt_valid F W G->0<=r<xt_height G->0<=k<xt_cols G->0<=n->r+n<=xt_height G->
 xt_write_window W(xt_current_output G k r)n.
Proof.
 intros F W G k r n Hv Hr Hk Hn Hend.
 rewrite(xt_current_output_exact F W G k r Hv Hr Hk).
 split;[pose proof(xt_output_address_bounds F W G r k Hv Hr Hk);lia|].
 split;[exact Hn|].
 intros j Hj;destruct Hv as[He[HF HS]];specialize(HS ltac:(lia)).
 unfold xt_storage in HS;destruct HS as[_[_[_[_[_[_[_[_[_[_[_ Howned]]]]]]]]]]].
 replace(xt_output_address G r k+4*j)with(xt_output_address G(r+j)k)by(unfold xt_output_address;ring).
 apply Howned;[lia|exact Hk].
Qed.
Lemma xt_neon_second_bounds:forall total k w,
 0<=k<total->w=xt_doz total k->0<=xt_neon_second k w<total.
Proof.
 intros total k w Hk Hw;unfold xt_neon_second;destruct(Z.ltb_spec w 2);[exact Hk|].
 unfold xt_doz in Hw;destruct(Z.ltb_spec k total);lia.
Qed.
Print Assumptions xt_current_input_padded_window.
Print Assumptions xt_current_output_vertical_window.
Print Assumptions xt_neon_second_bounds.
