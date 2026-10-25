From Coq Require Import ZArith Lia.
From X32Transpose Require Import NeonAutomation CursorFacts NeonCounterFacts RvvMemoryCursorFactsDirect.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_neon_entail_wit_6:test_neon_entail_wit_6.
Proof.
 unfold test_neon_entail_wit_6;right;intros;subst.
 Exists(k_2+2).
 pose proof(proj1(proj2(proj1 PreH2)))as HH.
 assert(Hrows:xt_height G-bh=xt_round_down(xt_height G)2).
 { apply xt_neon_finished_rows;[exact HH|lia|].
   rewrite Z.rem_mod_nonneg in PreH27 by lia;exact PreH27. }
 assert(Hbw:xt_doz(xt_cols G)k_2=xt_cols G-k_2).
 { unfold xt_doz;destruct(Z.ltb_spec k_2(xt_cols G));lia. }
 assert(Hci:unsigned_last_nbits(unsigned_last_nbits
  (xt_current_input G k_2(xt_height G-bh))64+xt_neon_input_reset G)64=
  xt_current_input G(k_2+2)0).
 { rewrite !xt_u64_is_mod64,xt_mod_add_l;apply xt_neon_input_reset_step;assumption. }
 assert(Hco:unsigned_last_nbits(unsigned_last_nbits
  (xt_current_output G k_2(xt_height G-bh))64+xt_neon_output_reset G)64=
  xt_current_output G(k_2+2)0).
 { rewrite !xt_u64_is_mod64,xt_mod_add_l;apply xt_neon_output_reset_step;assumption. }
 assert(Hnext:xt_neon_next G(k_2+2)(xt_doz(xt_doz(xt_cols G)k_2)2)
  (unsigned_last_nbits(unsigned_last_nbits(xt_current_output G
   (xt_neon_second k_2(xt_doz(xt_cols G)k_2))(xt_height G-bh))64+
   xt_neon_output_reset G)64)).
 { unfold xt_neon_next.
   destruct(Z.eq_dec(xt_doz(xt_doz(xt_cols G)k_2)2)0)as[Hz|Hnz];[left;exact Hz|right].
   assert(Htwo:2<=xt_doz(xt_cols G)k_2).
   { rewrite Hbw in Hnz|-*;unfold xt_doz in Hnz.
     destruct(Z.ltb_spec 2(xt_cols G-k_2));lia. }
   unfold xt_neon_second;destruct(Z.ltb_spec(xt_doz(xt_cols G)k_2)2);[lia|].
   rewrite !xt_u64_is_mod64,xt_mod_add_l.
   rewrite xt_neon_output_reset_step by(assumption||lia).
   f_equal;lia. }
 pose proof(xt_input_cursor_next_row F W G(k_2+2)0 PreH2 PreH8)as Hci1.
 assert(Hcursorid:unsigned_last_nbits(xt_current_input G(k_2+2)0)64=
  xt_current_input G(k_2+2)0).
 { rewrite xt_u64_is_mod64;unfold xt_current_input.
   assert(E:Z.eqb(k_2+2)0=false)by(apply Z.eqb_neq;lia).
   rewrite E;cbn[andb];unfold xt_mod64;apply Z.mod_mod;lia. }
 rewrite Hcursorid in Hci1.
 pose proof(xt_neon_advance_progress F G old R_2 k_2(xt_doz(xt_cols G)k_2)
  ltac:(lia)eq_refl PreH32)as Hprogress.
 rewrite !Hci,Hco.
 rewrite xt_doz_twice in Hnext|-* by lia.
 assert(Hkeven:Z.rem(k_2+2)2=0).
 { rewrite Z.rem_mod_nonneg by lia.
   rewrite Z.rem_mod_nonneg in PreH21 by lia.
   rewrite Z.add_mod by lia;rewrite PreH21;reflexivity. }
 entailer!;lia.
Qed.
Module CheckedNeonMemoryStepsOuter.
 Definition proof_of_test_neon_entail_wit_6:X32Transpose.neon_unit_goal.test_neon_entail_wit_6:=
  xt_proof_test_neon_entail_wit_6.
End CheckedNeonMemoryStepsOuter.
Print Assumptions xt_proof_test_neon_entail_wit_6.
Print Assumptions CheckedNeonMemoryStepsOuter.proof_of_test_neon_entail_wit_6.
