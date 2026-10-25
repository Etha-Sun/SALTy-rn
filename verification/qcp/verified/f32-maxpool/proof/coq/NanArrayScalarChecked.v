From Coq Require Import ZArith Lia.
From MaxPool Require Import Model propagate_goal NanScalarFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac ns_intro:=lazymatch goal with |-_ |-- _=>idtac | |-forall _,_=>intro;ns_intro end.
Ltac ns_constants:=try change INT_MAX with (2147483647:Z) in *;try change INT_MIN with (-2147483648)in *;try change UINT_MAX with (4294967295:Z) in *.
Ltac ns_bits:=unfold mp_restore_bits,mp_merge_bits,mp_snan_bits,mp_nan_bits,mp_abs_bits,mp_quiet_bits,mp_quiet_clear;
 repeat match goal with |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) | |-context[Z.eqb ?a ?b]=>destruct(Z.eqb_spec a b)end;
 cbn[andb]in *;repeat first[solve[assumption|lia|reflexivity]|split].
Module CheckedNanArrayScalar.
Lemma proof_of_mp_restore_lane_safety_wit_1:MaxPool.propagate_goal.mp_restore_lane_safety_wit_1.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_1;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_2:MaxPool.propagate_goal.mp_restore_lane_safety_wit_2.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_2;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_3:MaxPool.propagate_goal.mp_restore_lane_safety_wit_3.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_3;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_4:MaxPool.propagate_goal.mp_restore_lane_safety_wit_4.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_4;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_5:MaxPool.propagate_goal.mp_restore_lane_safety_wit_5.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_5;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_6:MaxPool.propagate_goal.mp_restore_lane_safety_wit_6.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_6;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_7:MaxPool.propagate_goal.mp_restore_lane_safety_wit_7.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_7;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_8:MaxPool.propagate_goal.mp_restore_lane_safety_wit_8.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_8;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_9:MaxPool.propagate_goal.mp_restore_lane_safety_wit_9.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_9;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_10:MaxPool.propagate_goal.mp_restore_lane_safety_wit_10.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_10;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_11:MaxPool.propagate_goal.mp_restore_lane_safety_wit_11.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_11;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_12:MaxPool.propagate_goal.mp_restore_lane_safety_wit_12.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_12;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_13:MaxPool.propagate_goal.mp_restore_lane_safety_wit_13.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_13;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_14:MaxPool.propagate_goal.mp_restore_lane_safety_wit_14.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_14;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_safety_wit_15:MaxPool.propagate_goal.mp_restore_lane_safety_wit_15.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_safety_wit_15;try left;ns_intro;ns_constants;unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_mp_restore_lane_return_wit_1:MaxPool.propagate_goal.mp_restore_lane_return_wit_1.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_1;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_2:MaxPool.propagate_goal.mp_restore_lane_return_wit_2.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_2;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_3:MaxPool.propagate_goal.mp_restore_lane_return_wit_3.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_3;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_4:MaxPool.propagate_goal.mp_restore_lane_return_wit_4.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_4;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_5:MaxPool.propagate_goal.mp_restore_lane_return_wit_5.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_5;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_6:MaxPool.propagate_goal.mp_restore_lane_return_wit_6.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_6;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_7:MaxPool.propagate_goal.mp_restore_lane_return_wit_7.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_7;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_8:MaxPool.propagate_goal.mp_restore_lane_return_wit_8.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_8;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
Lemma proof_of_mp_restore_lane_return_wit_9:MaxPool.propagate_goal.mp_restore_lane_return_wit_9.
Proof. unfold MaxPool.propagate_goal.mp_restore_lane_return_wit_9;try left;ns_intro;ns_constants;assert(Haa:0<=aa<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range aa Haa)as Hqa;
 assert(Hbb:0<=bb<=4294967295)by(split;assumption);pose proof(mp_scalar_quiet_range bb Hbb)as Hqb;
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;destruct Hqa,Hqb;ns_bits. Qed.
End CheckedNanArrayScalar.

Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_1.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_2.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_3.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_4.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_5.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_6.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_7.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_8.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_9.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_10.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_11.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_12.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_13.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_14.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_safety_wit_15.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_1.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_2.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_3.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_4.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_5.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_6.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_7.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_8.
Print Assumptions CheckedNanArrayScalar.proof_of_mp_restore_lane_return_wit_9.
