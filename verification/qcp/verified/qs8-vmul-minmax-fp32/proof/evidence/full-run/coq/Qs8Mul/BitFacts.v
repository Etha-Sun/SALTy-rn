From Coq Require Import ZArith Lia Bool.
Local Open Scope Z_scope.
Lemma qm_land_quiet_cases : forall u:Z,
 Z.land u 4194304=0 \/ Z.land u 4194304=4194304.
Proof.
 intro u. change 4194304 with (2^22).
 destruct(Z.testbit u 22)eqn:Hbit.
 - right. apply Z.bits_inj. intro i.
   rewrite Z.land_spec, !Z.pow2_bits_eqb by lia.
   destruct(Z.eqb_spec 22 i)as[Heq|Hneq].
   + subst i. rewrite Hbit. reflexivity.
   + now rewrite andb_false_r.
 - left. apply Z.bits_inj. intro i.
   rewrite Z.land_spec,Z.pow2_bits_eqb by lia.
   rewrite Z.bits_0.
   destruct(Z.eqb_spec 22 i)as[Heq|Hneq].
   + subst i. rewrite Hbit. reflexivity.
   + now rewrite andb_false_r.
Qed.
Lemma qm_lor_quiet_present : forall u:Z,
 Z.land u 4194304<>0 -> Z.lor u 4194304=u.
Proof.
 intros u Hnonzero.
 assert(Hmask:Z.land u 4194304=4194304).
 { destruct(qm_land_quiet_cases u);congruence. }
 apply Z.bits_inj. intro i. rewrite Z.lor_spec.
 pose proof(f_equal(fun z=>Z.testbit z i)Hmask)as Hbit.
 change (Z.testbit (Z.land u 4194304) i=Z.testbit 4194304 i) in Hbit.
 rewrite Z.land_spec in Hbit.
 destruct(Z.testbit u i), (Z.testbit 4194304 i);simpl in *;congruence.
Qed.
Print Assumptions qm_land_quiet_cases.
Print Assumptions qm_lor_quiet_present.
