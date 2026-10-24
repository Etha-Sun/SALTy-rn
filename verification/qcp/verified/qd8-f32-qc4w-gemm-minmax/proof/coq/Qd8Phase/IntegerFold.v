From Coq Require Import ZArith List Lia.
Import ListNotations.
Open Scope Z_scope.
(* Mathematical model of QD8's machine-integer K phase only.
   Connecting actual intrinsic C bodies and packed resources is still open. *)
Definition modulus : Z := 4294967296.
Definition wrap32 (x:Z) : Z := x mod modulus.
Definition mac32 (acc a b:Z) : Z := wrap32 (acc+a*b).
Fixpoint dot32 (acc:Z) (terms:list (Z*Z)) : Z :=
 match terms with [] => acc | (a,b)::xs => dot32 (mac32 acc a b) xs end.
Lemma modulus_positive : 0 < modulus.
Proof. unfold modulus; lia. Qed.
Lemma wrap32_range : forall x, 0 <= wrap32 x < modulus.
Proof. intro x;unfold wrap32;apply Z.mod_pos_bound;exact modulus_positive. Qed.
Lemma mac32_normalize : forall acc a b, mac32 (wrap32 acc) a b=mac32 acc a b.
Proof.
 intros;unfold mac32,wrap32.
 rewrite Z.add_mod_idemp_l by (unfold modulus;lia). reflexivity.
Qed.
Lemma signed_i8_product_fits_i32 : forall a b,
 -128<=a<=127 -> -128<=b<=127 -> -2147483648<=a*b<=2147483647.
Proof. intros; nia. Qed.
Lemma dot32_chunk : forall xs ys acc,
 dot32 acc (xs++ys)=dot32 (dot32 acc xs) ys.
Proof. induction xs as [|[a b] xs IH];intros;cbn;[reflexivity|apply IH]. Qed.
Fixpoint sum_products (terms:list (Z*Z)) : Z :=
 match terms with []=>0 | (a,b)::xs=>a*b+sum_products xs end.
Lemma dot32_as_single_mod : forall terms acc,
 wrap32 (dot32 acc terms)=wrap32 (acc+sum_products terms).
Proof.
 induction terms as [|[a b] xs IH];intro acc;cbn.
 - rewrite Z.add_0_r;reflexivity.
 - rewrite IH;unfold mac32,wrap32.
   rewrite Z.add_mod_idemp_l by (unfold modulus;lia).
   f_equal;ring.
Qed.
Definition signed32 (u:Z) : Z := if u <? 2147483648 then u else u-modulus.
Lemma signed32_range : forall x,
 -2147483648 <= signed32 (wrap32 x) <= 2147483647.
Proof.
 intro x;pose proof (wrap32_range x);unfold signed32.
 destruct (wrap32 x <? 2147483648) eqn:E.
 - apply Z.ltb_lt in E;lia.
 - apply Z.ltb_ge in E;unfold modulus in *;lia.
Qed.
Lemma signed32_mod_identity : forall x,
 wrap32 (signed32 (wrap32 x))=wrap32 x.
Proof.
 intro x;unfold signed32;destruct (wrap32 x <? 2147483648).
 - unfold wrap32;rewrite Z.mod_mod by (unfold modulus;lia);reflexivity.
 - unfold wrap32;rewrite Zminus_mod.
   rewrite Z.mod_same by (unfold modulus;lia).
   rewrite Z.sub_0_r. rewrite Z.mod_mod by (unfold modulus;lia).
   rewrite Z.mod_mod by (unfold modulus;lia). reflexivity.
Qed.
Print Assumptions mac32_normalize.
Print Assumptions signed_i8_product_fits_i32.
Print Assumptions dot32_chunk.
Print Assumptions dot32_as_single_mod.
Print Assumptions signed32_mod_identity.
