(* Proof-only alternative for the identical four hc_maps strategy goals. Root empty-join source SHA 20b17d39e7b1155e3c39b5bcb94fbf38ebb2d61946737231aef6c4f9d44f1d10. No public source is modified. *)
(* Preserve the concrete empty resources pointwise; no state equality or unit_spec. *)
From SimpleC.SL Require Export Mem SeparationLogic.
Require Import SetsClass.SetsClass.
Import Snaive_C_Rules64.
Local Open Scope sac.

Lemma empty_join_empty_no_propext : forall (e1 e2 m : model),
  join e1 e2 m -> emp e1 -> emp e2 -> emp m.
Proof.
  intros e1 e2 m Hjoin Hempty1 Hempty2.
  change (ConAssertion.state_join e1 e2 m) in Hjoin.
  change (ConAssertion.state_empty e1) in Hempty1.
  change (ConAssertion.state_empty e2) in Hempty2.
  change (ConAssertion.state_empty m).
  unfold ConAssertion.state_join in Hjoin.
  unfold ConAssertion.state_empty in *.
  destruct Hjoin as [Hmem [Htoken Hsts]].
  destruct Hempty1 as [Hmem1 [Htoken1 Hsts1]].
  destruct Hempty2 as [Hmem2 [Htoken2 Hsts2]].
  split.
  - apply Mem.mem_empty_IS_empty_mem' in Hmem1.
    rewrite Hmem1 in Hmem.
    apply Mem.mem_join_emp_l in Hmem.
    rewrite Hmem; exact Hmem2.
  - split.
    + unfold ConAssertion.TokenSet_join in Htoken.
      destruct Htoken as [Hunion Hdisjoint].
      sets_unfold in Htoken1. sets_unfold in Htoken2. sets_unfold in Hunion.
      sets_unfold. intro t.
      specialize (Htoken1 t); specialize (Htoken2 t); specialize (Hunion t).
      tauto.
    + unfold ConAssertion.STS_state_join in Hsts.
      sets_unfold in Hsts1. sets_unfold in Hsts2. sets_unfold in Hsts.
      sets_unfold. intro s.
      specialize (Hsts1 s); specialize (Hsts2 s); specialize (Hsts s).
      tauto.
Qed.

Definition empty_join_empty_exact : forall (e1 e2 m : model),
  join e1 e2 m -> emp e1 -> emp e2 -> emp m := empty_join_empty_no_propext.

Print Assumptions empty_join_empty_no_propext.
Print Assumptions empty_join_empty_exact.

From HwcConv Require Import MemoryFacts FloatCopyModel hc_maps_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma maps1_from_merge :
 (forall(e1 e2 m:model),join e1 e2 m->emp e1->emp e2->emp m)->
 HwcConv.hc_maps_strategy_goal.hc_maps_strategy1.
Proof. intro Hmerge.
 unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy1;intros p F.
 unfold derivable1,andp,truep,coq_prop,sepcon,allp,wand.
 intros m [[Htrue Hpresent][me[mf[HJ[HE HF]]]]].
 pose proof(proj1(hc_data_pop F p Hpresent))as Hpop.
 unfold derivable1,sepcon in Hpop.
 destruct(Hpop mf HF)as[mc[mp[HCP[HC HP]]]].
 destruct(unit_join mp)as[mu[HUE HUP]].
 exists mf,me;split;[apply join_comm;exact HJ|]. split.
 - split;[exact I|]. exists mp,mc;split;[apply join_comm;exact HCP|]. split.
   + exists mu,mp;split;[apply join_comm;exact HUP|]. split;[exact HUE|exact HP].
   + exact HC.
 - intros v m1 m2 HJ1 [HT[ef[cf[HFC[HEF HCF]]]]].
   destruct(join_assoc cf ef me m1 m2 (join_comm _ _ _ HFC)(join_comm _ _ _ HJ1))as[ej[HEJ HOutJ]].
   split;[exact I|]. exists ej,cf;split;[apply join_comm;exact HOutJ|]. split.
   + eapply Hmerge;[exact HEJ|exact HEF|exact HE].
   + exact HCF.
