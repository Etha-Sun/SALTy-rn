From Coq Require Import ZArith List Lia.
From X32Packw Require Import RvvAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_rvv_odd_entail_wit_2:pw_rvv_odd_entail_wit_2.
Proof. unfold pw_rvv_odd_entail_wit_2.
 first[left|idtac];intros;pw_rvv_normalize;pw_rvv_facts.
 assert(Erem:unsigned_last_nbits(k-retval)64=k-retval)by(apply unsigned_last_nbits_eq;change(0<=k-retval<18446744073709551616);lia).
 assert(Edouble:unsigned_last_nbits(2*retval)64=2*retval)by(apply unsigned_last_nbits_eq;change(0<=2*retval<18446744073709551616);lia).
 rewrite Erem,Edouble.
 replace(kc_pre-(k-retval))with(kc_pre-k+retval)by lia.
 erewrite pw_odd_rvv_progress by(eassumption||lia);entailer!.
Qed.
Print Assumptions checked_pw_rvv_odd_entail_wit_2.
