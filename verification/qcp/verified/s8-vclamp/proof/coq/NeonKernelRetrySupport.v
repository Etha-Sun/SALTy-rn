From Coq Require Import ZArith Lia.
From S8Clamp Require Export NeonKernelSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac s8_neon_retry_close := rewrite ?Z.quot_1_r in *;unfold UndefStructPreduint8x8_t;s8_neon_close.
Ltac s8_neon_byte_ranges lo hi :=
 let Hlo := fresh "byte_lo_range" in let Hhi := fresh "byte_hi_range" in
 pose proof (s8_narrow_range lo) as Hlo;
 pose proof (s8_narrow_range hi) as Hhi;
 unfold s8_narrow in *.
Ltac s8_neon_bits_false :=
 match goal with H : (Z.land _ _)=0 |- _ => vm_compute in H;discriminate end.

Ltac s8_neon_split_undef m :=
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 lazymatch goal with |- ?P |-- ?Q =>
  lazymatch P with context [CharArray.undef_full ?p ?n] =>
   lazymatch Q with context [CharArray.undef_full ?post (n-m)] =>
    let H := fresh "split_undef" in
    pose proof (CharArray.undef_full_split_to_undef_full p m n) as H;
    unfold StoreCharAsElement.sizeA in H;rewrite sizeof_char in H;
    replace (p+m*1) with post in H by lia;
    sep_apply_l_atomic H;[dump_pre_spatial;lia|s8_neon_retry_close]
   end
  end
 end.

Ltac s8_neon_norm_addr p :=
 lazymatch p with
 | Z.add _ _ => ring_simplify p
 | Z.sub _ _ => ring_simplify p
 | Z.mul _ _ => ring_simplify p
 | _ => idtac
 end.
Ltac s8_neon_norm_heap P :=
 lazymatch P with
 | (?p # Char |->_) => s8_neon_norm_addr p
 | (?p # UChar |->_) => s8_neon_norm_addr p
 | (?p # Char |-> ?v) => s8_neon_norm_addr p
 | (?p # UChar |-> ?v) => s8_neon_norm_addr p
 | ?P1 && ?P2 => s8_neon_norm_heap P1;s8_neon_norm_heap P2
 | ?P1 ** ?P2 => s8_neon_norm_heap P1;s8_neon_norm_heap P2
 | _ => idtac
 end.
Ltac s8_neon_normalized_close :=
 rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 lazymatch goal with |- ?P |-- ?Q =>
  s8_neon_norm_heap P;s8_neon_norm_heap Q
 end;
 unfold UndefStructPreduint8x8_t;neon_frame.
