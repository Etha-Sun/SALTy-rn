From Coq Require Import ZArith Lia.
From Qu8Cvt Require Export ProgramFacts.
Local Open Scope Z_scope.
Lemma cvt_unsigned_active_chain : forall (i vl x z:Z)(scale:fp32),
 i<vl ->
 cvt_active_mul i vl(cvt_active_float i vl(cvt_active_int i vl
 (cvt_s16(cvt_active_add_u16 i vl(cvt_active_int i vl x)(cvt_seed_u16 z)))))scale
 =cvt_neon_lane x z scale.
Proof.
 intros i vl x z scale Hi;assert(Hlt:Z.ltb i vl=true)by(apply Z.ltb_lt;lia).
 unfold cvt_active_mul,cvt_active_float,cvt_active_int,cvt_active_add_u16.
 rewrite Hlt. rewrite cvt_unsigned_delta. reflexivity.
Qed.
Print Assumptions cvt_unsigned_active_chain.
