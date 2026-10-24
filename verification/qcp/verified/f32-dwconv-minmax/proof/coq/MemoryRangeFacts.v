From Coq Require Import ZArith Lia.
From Dwconv Require Export ProgramFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* These facts follow from the actual owned cells. They add no source-domain
   precondition and do not replace ownership by emp. Callers use prop_apply
   to retain the complete original map while extracting the pure fact. *)
Lemma dw_present_address_valid : forall F p,
 dw_present F p -> dw_data F |-- “ isvalidptr_float p ”.
Proof.
 intros F p Hp;sep_apply(proj1(dw_data_pop F p Hp)).
 prop_apply(valid_store_float p(dw_get F p));entailer!.
Qed.

Lemma dw_window_span_bound : forall F p n,
 dw_window F p n -> 0<n ->
 dw_data F |-- “ p+4*(n-1)+3<=18446744073709551615 ”.
Proof.
 intros F p n [Hp[Hn Hwindow]] Hpositive.
 pose proof(Hwindow(n-1)ltac:(lia))as Hlast.
 prop_apply(dw_present_address_valid F(p+4*(n-1))Hlast).
 unfold isvalidptr_float;change addr_max_unsigned with 18446744073709551615.
 entailer!.
Qed.

Lemma dw_channels_within_word : forall F P W D,
 dw_valid F P W D ->
 dw_data F |-- “ 0<dw_channels D<18446744073709551616 ”.
Proof.
 intros F P W D [HC[HP[HW Hpixels]]].
 assert(Hceil:dw_channels D<=4*((dw_channels D+3)/4)).
 { pose proof(Z.div_mod(dw_channels D+3)4 ltac:(lia)).
   pose proof(Z.mod_pos_bound(dw_channels D+3)4 ltac:(lia));lia. }
 assert(Hpositive:0<16*((dw_channels D+3)/4))by lia.
 pose proof(proj1 HW)as Hweights.
 prop_apply(dw_window_span_bound F(dw_weights D)(16*((dw_channels D+3)/4))HW Hpositive).
 entailer!.
Qed.
Print Assumptions dw_present_address_valid.
Print Assumptions dw_window_span_bound.
Print Assumptions dw_channels_within_word.
