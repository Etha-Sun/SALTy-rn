From X32Transpose Require Export WordModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Definition xt_signed_stride64(s:Z):Z:=if Z.ltb s 9223372036854775808 then s else s-18446744073709551616.
Lemma xt_signed_stride64_range:forall s,0<=s<18446744073709551616->
 -9223372036854775808<=xt_signed_stride64 s<9223372036854775808.
Proof. intros s H;unfold xt_signed_stride64;destruct(Z.ltb_spec s 9223372036854775808);lia. Qed.
Lemma xt_signed_stride64_bits:forall s,0<=s<18446744073709551616->
 unsigned_last_nbits(xt_signed_stride64 s)64=s.
Proof.
 intros s H;unfold xt_signed_stride64,unsigned_last_nbits;change(2^64)with 18446744073709551616.
 destruct(Z.ltb_spec s 9223372036854775808).
 - apply Z.mod_small;exact H.
 - replace(s-18446744073709551616)with(s+(-1)*18446744073709551616)by ring.
   rewrite Z.mod_add by lia;apply Z.mod_small;exact H.
Qed.
Lemma xt_signed_stride64_address:forall p s j,
 xt_addr p(xt_signed_stride64 s)j=xt_addr p s j.
Proof.
 intros;unfold xt_signed_stride64;destruct(Z.ltb_spec s 9223372036854775808);[reflexivity|].
 unfold xt_addr,xt_mod64.
 replace(p+(s-18446744073709551616)*j)with((p+s*j)+(-j)*18446744073709551616)by ring.
 rewrite Z.mod_add by lia;reflexivity.
Qed.
Print Assumptions xt_signed_stride64_range.
Print Assumptions xt_signed_stride64_bits.
Print Assumptions xt_signed_stride64_address.
