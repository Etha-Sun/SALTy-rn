From Coq Require Import ZArith.
From ArgmaxPool Require Export RvvVectorRecords.

(* The value-returning specification produces one arbitrary physical packet.
   Assignment copies that same packet, including every inactive field. *)
Definition ap_record_return_assign32
 (a b:Recordvfloat32m8_t)(m:Recordvbool4_t)(vl:Z)
 (after_a after_b:Recordvfloat32m8_t)(after_m:Recordvbool4_t):Prop :=
 exists returned:Recordvfloat32m8_t,
  ap_record_merge32 returned m a b vl /\ after_a=returned /\
  after_b=b /\ after_m=m.
Definition ap_record_inplace32
 (a b:Recordvfloat32m8_t)(m:Recordvbool4_t)(vl:Z)
 (after_a after_b:Recordvfloat32m8_t)(after_m:Recordvbool4_t):Prop :=
 ap_record_merge32 after_a m a b vl /\ after_b=b /\ after_m=m.

Lemma ap_record_assignment_lowering32:forall a b m vl after_a after_b after_m,
 ap_record_return_assign32 a b m vl after_a after_b after_m <->
 ap_record_inplace32 a b m vl after_a after_b after_m.
Proof.
 intros;unfold ap_record_return_assign32,ap_record_inplace32;split.
 - intros [returned [Hr [He [Hb Hm]]]];subst after_a;auto.
 - intros [Hr [Hb Hm]];exists after_a;auto.
Qed.

(* No floating equality, VL policy, or inactive-lane restriction is added.
   The actual C helper must separately prove that its stores implement this
   relation and consume exactly the old target-field ownership. *)
Print Assumptions ap_record_assignment_lowering32.