Qed.
Print Assumptions maps1_from_merge.
Lemma maps2_from_merge :
 (forall(e1 e2 m:model),join e1 e2 m->emp e1->emp e2->emp m)->
 HwcConv.hc_maps_strategy_goal.hc_maps_strategy2.
Proof. intro Hmerge.
 unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy2;intros p F q.
 unfold derivable1,andp,truep,coq_prop,sepcon,wand.
 intros m [[[HT Hqp]HP][mep[mc[HJ[[me[mp[HEP[HE Hpop]]]]Hcell]]]]]. subst q.
 destruct(join_assoc me mp mc mep m HEP HJ)as[mf[HPair HOuter]].
 pose proof(proj2(hc_data_pop F p HP))as Hreverse.
 unfold derivable1,sepcon in Hreverse.
 assert(HF:hc_data F mf).
 { apply Hreverse. exists mc,mp;split;[apply join_comm;exact HPair|]. split;assumption. }
 destruct(unit_join mf)as[mu[HUE HUF]].
 exists mf,me;split;[apply join_comm;exact HOuter|]. split.
 - split;[exact I|]. exists mu,mf;split;[apply join_comm;exact HUF|]. split;assumption.
 - intros m1 m2 HJ1[HT1 HE1]. split;[exact I|].
   eapply Hmerge;[exact HJ1|exact HE|exact HE1].
Qed.
Print Assumptions maps2_from_merge.

From HwcConv Require Import MemoryFacts FloatCopyModel hc_maps_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma maps5 : HwcConv.hc_maps_strategy_goal.hc_maps_strategy5.
Proof.
 unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy5;intro F.
 unfold derivable1,andp,truep,sepcon,wand.
 intros m [Htrue[me[mf[HJ[HE HF]]]]].
 exists me,mf;split;[exact HJ|]. split.
 - split;[exact I|exact HE].
 - intros m1 m2 Hjoin [Htrue1 HE1]. split;[exact I|].
   exists m1,mf;split;[apply join_comm;exact Hjoin|]. split;assumption.
Qed.
Print Assumptions maps5.
Lemma maps7 : HwcConv.hc_maps_strategy_goal.hc_maps_strategy7.
Proof.
 unfold HwcConv.hc_maps_strategy_goal.hc_maps_strategy7;intros p q v.
 unfold derivable1,andp,truep,coq_prop,sepcon,wand.
 intros m [[Htrue Heq][me[mf[HJ[HE HF]]]]]. subst q.
 exists me,mf;split;[exact HJ|]. split.
 - split;[exact I|exact HE].
 - intros m1 m2 Hjoin [Htrue1 HE1]. split;[exact I|].
   exists m1,mf;split;[apply join_comm;exact Hjoin|]. split;assumption.
Qed.
Print Assumptions maps7.

Module CheckedMaps : HwcConv.hc_maps_strategy_goal.hc_maps_Strategy_Correct.
Definition hc_maps_strategy1_correctness : HwcConv.hc_maps_strategy_goal.hc_maps_strategy1 := maps1_from_merge empty_join_empty_no_propext.
Definition hc_maps_strategy2_correctness : HwcConv.hc_maps_strategy_goal.hc_maps_strategy2 := maps2_from_merge empty_join_empty_no_propext.
Definition hc_maps_strategy5_correctness : HwcConv.hc_maps_strategy_goal.hc_maps_strategy5 := maps5.
Definition hc_maps_strategy7_correctness : HwcConv.hc_maps_strategy_goal.hc_maps_strategy7 := maps7.
End CheckedMaps.
Module IndependentCheckedMaps : HwcConv.hc_maps_strategy_goal.hc_maps_Strategy_Correct := CheckedMaps.
Print Assumptions CheckedMaps.hc_maps_strategy1_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy2_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy5_correctness.
Print Assumptions CheckedMaps.hc_maps_strategy7_correctness.
Print Assumptions IndependentCheckedMaps.hc_maps_strategy1_correctness.
Print Assumptions IndependentCheckedMaps.hc_maps_strategy2_correctness.
Print Assumptions IndependentCheckedMaps.hc_maps_strategy5_correctness.
Print Assumptions IndependentCheckedMaps.hc_maps_strategy7_correctness.
