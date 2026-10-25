From Coq Require Import ZArith Bool Lia.
From MaxPool Require Import Model.
Local Open Scope Z_scope.
Lemma mp_land_quiet_cases : forall u:Z,
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
Lemma mp_lor_quiet_present : forall u:Z,
 Z.land u 4194304<>0 -> Z.lor u 4194304=u.
Proof.
 intros u Hnonzero.
 assert(Hmask:Z.land u 4194304=4194304).
 { destruct(mp_land_quiet_cases u);congruence. }
 apply Z.bits_inj. intro i. rewrite Z.lor_spec.
 pose proof(f_equal(fun z=>Z.testbit z i)Hmask)as Hbit.
 change (Z.testbit (Z.land u 4194304) i=Z.testbit 4194304 i) in Hbit.
 rewrite Z.land_spec in Hbit.
 destruct(Z.testbit u i), (Z.testbit 4194304 i);simpl in *;congruence.
Qed.

Lemma mp_restore_rvv_arm:forall minimum a b,
 mp_restore_bits a b(mp_rvv_bits minimum a b)=mp_arm_bits minimum a b.
Proof.
 intros minimum a b.
 unfold mp_restore_bits,mp_rvv_bits,mp_arm_bits,mp_snan_bits,mp_merge_bits.
 unfold mp_quiet_bits,mp_quiet_clear.
 destruct(mp_nan_bits a)eqn:Ha;destruct(mp_nan_bits b)eqn:Hb;
 destruct(Z.eqb(Z.land a 4194304)0)eqn:Hqa;
 destruct(Z.eqb(Z.land b 4194304)0)eqn:Hqb;simpl;try reflexivity.
 (* In quiet-NaN branches setting an already-set bit does not change it. *)
 all: try(apply Z.eqb_neq in Hqa);try(apply Z.eqb_neq in Hqb).
 all: try rewrite (mp_lor_quiet_present a) by assumption;
      try rewrite (mp_lor_quiet_present b) by assumption;reflexivity.
Qed.
Lemma mp_repaired_is_arm:forall minimum a b,mp_repaired minimum a b=mp_arm minimum a b.
Proof. intros;unfold mp_repaired,mp_arm;rewrite mp_restore_rvv_arm;reflexivity. Qed.
Lemma mp_scan_more_app:forall hi acc left right,
 mp_scan_more hi acc(left++right)=mp_scan_more hi(mp_scan_more hi acc left)right.
Proof. intros hi acc left;revert acc;induction left;intros;simpl;[reflexivity|apply IHleft]. Qed.

