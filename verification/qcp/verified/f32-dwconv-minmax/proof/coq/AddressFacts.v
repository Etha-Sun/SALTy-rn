From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Definition dw_addr_modulus:Z:=18446744073709551616.
Definition dw_addr_word(x:Z):Z:=x mod dw_addr_modulus.
(* This extends unsigned address rotation to a genuine bijection on all Z,
   retaining the quotient block. It agrees with uintptr_t rotation on every
   actual canonical machine address, without excluding wrapping schedules. *)
Definition dw_translate(delta p:Z):Z:=
 dw_addr_modulus*(p/dw_addr_modulus)+dw_addr_word(p+delta).
Lemma dw_addr_word_range:forall x,0<=dw_addr_word x<dw_addr_modulus.
Proof. intro;unfold dw_addr_word;apply Z.mod_pos_bound;unfold dw_addr_modulus;lia. Qed.
Lemma dw_addr_word_small:forall x,0<=x<dw_addr_modulus->dw_addr_word x=x.
Proof. unfold dw_addr_word;intros;apply Z.mod_small;assumption. Qed.
Lemma dw_addr_word_add_l:forall x y,
 dw_addr_word(dw_addr_word x+y)=dw_addr_word(x+y).
Proof. unfold dw_addr_word;intros;apply Z.add_mod_idemp_l;unfold dw_addr_modulus;lia. Qed.
Lemma dw_addr_shift_cancel:forall x d,
 dw_addr_word(dw_addr_word(x+d)-d)=dw_addr_word x.
Proof. intros;replace(dw_addr_word(x+d)-d)with(dw_addr_word(x+d)+(-d))by ring.
 rewrite dw_addr_word_add_l;f_equal;ring. Qed.
Lemma dw_translate_quotient:forall d p,
 dw_translate d p/dw_addr_modulus=p/dw_addr_modulus.
Proof.
 intros;unfold dw_translate;rewrite(Z.mul_comm dw_addr_modulus(p/dw_addr_modulus)).
 rewrite Z.div_add_l by(unfold dw_addr_modulus;lia).
 rewrite(Z.div_small(dw_addr_word(p+d))dw_addr_modulus(dw_addr_word_range(p+d)));lia.
Qed.
Lemma dw_translate_remainder:forall d p,
 dw_translate d p mod dw_addr_modulus=dw_addr_word(p+d).
Proof.
 intros;unfold dw_translate.
 replace(dw_addr_modulus*(p/dw_addr_modulus)+dw_addr_word(p+d))with
 (dw_addr_word(p+d)+(p/dw_addr_modulus)*dw_addr_modulus)by ring.
 rewrite Z.mod_add by(unfold dw_addr_modulus;lia).
 apply Z.mod_small;apply dw_addr_word_range.
Qed.
Lemma dw_translate_injective:forall d p q,dw_translate d p=dw_translate d q->p=q.
Proof.
 intros d p q H.
 pose proof(f_equal(fun x=>x/dw_addr_modulus)H)as Hdiv.
 cbn beta in Hdiv;rewrite !dw_translate_quotient in Hdiv.
 pose proof(f_equal(fun x=>x mod dw_addr_modulus)H)as Hmod.
 cbn beta in Hmod;rewrite !dw_translate_remainder in Hmod.
 assert(Hword:dw_addr_word p=dw_addr_word q).
 { rewrite <-(dw_addr_shift_cancel p d),<-(dw_addr_shift_cancel q d);now rewrite Hmod. }
 unfold dw_addr_word in Hword.
 pose proof(Z.div_mod p dw_addr_modulus ltac:(unfold dw_addr_modulus;lia)).
 pose proof(Z.div_mod q dw_addr_modulus ltac:(unfold dw_addr_modulus;lia)).
 lia.
Qed.
Lemma dw_translate_canonical:forall d p,0<=p<dw_addr_modulus->
 dw_translate d p=dw_addr_word(p+d).
Proof. intros;unfold dw_translate;rewrite Z.div_small by assumption;ring. Qed.
Lemma dw_translate_write_address:forall out1 out2 pixel stride byte_offset,
 let a:=dw_addr_word(out1+pixel*stride)+byte_offset in
 let b:=dw_addr_word(out2+pixel*stride)+byte_offset in
 0<=a<dw_addr_modulus->0<=b<dw_addr_modulus->
 dw_translate(out2-out1)a=b.
Proof.
 intros out1 out2 pixel stride byte_offset a b Ha Hb.
 rewrite dw_translate_canonical by assumption.
 assert(H:dw_addr_word(a+(out2-out1))=dw_addr_word b).
 { unfold a,b.
   replace(dw_addr_word(out1+pixel*stride)+byte_offset+(out2-out1))with
   (dw_addr_word(out1+pixel*stride)+(byte_offset+(out2-out1)))by ring.
   rewrite !dw_addr_word_add_l;f_equal;ring. }
 rewrite H;apply dw_addr_word_small;assumption.
Qed.
Print Assumptions dw_translate_injective.
Print Assumptions dw_translate_write_address.
