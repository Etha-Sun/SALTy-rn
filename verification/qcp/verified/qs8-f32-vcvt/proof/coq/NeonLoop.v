From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import neon_unit_goal NeonMemorySupport NeonStep.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac loop_cancel :=
 first[solve[exact(derivable1_refl _)]
 |lazymatch goal with |-?P |-- ?q ** ?Q =>
 eapply(derivable1_trans P(q ** _)(q ** Q));
 [pull_cell q|apply derivable1_sepcon_mono;[exact(derivable1_refl _)|loop_cancel]]end].
Ltac loop_join A B :=
 lazymatch A with emp=>constr:(B)|_=>
 lazymatch B with emp=>constr:(A)|_=>constr:(A ** B)end end.
Ltac loop_remove_one P q :=
 match P with
 | q=>constr:(emp)
 | ?A ** ?B=>let R:=loop_remove_one A q in loop_join R B
 | ?A ** ?B=>let R:=loop_remove_one B q in loop_join A R
 end.
Ltac loop_remove_tree L P :=
 lazymatch P with
 | ?A ** ?B=>let R:=loop_remove_tree L A in loop_remove_tree R B
 | _=>loop_remove_one L P
 end.
Ltac loop_apply H :=
 match goal with |-?L |-- ?G=>
 lazymatch type of H with ?P |-- ?Q =>
 let R:=loop_remove_tree L P in
 eapply(derivable1_trans L(Q ** R)G);
 [eapply(derivable1_trans L(P ** R)(Q ** R));
  [sepcon_assoc_change;loop_cancel
  |apply derivable1_sepcon_mono;[exact H|exact(derivable1_refl _)]]
 |]end end.
Ltac loop_or :=
 lazymatch goal with |-?P |-- (?Q || ?R) =>
 first[solve[eapply(derivable1_trans P Q(Q||R));[loop_or|apply derivable1_orp_intros1]]
 |solve[eapply(derivable1_trans P R(Q||R));[loop_or|apply derivable1_orp_intros2]]]
 |_=>cvt_numeric_frame end.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Cvt.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold Qs8Cvt.neon_unit_goal.test_neon_entail_wit_3;intros.
 rewrite sizeof_char,sizeof_float in *.
 subst input output.
 replace(output_pre+(batch_pre-batch)*4)with(output_pre+4*(batch_pre-batch))by lia.
 replace(((output_pre+4*(batch_pre-batch))+(4*4))+(0*4))with((output_pre+4*(batch_pre-batch))+4*4)by lia.
 replace(((output_pre+4*(batch_pre-batch))+(4*4))+(1*4))with((output_pre+4*(batch_pre-batch))+4*5)by lia.
 replace(((output_pre+4*(batch_pre-batch))+(4*4))+(2*4))with((output_pre+4*(batch_pre-batch))+4*6)by lia.
 replace(((output_pre+4*(batch_pre-batch))+(4*4))+(3*4))with((output_pre+4*(batch_pre-batch))+4*7)by lia.
 replace((output_pre+4*(batch_pre-batch))+(0*4))with((output_pre+4*(batch_pre-batch))+4*0)by lia.
 replace((output_pre+4*(batch_pre-batch))+(1*4))with((output_pre+4*(batch_pre-batch))+4*1)by lia.
 replace((output_pre+4*(batch_pre-batch))+(2*4))with((output_pre+4*(batch_pre-batch))+4*2)by lia.
 replace((output_pre+4*(batch_pre-batch))+(3*4))with((output_pre+4*(batch_pre-batch))+4*3)by lia.
 replace((((4+1)+1)+1)+1)with 8 by lia.
 pose proof(cvt_prefix_cells8 output_pre(batch_pre-batch)A RawZ Scale ltac:(lia))as Hmerge.
 unfold cvt_neon_lane,cvt_neon_delta in Hmerge.
 loop_apply Hmerge.
 pose proof(FloatArray.undef_seg_to_undef_full(output_pre+4*(batch_pre-batch))8 batch)as Hundef.
 unfold StoreFloatAsElement.sizeA in Hundef;rewrite sizeof_float in Hundef.
 loop_apply Hundef.
 assert(Hcount:batch_pre-(batch-8*1)=batch_pre-batch+8)by lia.
 repeat progress rewrite Hcount.
 destruct(Z.eq_dec(batch-8)0)as[H0|H0];[loop_or|].
 destruct(Z.eq_dec(batch-8)1)as[H1|H1];[loop_or|].
 destruct(Z.eq_dec(batch-8)2)as[H2|H2];[loop_or|].
 destruct(Z.eq_dec(batch-8)3)as[H3|H3];[loop_or|].
 destruct(Z.eq_dec(batch-8)4)as[H4|H4];[loop_or|].
 destruct(Z.eq_dec(batch-8)5)as[H5|H5];[loop_or|].
 destruct(Z.eq_dec(batch-8)6)as[H6|H6];[loop_or|].
 destruct(Z.eq_dec(batch-8)7)as[H7|H7];[loop_or|].
 loop_or.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
