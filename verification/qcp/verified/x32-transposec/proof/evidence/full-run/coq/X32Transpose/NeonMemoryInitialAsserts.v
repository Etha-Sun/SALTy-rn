From Coq Require Import ZArith Lia.
From X32Transpose Require Import NeonAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_neon_entail_wit_1: test_neon_entail_wit_1.
Proof.
 unfold test_neon_entail_wit_1;intros;subst.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 pose proof PreH1 as Hentry.
 destruct Hentry as[[Hw[Hh[His[Hos[Hout Hin]]]]]Rest].
 unfold xt_mod64 in *;unfold unsigned_last_nbits.
 change(2^64)with 18446744073709551616.
 replace(xt_height G*4)with(4*xt_height G)by ring.
 replace(xt_width G*4)with(4*xt_width G)by ring.
 unfold derivable1,orp,andp,coq_prop;intros m Hheap.
 destruct Hout as[Hout|Hout];destruct Hin as[Hin|Hin];
 intuition (try reflexivity;try lia).
Qed.
Print Assumptions xt_proof_test_neon_entail_wit_1.
