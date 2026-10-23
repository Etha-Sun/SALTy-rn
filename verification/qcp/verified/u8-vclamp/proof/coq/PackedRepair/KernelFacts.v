From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma u8_mask_prefix : forall n, Z.land n(Z.lnot 63)=u8_prefix_n n.
Proof.
 intro n;change 63 with(Z.ones 6);rewrite <- Z.ldiff_land.
 rewrite Z.ldiff_ones_r by lia.
 rewrite Z.shiftl_mul_pow2,Z.shiftr_div_pow2 by lia.
 reflexivity.
Qed.
Lemma u64_identity : forall x,0<=x<18446744073709551616 -> unsigned_last_nbits x 64=x.
Proof. intros x H;unfold unsigned_last_nbits;change(2^64)with 18446744073709551616;apply Z.mod_small;lia. Qed.
Print Assumptions u8_mask_prefix.
Print Assumptions u64_identity.
